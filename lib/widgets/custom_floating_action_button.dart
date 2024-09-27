import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;

  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor = Colors.blueAccent,
    this.icon = Icons.add, // Default icon can be a plus sign
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon), // Use the provided icon
      backgroundColor: backgroundColor, // Customize the background color
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
      body: Center(
        child: const Text('Press the button below!'),
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
