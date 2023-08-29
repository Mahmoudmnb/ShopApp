import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.onTap, required this.imageUrl});

  final void Function() onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
