import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final double amountLeft;
  final double totalAmount;

  const GoalCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.amountLeft,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).primaryColor,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and description
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),

            // Progress text and bar
            const Text(
              'Progress',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    
                    minHeight: 10,
                    value: progress,
                    backgroundColor: Colors.grey[700],
                    valueColor:  AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  (progress * totalAmount).toStringAsFixed(0),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '\$${amountLeft.toStringAsFixed(0)} left',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
