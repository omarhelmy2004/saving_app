import 'package:flutter/material.dart';
import 'package:saving_app/widgets/list_view_padding.dart';
import 'package:saving_app/widgets/toggle_switch.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListViewPadding(
        children: [
          CustomToggleSwitch(
            labels: const ['All', 'Outcome', 'Income'],
            initialIndex: 0, // Default to 'All'
            onToggle: (index) {
              if (index == 1) {
                
              }
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
