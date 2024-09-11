import 'package:flutter/material.dart';
import 'package:saving_app/constants/colors.dart';
import 'package:saving_app/widgets/line_chart.dart';
import 'package:saving_app/widgets/list_view_padding.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListViewPadding(
      children: [
        LineChartSample2(lineColor: greyColor!, mainChartsColor: mainChartsColor,)
    ],
    );
  }
}