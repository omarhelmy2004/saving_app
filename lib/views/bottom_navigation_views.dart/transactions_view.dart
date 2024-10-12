import 'package:flutter/material.dart';
import 'package:saving_app/widgets/list_view_padding.dart';
import 'package:saving_app/widgets/toggle_switch.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListViewPadding(
        children: [
          CustomToggleSwitch(
            labels: const ['All', 'Outcome', 'Income'],
            initialIndex: 0, // Default to 'All'
            onToggle: (index) {
              // Handle the toggle switch change here
              print("Selected index: $index");
              // Add your logic based on the selected index
            },
          ),
        ],
      ),
    );
  }
}
