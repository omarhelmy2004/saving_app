import 'package:flutter/material.dart';
import 'package:saving_app/widgets/list_view_padding.dart';
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
    
      body: ListViewPadding(
        children: [
           CustomToggleSwitch (
            labels: const ['All', 'Outcome', 'Income'],
            initialIndex: transactionType, // Default to 'All'
            onToggle: (index)   {
              transactionType = index;
              setState(() {
                
              });
             
              
              // Handle the toggle switch change here
              print("Selected index: $index");
               // Add your logic based on the selected index
              
              
            },
          ),
          SizedBox(
           height: MediaQuery.of(context).size.height,
            child: TransactionsWidget(selectedIndex: transactionType))
        ],
      ),
    );
  }
}
