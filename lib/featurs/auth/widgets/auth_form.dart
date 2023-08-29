import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

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
        BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
          builder: (context, state) {
            bool isSignUP = false;
            if (state is SignUpBlocInitial) {
              isSignUP = true;
            } else if (state is IsSignUp) {
              isSignUP = state.isSignUp;
            }
            return CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }
              },
              text: SwitchBetweenTwoTextWithRotation(
                  isFirestText: isSignUP,
                  firstText: 'SIGN IN',
                  secondText: 'SING UP',
                  textStyle: GoogleFonts.dmSans()),
            );
          },
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
