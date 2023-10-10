import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontFamily: 'DM Sans', fontSize: 14),
          hintText: hintText,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6D6D6),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6D6D6),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6D6D6),
            ),
          ),
        ),
      ),
    );
  }
}
