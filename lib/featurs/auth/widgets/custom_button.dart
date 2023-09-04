import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/featurs/auth/blocs/auth_blocs.dart';
import 'package:sizer_pro/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final Widget text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInLoadingBloc, SignInLoadingState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: Constant.duration,
          width: state is IsLoading
              ? state.isLoading
                  ? 9.h
                  : 40.w
              : 40.w,
          height: 6.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF252525),
              ),
              onPressed: state is IsLoading
                  ? state.isLoading
                      ? null
                      : onPressed
                  : onPressed,
              child: text),
        );
      },
    );
  }
}
