import 'package:flutter/material.dart';
import 'package:saving_app/widgets/toggle_switch.dart';
import 'package:saving_app/widgets/transactions_widget.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  int transactionType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(

          children: [
             Padding(
               padding: const EdgeInsets.only(bottom: 10.0),
               child: CustomToggleSwitch (
                labels: const ['All', 'Outcome', 'Income'],
                initialIndex: transactionType, // Default to 'All'
                onToggle: (index)   {
                  transactionType = index;
                  setState(() {});
                  // Handle the toggle switch change here
                  print("Selected index: $index");
                   // Add your logic based on the selected index
                },
                           ),
             ),
            Expanded(child: TransactionsWidget(selectedIndex: transactionType)),
          ],
        ),
      ),
    );
  }
}
