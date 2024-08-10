import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText({super.key, required this.text,  this.fontSize = 24});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return  Text(
            text,
            style:  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          );
  }
}