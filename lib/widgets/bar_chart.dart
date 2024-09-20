import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key,  this.mustBarColor = Colors.red,  this.needBarColor = Colors.green,  this.wantBarColor = Colors.blue,  this.avgColor = Colors.grey});
  final Color mustBarColor;  // = Colors.blue;  // Color for Must
  final Color needBarColor;  // = Colors.green;  // Color for Need
  final Color wantBarColor;  // = Colors.red;    // Color for Want
  final Color avgColor;  // = Colors.orange;      // Color for Average

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 8;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12, 8);
    final barGroup2 = makeGroupData(1, 16, 10, 5);
    final barGroup3 = makeGroupData(2, 18, 5, 3);
    final barGroup4 = makeGroupData(3, 20, 16, 12);
    final barGroup5 = makeGroupData(4, 17, 6, 9);
    final barGroup6 = makeGroupData(5, 19, 1.5, 2);
    final barGroup7 = makeGroupData(6, 10, 1.5, 4);

    rawBarGroups = [barGroup1, barGroup2, barGroup3, barGroup4, barGroup5, barGroup6, barGroup7];
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const BoldText(text: 'Nature of transactions', fontSize: 26,), //text
            const SizedBox(height: 20), // Spacing below the title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryContainer('Must', widget.mustBarColor),
                _buildCategoryContainer('Need', widget.needBarColor),
                _buildCategoryContainer('Want', widget.wantBarColor),
              ],
            ),
            const SizedBox(height: 20), // Spacing before the chart
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: ((group) => Colors.grey),
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                              return rod.copyWith(toY: avg, color: widget.avgColor);
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, getTitlesWidget: bottomTitles, reservedSize: 42),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 28, interval: 1, getTitlesWidget: leftTitles),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2), // Light background color
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14);
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 0, child: Text(text, style: style));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
    );

    return SideTitleWidget(axisSide: meta.axisSide, space: 16, child: text);
  }

  BarChartGroupData makeGroupData(int x, double must, double need, double want) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(toY: must, color: widget.mustBarColor, width: width),
        BarChartRodData(toY: need, color: widget.needBarColor, width: width),
        BarChartRodData(toY: want, color: widget.wantBarColor, width: width),
      ],
    );
  }
}
