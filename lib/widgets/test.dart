import 'package:flutter/material.dart';

class SpendingProgressTest extends StatelessWidget {
  final String title;
  final double progress; // value between 0 and 1

  const SpendingProgressTest({super.key, required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.3, // Adjusting based on screen width
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress, // Progress percentage
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Change this to the color you want
                      borderRadius: BorderRadius.circular(10), // Rounded corners for progress
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
