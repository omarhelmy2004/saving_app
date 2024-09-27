import 'package:flutter/material.dart';

class BudgetItem extends StatelessWidget {
  final String category;
  final String budget;
  final double spentPercentage; // The percentage value (out of 100)
  final double spentAmount;

  const BudgetItem({
    super.key,
    required this.category,
    required this.budget,
    required this.spentPercentage,
    required this.spentAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2, // Flex ratio for the text section
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$$budget budgeted',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2, 
            child: Row(
              children: [
                Container(
                  width: 130, // Set your desired fixed width here
                  height: 8, // Height for the progress bar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[700],
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: spentPercentage / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Adjust this if needed
                Text(
                  '\$${spentAmount.toInt()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
