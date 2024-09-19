import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saving_app/widgets/indicator.dart';

class CustomPieChart extends StatefulWidget {
  final List<Color> colors;
  final List<String> sectionTexts;
  final List<double> sectionValues;
  final double centerSpaceRadius;
  final double radius;

  const CustomPieChart({
    super.key,
    required this.colors,
    required this.sectionTexts,
    required this.sectionValues,
    this.centerSpaceRadius = 50.0,
    this.radius = 60.0,
  });

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Row(
        children: <Widget>[
          const SizedBox(height: 18),
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
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: widget.centerSpaceRadius,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.sectionTexts.length, (index) {
              return Column(
                children: [
                  Indicator(
                    color: widget.colors[index],
                    text: widget.sectionTexts[index],
                    isSquare: true,
                  ),
                  const SizedBox(height: 4),
                ],
              );
            }),
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.sectionValues.length, (i) {
      const fontSize = 16.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: widget.colors[i],
        value: widget.sectionValues[i],
        title: '${widget.sectionValues[i]}%',
        radius: widget.radius,
        titleStyle: const TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }
}
