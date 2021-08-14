import 'dart:math';

import 'package:cubetimer/models/statistics/stat_data.dart';
import 'package:cubetimer/models/statistics/statistics.dart';
import 'package:get/get.dart';

class ChartController extends GetxController {
  // Constructor
  ChartController({
    required this.stats,
  }) {
    _init();
  }

  // Variables
  // Future get initDone => _initDone;
  // List<Record> get records => _track.records;
  static const int numHorizontalLines = 6;
  List<StatData> get data => stats.first.data;
  double maxYVal = 0;
  double minYVal = 0;
  double xInterval = 5;
  double yInterval = 10;

  final List<Statistics> stats;

  void _init() {
    Statistics stat = stats.first;
    maxYVal = 0;
    minYVal = double.infinity;
    for (final data in stat.data) {
      maxYVal = max(maxYVal, data.rawTime.toDouble());
      minYVal = min(minYVal, data.rawTime.toDouble());
    }
    yInterval = max(500, (maxYVal - minYVal) / numHorizontalLines);
    maxYVal += yInterval;
    minYVal = max(0, minYVal - yInterval);

    xInterval = max(1, getXinterval(stat.data.length.toDouble()));
    print(xInterval);
  }

  double getXinterval(double x) {
    if (x >= 10) {
      return getXinterval(x / 10) * 10;
    }
    if (x < 1) {
      return 0.2;
    }
    if (x < 2) {
      return 0.3;
    }
    if (x < 3) {
      return 0.5;
    }
    if (x < 4) {
      return 0.8;
    }
    if (x < 6) {
      return 1;
    }
    if (x < 8) {
      return 1.5;
    }
    return 2;
  }
}
