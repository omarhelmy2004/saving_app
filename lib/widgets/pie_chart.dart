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
    this.centerSpaceRadius = 60.0,
    this.radius = 50.0,
  });

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.5,
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
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 16.0,  // Horizontal space between indicators
            runSpacing: 8.0, // Vertical space between rows of indicators
            alignment: WrapAlignment.center,
            children: List.generate(widget.sectionTexts.length, (index) {
              return Row(
                mainAxisSize: MainAxisSize.min, // Ensure it takes only needed width
                children: [
                  Indicator(
                    color: widget.colors[index],
                    text: widget.sectionTexts[index],
                    isSquare: true,
                  ),
                  const SizedBox(width: 8), // Space between indicator and text
                ],
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
      ],
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
