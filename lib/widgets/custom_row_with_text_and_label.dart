import 'package:flutter/material.dart';


import 'package:saving_app/widgets/custom_double_text_bold_top.dart';

class CustomRowWithTextAndLabel extends StatelessWidget {
  const CustomRowWithTextAndLabel({super.key, required this.topText, required this.textLeft , required this.textRight});
  final String topText;
  final String textLeft;
  final String textRight;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        CustomDoubleTextBoldTop(topText: topText, text: textLeft),
        Text(textRight, style: TextStyle(fontSize: 20),),
       
      ],
      ),
    );
  }
}