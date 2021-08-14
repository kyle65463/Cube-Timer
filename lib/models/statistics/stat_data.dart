import 'dart:math';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/multi_stat.dart';
import 'package:cubetimer/models/statistics/single_stat.dart';

class LineChartStatData {
  // Constructor
  LineChartStatData({
    required this.everthing,
    this.otherStats = const [],
  });

  final MultiStatEverything everthing;
  final List<MultiStat> otherStats; // Ao5, Ao12 ...
  double maxY = 0;
  double minY = double.infinity;
  double intervalX = 10;
  double intervalY = 1000;
  final int _numHorizontalLines = 6;

  void prepare([int numRecords = -1]) {
    maxY = 0;
    minY = double.infinity;
    for (final data in everthing.getData(numRecords)) {
      maxY = max(maxY, data);
      minY = min(minY, data);
    }
    intervalY = max(500, (maxY - minY) / _numHorizontalLines);
    intervalX =
        max(1, calIntervalX(everthing.getData(numRecords).length.toDouble()));
    maxY += intervalY;
    minY = max(0, minY - intervalY);
  }

  double calIntervalX(double x) {
    if (x >= 10) return calIntervalX(x / 10) * 10;
    if (x < 1) return 0.2;
    if (x < 2) return 0.3;
    if (x < 3) return 0.5;
    if (x < 4) return 0.8;
    if (x < 6) return 1;
    if (x < 8) return 1.5;
    return 2;
  }
}

class SingleStatTableData {
  // Constructor
  SingleStatTableData({
    required this.records,
  }) {
    _init();
  }

  // Variables
  Map<String, String> get displayedData => _data;
  final List<Record> records;
  final List<SingleStat> _stats = [];
  final Map<String, String> _data = {};

  // Functions
  void _init() {
    _stats.add(SingleStatCount(records: records));
    // _stats.add(SingleStatBest(records: records));
    // _stats.add(SingleStatWorst(records: records));
    // _stats.add(SingleStatMean(records: records));
    // _stats.add(SingleStatDeviation(records: records));
  }

  void prepare([int numRecords = -1]) {
    for (final stat in _stats) {
      _data[stat.toString()] = stat.getData(numRecords);
    }
  }
}
