import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;

  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.blueAccent,
    this.icon = Icons.add, // Default icon can be a plus sign
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed, // Use the provided icon
      backgroundColor: backgroundColor,
      child: Icon(icon), // Customize the background color
    );
  }
}

// Example usage
class CircularFabExample extends StatelessWidget {
  const CircularFabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Circular FAB Example'),
      ),
      body: const Center(
        child: Text('Press the button below!'),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          // Handle your action here
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB Pressed!')),
          );
        },
        icon: Icons.add, // Change this to Icons.attach_money or any other icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Center the FAB
    );
  }
}
