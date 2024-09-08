import 'package:flutter/material.dart';
import 'package:saving_app/widgets/custom_card.dart';

import 'package:saving_app/widgets/spending_progress_bar.dart';
import 'package:saving_app/widgets/three_texts_spending_vertical.dart';

class SpendingProgressWidget extends StatelessWidget {
  const SpendingProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(widgets: [
       ThreeTextsSpendingVertical(topText: 'Spending', spending: '1,203', bottomText: 'Last 30 Days'),
      
      
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
