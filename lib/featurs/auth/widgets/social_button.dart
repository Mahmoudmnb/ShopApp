import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.onTap, required this.imageUrl});

  final void Function() onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 47,
        height: 47,
        padding: const EdgeInsets.all(5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: const Color(0xFF332118).withOpacity(.1)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // child: Image.asset(
        //   imageUrl,
        // )
        child: Text(imageUrl),
      ),
    );
  }
}
