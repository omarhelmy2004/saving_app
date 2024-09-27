import 'package:flutter/material.dart';
import 'package:saving_app/widgets/custom_round_widget.dart';
import 'package:saving_app/widgets/goals.dart';
import 'package:saving_app/widgets/list_view_padding.dart';

class GoalsView extends StatelessWidget {
  final VoidCallback onEdit;

  const GoalsView({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return  ListViewPadding(
      children: [
        const GoalCard( 
          totalAmount: 200,

  title: 'New bike',
  description: 'Save \$500 by September 30, 2023',
 
  progress: 0.4,
  amountLeft: 300,
),

        const SizedBox(height: 20),
         
        CustomRoundedWidget(onEdit: onEdit, text: 'Edit Goals',),
      ],
    );
  }
}

