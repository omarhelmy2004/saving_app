import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';

class ThreeTextsSpendingVertical extends StatelessWidget {
  const ThreeTextsSpendingVertical({super.key, required this.topText, required this.spending, required this.bottomText});
  final String topText;
  final String spending;
  final String bottomText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      BoldText(text: topText , fontSize: 21,),
      const SizedBox(height: 6),
      BoldText(text: '\$$spending', fontSize: 33,),
      const SizedBox(height: 10),
      Text(
            bottomText,
            style: const TextStyle(
              
              fontSize: 16,
            ),),
            const SizedBox(height: 20),
    ],);
  }
}