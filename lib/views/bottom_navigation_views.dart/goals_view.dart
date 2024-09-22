import 'package:flutter/material.dart';
import 'package:saving_app/widgets/goals.dart';
import 'package:saving_app/widgets/list_view_padding.dart';

class GoalsView extends StatelessWidget {
  final VoidCallback onEdit;

  const GoalsView({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return const ListViewPadding(
      children: [
        GoalCard( 
          totalAmount: 200,

  title: 'New bike',
  description: 'Save \$500 by September 30, 2023',
 
  progress: 0.4,
  amountLeft: 300,
),

        SizedBox(height: 20), // Create space between the cards and the button
        // ElevatedButton(
        //   onPressed: onEdit,
        //   child: Text('Edit Goals'),
        //   style: ElevatedButton.styleFrom(
        //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //     backgroundColor: Colors.blueAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
