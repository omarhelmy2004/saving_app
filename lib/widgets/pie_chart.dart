
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:saving_app/widgets/indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5, //padding related maybe also sizes
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 60, // circle size
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Colors.blue, //color changing
                text: 'First',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.yellow, //color changing
                text: 'Second',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.purple, //color changing
                text: 'Third',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.green, //color changing
                text: 'Fourth',
                isSquare: true,
              ),
              Indicator(
                color: Colors.red, //color changing
                text: 'Fourth',
                isSquare: true,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {         // number of things will be added in circle as list

      //unComment if u want on touched animation    
      // final isTouched = i == touchedIndex;
      const fontSize = 16.0; //final fontSize  = isTouched ? 25.0 : 16.0; un comment and remove who isnt commented on left
      const radius = 50.0; //final radius = isTouched ? 60.0 : 50.0; un comment and remove who isnt commented on left

      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue, //color changing
            value: 20,
            title: '40%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white, //color changing text
              shadows: shadows, 
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffFDD835), //color changing
            value: 20,
            title: '30%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white, //color changing text
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple, //color changing
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white, //color changing text
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green, //color changing
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white, //color changing text
              shadows: shadows,
            ),
          );
          case 4:
          return PieChartSectionData(
            color: Colors.red, //color changing
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: const TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white, //color changing text
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}