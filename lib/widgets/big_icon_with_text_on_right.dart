

import 'package:flutter/material.dart';

class BigIconWithTextOnRight extends StatelessWidget {
  const BigIconWithTextOnRight({super.key, required this.text, required this.icon, required this.circleText});
  final String text;
  final Icon icon;
  final String circleText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
             icon,
            
          ],
        ),
        const SizedBox(width: 8), 
         Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(
              text,
              style:  const TextStyle(
                fontSize: 22,
              ),
            ),
          
          ],
        ),
      ],
    );
  }
}




