import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';
import 'package:saving_app/widgets/custom_card.dart';

import 'package:saving_app/widgets/spending_progress_bar.dart';

class SpendingProgressWidget extends StatelessWidget {
  const SpendingProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(widgets: [
      BoldText(text: 'Spending' , fontSize: 21,),
      SizedBox(height: 6),
      BoldText(text: '\$1,203', fontSize: 33,),
      SizedBox(height: 10),
      Text(
            'Last 30 Days',
            style: TextStyle(
              
              fontSize: 16,
            ),),
      SizedBox(height: 20),
      SpendingProgress(title: 'Food', progress: 1),
          SizedBox(height: 10),
          SpendingProgress(title: 'Rent', progress: 0.7),
          SizedBox(height: 10),
          SpendingProgress(title: 'Transport', progress: 0.6),
          SizedBox(height: 10),
          SpendingProgress(title: 'Bills', progress: 0.4),
    ],);
  }
}