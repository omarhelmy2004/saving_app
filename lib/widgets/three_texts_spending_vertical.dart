import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';

class ThreeTextsSpendingVertical extends StatelessWidget {
  const ThreeTextsSpendingVertical({super.key, required this.topText, required this.spending, required this.bottomText,
  this.topTextFont = 24, this.spendingFont = 38 , this.bottomTextFont = 18
  });
  final String topText;
  final double topTextFont;
  final String spending;
  final double spendingFont;
  final String bottomText;
  final double bottomTextFont;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      BoldText(text: topText , fontSize: topTextFont,), 
      const SizedBox(height: 3),
      BoldText(text: '\$$spending', fontSize: spendingFont,), 
      const SizedBox(height: 6),
      Text(            bottomText,
            style:  TextStyle(
              
              fontSize: bottomTextFont, 
            ),),
            const SizedBox(height: 14),
    ],);
  }
}