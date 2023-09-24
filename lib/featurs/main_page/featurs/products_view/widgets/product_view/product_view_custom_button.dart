import 'package:flutter/material.dart';

class ProductViewCustomButton extends StatelessWidget {
  const ProductViewCustomButton({
    super.key,
    required this.onPressed,
    this.elevation,
    this.child,
  });
  final void Function() onPressed;
  final double? elevation;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF252525),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))
            // foregroundColor: Colors.white,
            ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
