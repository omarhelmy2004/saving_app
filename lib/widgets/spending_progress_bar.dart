import 'package:flutter/material.dart';

class SpendingProgress extends StatelessWidget {
  final String title;
  final double progress;

  const SpendingProgress({super.key, required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                
              ),
              
            ),
            Container(
              
              height: 20,
              width: progress * MediaQuery.of(context).size.width * 0.47,
              decoration:  const BoxDecoration(
                color:  Colors.white,
              ),
              
            ),
            Container(
              
              height: 20,
              width: progress * MediaQuery.of(context).size.width * 0.45,
              decoration:  BoxDecoration(
                color: Colors.grey[800],
              ),
              
            ),
          ],
        ),
      ],
    );
  }
}