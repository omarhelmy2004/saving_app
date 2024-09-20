import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Padding inside the button
        textStyle: const TextStyle(fontSize: 16), // Text size
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Text color
          fontWeight: FontWeight.bold, // Bold text
        ),
      ),
    );
  }
}
