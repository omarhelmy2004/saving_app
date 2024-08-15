

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
            Positioned(
              top: -5,
              right: -5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child:  Text(
                  circleText, 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8), 
         Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          
          ],
        ),
      ],
    );
  }
}




