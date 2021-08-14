import 'package:cubetimer/models/statistics/data/line_chart_data.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:cubetimer/utils/extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final List<LineData> lines = data.lines;
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
          child: lines.isEmpty
              ? Center(
                  child: Text(
                    'no data'.tr,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : LineChart(
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
                    lineBarsData: lines.map((line) {
                      final List<FlSpot> spots = line.data
                          .mapIndexed((e, i) =>
                              FlSpot(line.startIndex + i.toDouble(), e))
                          .toList();
                      return LineChartBarData(
                        spots: spots.isEmpty ? [FlSpot(0, 0)] : spots,
                        isCurved: false,
                        colors: [line.color],
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ),
      ),
    );
  }
}
