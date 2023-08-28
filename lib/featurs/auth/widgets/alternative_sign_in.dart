import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer_pro/sizer.dart';

import '../blocs/blocs.dart';
import 'social_button.dart';

class AlternativeSignIn extends StatelessWidget {
  const AlternativeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocBloc, SignUpBlocState>(
      builder: (context, state) {
        return state is IsSignUp
            ? !state.isSignUp
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Center(
                            child: Text(
                          'Or sign In with',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: 'DM Sans',
                            fontSize: 5.sp,
                          ),
                        )),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                              onTap: () {},
                              imageUrl: 'asset/images/apple-50.png'),
                          const SizedBox(width: 20),
                          SocialButton(
                              onTap: () {},
                              imageUrl: 'asset/images/google-48.png'),
                          const SizedBox(width: 20),
                          SocialButton(
                              onTap: () {},
                              imageUrl: 'asset/images/facebook-60.png'),
                        ],
                      ),
                      SizedBox(height: 5.h),
                    ],
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink();
      },
    );
  }
}
