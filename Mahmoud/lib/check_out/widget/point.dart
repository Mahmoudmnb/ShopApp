import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class Point extends StatelessWidget {
  const Point({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 4,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: const Color(0xFFC8C7CC),
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
