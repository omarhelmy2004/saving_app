import 'package:flutter/material.dart';
import 'package:saving_app/constants/colors.dart';
import 'package:saving_app/widgets/line_chart.dart';
import 'package:saving_app/widgets/three_texts_spending_vertical.dart';

class AnalysisWithLineChart extends StatelessWidget {
  const AnalysisWithLineChart({super.key,
  // required this.topText, required this.spending, required this.bottomText
  });
  // final String topText;
  // final String spending;
  // final String bottomText;
  @override
  Widget build(BuildContext context) {
    return Container(
        
        padding: const EdgeInsets.symmetric( vertical: 28),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThreeTextsSpendingVertical(topText: 'Spending', spending: '1,203', bottomText: 'Last 30 Days'),
            //ThreeTextsSpendingVertical(topText: topText, spending: spending, bottomText: bottomText),
            LineChartSample(lineColor: Colors.white, mainChartsColor: mainChartsColor,)
          ],),
        );
  }
}