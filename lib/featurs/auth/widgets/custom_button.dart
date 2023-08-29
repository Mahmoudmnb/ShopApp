import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final Widget text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 6.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF252525),
          ),
          onPressed: onPressed,
          child: text),
    );
  }
}
