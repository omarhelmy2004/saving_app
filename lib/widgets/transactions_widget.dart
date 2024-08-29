
import 'package:flutter/material.dart';
import 'package:saving_app/widgets/custom_row_with_text_and_label.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomRowWithTextAndLabel(topText: 'Transfer to bank', textLeft: 'mar 25', textRight: '\$200'),
        CustomRowWithTextAndLabel(topText: 'Transfer to bank', textLeft: 'mar 25', textRight: '\$200'),
        CustomRowWithTextAndLabel(topText: 'Transfer to bank', textLeft: 'mar 25', textRight: '\$200'),
      ],
    );
  }
}