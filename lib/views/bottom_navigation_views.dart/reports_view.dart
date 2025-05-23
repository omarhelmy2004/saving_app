import 'package:flutter/material.dart';
import 'package:saving_app/constants/colors.dart';
import 'package:saving_app/widgets/analysis_with_line_chart.dart';
import 'package:saving_app/widgets/bar_chart.dart';
import 'package:saving_app/widgets/custom_card.dart';
import 'package:saving_app/widgets/list_view_padding.dart';
import 'package:saving_app/widgets/pie_chart.dart';


class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListViewPadding(
      children: [
        AnalysisWithLineChart(topText: 'Account Balance',spending: '1,200',bottomText: 'Last 30 Days',
          lineColor: Colors.white,mainChartsColor: mainChartsColor,
        ),
       const CustomPieChart(
          colors: pieChartColors, // Using the color palette here
          sectionTexts: ['First', 'Second', 'Third', 'Entertainment', 'Fifth'],
          sectionValues: [40, 30, 15, 10, 5],
          centerSpaceRadius: 50.0,
          radius: 60.0,
        ),
       const Padding(
         padding: EdgeInsets.only(top: 20),
         child: CustomCard(widgets: [
          BarChartSample2()
         ]),
       )


    ],
    );
  }
}


//pie chart color palletes
// Light Blue - #4FC3F7
// Orange - #FF7043
// Purple - #AB47BC
// Green - #66BB6A
// Yellow - #FFEB3B
// Red - #EF5350
// Teal - #26A69A
// Pink - #EC407A
// Lime Green - #CDDC39
// Deep Purple - #7E57C2