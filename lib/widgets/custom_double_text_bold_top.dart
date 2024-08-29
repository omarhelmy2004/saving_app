import 'package:flutter/material.dart';



class CustomDoubleTextBoldTop extends StatelessWidget {
  const CustomDoubleTextBoldTop({super.key, required this.topText, required this.text,  this.bottomTextColor = Colors.grey});
  final String topText;
  final String text;
  final Color bottomTextColor;
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(topText, style: TextStyle(fontSize: 21),),
       
          Text(text, style:  TextStyle(color: bottomTextColor, fontSize: 16),),
        ],
        );
  }
}