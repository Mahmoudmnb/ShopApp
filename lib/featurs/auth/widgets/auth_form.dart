import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/featurs/auth/data.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toast/toast.dart';

import '../blocs/blocs.dart';
import 'widgets.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late TextEditingController nameCon;
  late TextEditingController emailCon;
  late TextEditingController passwordCon;
  late TextEditingController confirmPasswordcon;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    nameCon = TextEditingController();
    emailCon = TextEditingController();
    passwordCon = TextEditingController();
    confirmPasswordcon = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    nameCon.dispose();
    emailCon.dispose();
    passwordCon.dispose();
    confirmPasswordcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Enter your name',
                  controller: nameCon,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Email address',
                  controller: emailCon,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordCon,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordcon,
                ),
                SizedBox(height: 3.h),
              ],
            )),
        BlocBuilder<SignUpBloc, SignUpBlocState>(
          builder: (context, state) {
            bool isSignUP = false;
            if (state is SignUpBlocInitial) {
              isSignUP = true;
            } else if (state is IsSignUp) {
              isSignUP = state.isSignUp;
            }
            return CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  String name = Data.name;
                  String email = Data.email;
                  String password = Data.password;
                  if (isSignUP) {
                    signUp(email, password);
                  } else {
                    signIn(email, password);
                  }
                }
              },
              text: BlocBuilder<SignInLoadingBloc, SignInLoadingState>(
                builder: (context1, state1) {
                  bool isLoading = false;
                  if (state1 is IsLoading) {
                    if (state1.isLoading) {
                      isLoading = true;
                    }
                  }
                  return isLoading
                      ? const CircularProgressIndicator()
                      : SwitchBetweenTwoTextWithRotation(
                          isFirestText: isSignUP,
                          firstText: 'SIGN IN',
                          secondText: 'SING UP',
                          textStyle: GoogleFonts.dmSans());
                },
              ),
            );
          },
        ),
        SizedBox(height: 1.h),
      ],
    );
  }

  signIn(String email, String password) async {
    changeButtonLoadingState(true);
    SupabaseClient supabase = Supabase.instance.client;
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);
      changeButtonLoadingState(false);
    } on AuthException {
      changeButtonLoadingState(false);
      Toast.show('Invalid email or password', duration: 2);
    }
  }

  signUp(String email, String password) async {
    changeButtonLoadingState(true);
    SupabaseClient supabase = Supabase.instance.client;
    try {
      await supabase.auth.signUp(password: password, email: email);
      changeButtonLoadingState(false);
    } on AuthException catch (error) {
      changeButtonLoadingState(false);
      Toast.show(error.message, duration: 2);
    }
  }

  changeButtonLoadingState(bool isLoading) {
    context
        .read<SignInLoadingBloc>()
        .add(ChangeLoadingState(isLoading: isLoading));
  }
}
