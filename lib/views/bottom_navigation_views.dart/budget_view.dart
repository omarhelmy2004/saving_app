import 'package:flutter/material.dart';
import 'package:saving_app/widgets/budget_item.dart';
import 'package:saving_app/widgets/custom_button.dart';
import 'package:saving_app/widgets/list_view_padding.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListViewPadding(
        children: [
          const BudgetItem(
            category: 'Food & Drink',
            budget: '1,000',
            spentPercentage: 60,
            spentAmount: 600,
          ),
          const BudgetItem(
            category: 'Shopping',
            budget: '900',
            spentPercentage: 90,
            spentAmount: 810,
          ),
          const BudgetItem(
            category: 'Entertainment',
            budget: '500',
            spentPercentage: 20,
            spentAmount: 100,
          ),
          const BudgetItem(
            category: 'Transportation',
            budget: '500',
            spentPercentage: 40,
            spentAmount: 200,
          ),
          const BudgetItem(
            category: 'Travel',
            budget: '200',
            spentPercentage: 10,
            spentAmount: 20,
          ),
          const BudgetItem(
            category: 'Health & Fitness',
            budget: '100',
            spentPercentage: 70,
            spentAmount: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16), // Space around the buttons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Add a budget',
                  onPressed: () {
                    // Add button functionality here
                  },
                  backgroundColor: Colors.blueAccent, // Button background color for Add
                  textColor: Colors.white, // Text color
                ),
                CustomButton(
                  text: 'Edit',
                  onPressed: () {
                    // Edit button functionality here
                  },
                  backgroundColor: Colors.grey[900]!, // Button background color for Edit
                  textColor: Colors.white, // Text color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
