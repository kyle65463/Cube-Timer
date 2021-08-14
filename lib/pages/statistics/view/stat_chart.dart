import 'package:cubetimer/models/statistics/stat_data.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:cubetimer/utils/extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatChart extends StatelessWidget {
  // Constructor
  const StatChart({
    required this.data,
    Key? key,
  }) : super(key: key);

  // Variables
  final LineChartStatData data;

  // Functions
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.brown[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: false),
              gridData: FlGridData(
                show: true,
                horizontalInterval: data.intervalY,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.brown[200],
                    strokeWidth: 2,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  interval: data.intervalX,
                  reservedSize: 5,
                  margin: 10,
                ),
                leftTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  interval: data.intervalY,
                  getTitles: (value) {
                    final String displayTime =
                        TimerUtils.parseTime(value.toInt(), milli: false);
                    return displayTime;
                  },
                  reservedSize: 5,
                  margin: 10,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.brown[200]!,
                    width: 2,
                  ),
                ),
              ),
              maxY: data.maxY,
              minY: data.minY,
              minX: 0,
              lineBarsData: [
                LineChartBarData(
                  spots: data.everthing
                          .getData()
                          .mapIndexed((e, i) => FlSpot(i.toDouble() + 1, e))
                          .toList()
                          .isEmpty
                      ? [FlSpot(0, 0)]
                      : data.everthing
                          .getData()
                          .mapIndexed((e, i) => FlSpot(i.toDouble() + 1, e))
                          .toList(),
                  isCurved: false,
                  colors: [Colors.lightBlue[800]!],
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
