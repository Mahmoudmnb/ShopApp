import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_card.dart';
import 'custom_icon_button.dart';

class SimilarItem extends StatelessWidget {
  const SimilarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCard(width: 50.w, height: 30.347.h),
        Positioned(
          right: 12,
          top: 12,
          child: CustomIconButton(
            size: 20,
            icon: const Icon(Icons.favorite_outline_rounded),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
