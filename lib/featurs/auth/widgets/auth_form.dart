import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../blocs/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

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
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Enter your name',
                  controller: nameCon,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Email address',
                  controller: emailCon,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordCon,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordcon,
                ),
                SizedBox(height: 5.h),
              ],
            )),
        BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
          builder: (context, state) {
            return CustomButton(
                text: state is SignUpBlocInitial
                    ? 'SIGN UP'
                    : state is IsSignUp
                        ? state.isSignUp
                            ? 'SIGN UP'
                            : 'SIGN IN'
                        : 'SIGN IN',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                });
          },
        ),
        SizedBox(height: 6.h),
      ],
    );
  }
}
