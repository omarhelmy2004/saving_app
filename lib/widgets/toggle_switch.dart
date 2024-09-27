import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0), // Adjust horizontal padding if needed
      child: ToggleSwitch(
        minWidth: 150.0, // Adjust this value as needed
        minHeight: 45,
        cornerRadius: 20.0,
        activeBgColors: const [
          [Colors.blueAccent], 
          [Colors.blueAccent], 
          [Colors.blueAccent]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey.withOpacity(0.2), // Slightly transparent gray
        inactiveFgColor: Colors.white,
        initialLabelIndex: 0,
        totalSwitches: 3,
        labels: const ['All', 'Outcome', 'Income'],
        radiusStyle: true,
        onToggle: (index) {
          // Handle toggle switch change here
        },
      ),
    );
  }
}
