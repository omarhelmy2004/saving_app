import 'package:flutter/material.dart';
import 'package:saving_app/widgets/line_chart.dart';
import 'package:saving_app/widgets/three_texts_spending_vertical.dart';

class AnalysisWithLineChart extends StatelessWidget {
  const AnalysisWithLineChart({super.key,
  required this.topText, required this.spending, required this.bottomText, required this.mainChartsColor, required this.lineColor
  });
  final String topText;
  final String spending;
  final String bottomText;
  final Color mainChartsColor;
  final Color lineColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        
        padding: const EdgeInsets.only(top: 2, bottom: 28),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            ThreeTextsSpendingVertical(topText: topText, spending: spending, bottomText: bottomText),
            LineChartSample(lineColor: lineColor, mainChartsColor: mainChartsColor,)
          ],),
        );
  }
}