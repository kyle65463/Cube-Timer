import 'dart:math';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/multi_stat.dart';
import 'package:flutter/material.dart';

class LineChartStatData {
  // Constructor
  LineChartStatData({
    required this.records,
  }) {
    _init();
  }

  // Variables
  final List<Record> records;
  final List<MultiStat> _stats = [];
  double maxY = 0;
  double minY = double.infinity;
  double intervalX = 10;
  double intervalY = 1000;
  final int _numHorizontalLines = 6;
  late MultiStatAll _all;

  List<LineData> get lines => _lines;

  List<LineData> _lines = [];

  // Functions
  void _init() {
    _all = MultiStatAll(records: records);
    _stats.add(_all);
  }

  void prepare([int? numRecords]) {
    maxY = 0;
    minY = double.infinity;
    for (final data in _all.getData(numRecords)) {
      maxY = max(maxY, data);
      minY = min(minY, data);
    }
    intervalY = max(500, (maxY - minY) / _numHorizontalLines);
    intervalX =
        max(1, calIntervalX(_all.getData(numRecords).length.toDouble()));
    maxY += intervalY;
    minY = max(0, minY - intervalY);

    // Prepare line data
    _lines = _stats
        .map((e) => LineData(
              name: e.toString(),
              color: Colors.blue,
              startIndex: 1,
              data: e.getData(numRecords),
            ))
        .toList();
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

class LineData {
  // Constructor
  LineData({
    required this.name,
    required this.color,
    required this.startIndex,
    required this.data,
  });

  // Variables
  final int startIndex;
  final String name;
  final Color color;
  final List<double> data;
}
