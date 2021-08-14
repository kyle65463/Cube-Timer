import 'package:cubetimer/models/statistics/data/line_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartLegend extends StatelessWidget {
  // Constructor
  const ChartLegend({
    required this.lineData,
    Key? key,
  }) : super(key: key);

  // Variables
  final LineData lineData;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 15,
        height: 3,
        color: lineData.color,
      ),
      const SizedBox(width: 5),
      Text(lineData.name.tr),
    ]);
  }
}
