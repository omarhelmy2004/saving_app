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
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Increased padding for spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2, // Flex ratio for the text section
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Larger font size for the category
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$$budget budgeted',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16, // Slightly larger font for the budget text
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2, // Flex ratio for the progress bar and spent amount
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8, // Slightly larger height for the progress bar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[700], // Background color for the progress bar
                    ),
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          widthFactor: spentPercentage / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white, // Progress bar color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Increased spacing between the bar and amount
                Text(
                  '\$${spentAmount.toInt()}', // Rounded off the spent amount
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
