import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.fontFamily,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  final String text, fontFamily;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily),
      textAlign: TextAlign.right,
    );
  }
}
