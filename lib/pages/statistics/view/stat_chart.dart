import 'package:cubetimer/models/statistics/statistics.dart';
import 'package:cubetimer/pages/statistics/controller/chart_controller.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatChart extends StatelessWidget {
  // Constructor
  StatChart({
    required this.stats,
    Key? key,
  })  : controller = ChartController(stats: stats),
        super(key: key);

  // Variables
  final List<Statistics> stats;
  final ChartController controller;

  // Functions
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: Color(0xff232d37),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18.0,
            left: 12.0,
            top: 24,
            bottom: 12,
          ),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                horizontalInterval: controller.yInterval,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xff37434d),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  interval: controller.xInterval,
                  margin: 10,
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                    color: Color(0xff67727d),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  interval: controller.yInterval,
                  getTitles: (value) {
                    final String displayTime =
                        TimerUtils.parseTime(value.toInt(), milli: false);
                    return displayTime;
                  },
                  margin: 10,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: const Color(0xff37434d),
                  width: 0,
                ),
              ),
              maxY: controller.maxYVal.toDouble(),
              minY: controller.minYVal.toDouble(),
              minX: 0,
              lineBarsData: [
                LineChartBarData(
                  spots: controller.data
                      .map((e) =>
                          FlSpot(e.index.toDouble() + 1, e.rawTime.toDouble()))
                      .toList(),
                  isCurved: false,
                  colors: [Colors.blue],
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
