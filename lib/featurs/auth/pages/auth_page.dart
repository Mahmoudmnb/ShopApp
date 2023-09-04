import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/auth_blocs.dart';
import '../widgets/auth_widgets.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 96.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.4.w),
              child: Column(
                children: [
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF2E2E2E)),
                        child: Text(
                          'Skip',
                          style: GoogleFonts.dmSans(fontSize: 9.sp),
                        ),
                        onPressed: () {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //   builder: (context) => const HomePage(),
                          // ));
                        },
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 20.h,
                    width: 20.h,
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      SizedBox(width: 1.h),
                      BlocBuilder<SignUpBloc, SignUpBlocState>(
                        builder: (context, state) {
                          bool isSignUp = false;
                          if (state is SignUpBlocInitial) {
                            isSignUp = true;
                          } else if (state is IsSignUp) {
                            isSignUp = state.isSignUp;
                          }
                          return SwitchBetweenTwoTextWithRotation(
                              isFirestText: isSignUp,
                              firstText: 'Sign In',
                              secondText: 'Sign Up',
                              textStyle: GoogleFonts.dmSans(fontSize: 10.sp));
                        },
                      ),
                    ],
                  ),
                  const AuthForm(),
                  SizedBox(height: 1.h),
                  const AlternativeSignIn(),
                  const Expanded(child: SizedBox.shrink()),
                  SizedBox(
                    child: BlocBuilder<SignUpBloc, SignUpBlocState>(
                      builder: (context, state) {
                        bool isSignUp = false;
                        if (state is SignUpBlocInitial) {
                          isSignUp = true;
                        } else if (state is IsSignUp) {
                          isSignUp = state.isSignUp;
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SwitchBetweenTwoText(
                                isFirestText: isSignUp,
                                firstText: '     Don\'t have an account?',
                                secondText: 'Already have an account?',
                                textStyle: GoogleFonts.dmSans()),
                            SizedBox(width: 1.w),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFF646464)),
                              child: SwitchBetweenTwoTextWithRotation(
                                firstText: 'Sign Up',
                                isFirestText: isSignUp,
                                secondText: 'Sign IN',
                                textStyle: GoogleFonts.dmSans(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                if (state is SignUpBlocInitial) {
                                  context.read<SignUpBloc>().add(
                                      ChangeBetweenSignUpOrSignIn(
                                          isSignUp: false));
                                } else if (state is IsSignUp) {
                                  context.read<SignUpBloc>().add(
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
      ),
    );
  }
}
