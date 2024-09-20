import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';

class TextPadding extends StatelessWidget {
  const TextPadding({super.key, required this.text,  this.fontSize = 26});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 20),
            child: BoldText(text: text,fontSize: fontSize,),
          );
  }
}