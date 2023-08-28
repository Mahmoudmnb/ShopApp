import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../blocs/blocs.dart';
import '../widgets/alternative_sign_in.dart';
import '../widgets/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.4.w),
            child: Column(
              children: [
                SizedBox(height: 2.5.h),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF2E2E2E)),
                      child: Text(
                        'Skip',
                        style: TextStyle(fontFamily: 'DM Sans', fontSize: 9.sp),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(color: Colors.black, width: 172, height: 110),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SizedBox(width: 1.h),
                    BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
                      builder: (context, state) {
                        return Text(
                          state is IsSignUp
                              ? state.isSignUp
                                  ? 'Sign Up'
                                  : 'Sign In'
                              : 'Sign Up',
                          style:
                              TextStyle(fontFamily: 'DM Sans', fontSize: 10.sp),
                        );
                      },
                    ),
                  ],
                ),
                const AuthForm(),
                const AlternativeSignIn(),
                SizedBox(
                  child: BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state is IsSignUp
                                ? state.isSignUp
                                    ? 'Already have an account?'
                                    : 'Don\'t have an account?'
                                : 'Already have an account?',
                          ),
                          SizedBox(width: 1.w),
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF646464)),
                            child: Text(
                              state is IsSignUp
                                  ? state.isSignUp
                                      ? 'Sign IN'
                                      : 'Sign UP'
                                  : 'Sing In',
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              if (state is SignUpBlocInitial) {
                                context.read<SignUpBlocBloc>().add(
                                    ChangeBetweenSignUpOrSignIn(
                                        isSignUp: false));
                              } else if (state is IsSignUp) {
                                context.read<SignUpBlocBloc>().add(
                                    ChangeBetweenSignUpOrSignIn(
                                        isSignUp: !state.isSignUp));
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
