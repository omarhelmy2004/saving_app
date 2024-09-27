
import 'package:flutter/material.dart';

class CustomRoundedWidget extends StatelessWidget {
  const CustomRoundedWidget({
    super.key,
    required this.onEdit, required this.text,
  });

  final VoidCallback onEdit;

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onEdit,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child:  Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),  ),
    );
  }
}