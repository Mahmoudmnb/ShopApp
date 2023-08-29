import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

import '../blocs/blocs.dart';
import 'widgets.dart';

class AlternativeSignIn extends StatelessWidget {
  const AlternativeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
      builder: (context, state) {
        bool isSignUp = false;
        if (state is SignUpBlocInitial) {
          isSignUp = true;
        } else if (state is IsSignUp) {
          isSignUp = state.isSignUp;
        }
        return Column(
          children: [
            HideItem(
                maxHight: 3.h,
                visabl: !isSignUp,
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                      child: Text(
                    'Or sign In with',
                    style: GoogleFonts.dmSans(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 5.sp,
                    ),
                  )),
                )),
            SizedBox(height: 2.h),
            HideItem(
              maxHight: 15.h,
              visabl: !isSignUp,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                        onTap: () {},
                        imageUrl: 'assets/images/linkedin_logo.png'),
                    SocialButton(
                        onTap: () {}, imageUrl: 'assets/images/google_logo.png'),
                    SocialButton(
                        onTap: () {},
                        imageUrl: 'assets/images/git_hub_logo.png'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
