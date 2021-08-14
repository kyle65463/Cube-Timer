import 'dart:collection';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/statistics.dart';
import 'package:flutter/material.dart';

abstract class MultiStat extends Stat {
  // Constructor
  MultiStat({
    required this.records,
    required this.color,
    required this.startIndex,
    this.showUpperBound,
    this.showLowerBound,
  });

  // Variables
  final List<Record> records;
  final Color color;
  final int startIndex;
  final int? showUpperBound;
  final int? showLowerBound;

  // Functions
  List<double> getData([int? numRecords]);
}

class MultiStatAll extends MultiStat {
  // Constructor
  MultiStatAll({
    required List<Record> records,
  }) : super(
          records: records,
          color: Colors.blue[700]!,
          startIndex: 1,
        );

  @override
  List<double> getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(records, numRecords);
    return effectiveRecords.map((e) => e.finalTime.toDouble()).toList();
  }

  @override
  String toString() {
    return 'stat all';
  }
}

class MultiStatAoX extends MultiStat {
  // Constructor
  MultiStatAoX({
    required List<Record> records,
    required Color color,
    required int startIndex,
    required this.numEffectiveTimes,
    required this.numWorse,
    int? showUpperBound,
    int? showLowerBound,
  }) : super(
          records: records,
          color: color,
          startIndex: startIndex,
          showUpperBound: showUpperBound,
          showLowerBound: showLowerBound,
        );

  // Variables
  final int numWorse;
  final int numEffectiveTimes;

  double _calAoX(Queue<int> queue) {
    List<int> effectiveTimes = List.from(queue)..sort();
    effectiveTimes = effectiveTimes.sublist(
        effectiveTimes.length - numWorse - numEffectiveTimes,
        effectiveTimes.length - numWorse);
    final int sum = effectiveTimes.reduce((a, b) => a + b);
    final double result = sum / numEffectiveTimes;
    return result;
  }

  @override
  List<double> getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(records, numRecords);
    if (startIndex > effectiveRecords.length) return [];
    final List<double> result = [];
    final Queue<int> queue = Queue<int>();
    for (int i = 0; i < startIndex; i++) {
      queue.add(effectiveRecords[i].finalTime);
    }
    for (int i = startIndex; i < effectiveRecords.length; i++) {
      final double aox = _calAoX(queue);
      result.add(aox);
      queue.add(effectiveRecords[i].finalTime);
      queue.removeFirst();
    }
    final double aox = _calAoX(queue);
    result.add(aox);

    return result;
  }
}

class MultiStatAo5 extends MultiStatAoX {
  // Constructor
  MultiStatAo5({
    required List<Record> records,
  }) : super(
          records: records,
          color: Colors.red[700]!,
          startIndex: 5,
          numEffectiveTimes: 3,
          numWorse: 1,
          showUpperBound: 150,
          showLowerBound: 0,
        );

  @override
  String toString() {
    return 'stat ao5';
  }
}

class MultiStatAo12 extends MultiStatAoX {
  // Constructor
  MultiStatAo12({
    required List<Record> records,
  }) : super(
          records: records,
          color: Colors.orange[700]!,
          startIndex: 12,
          numEffectiveTimes: 9,
          numWorse: 2,
          showUpperBound: 500,
          showLowerBound: 0,
        );

  @override
  String toString() {
    return 'stat ao12';
  }
}

class MultiStatAo50 extends MultiStatAoX {
  // Constructor
  MultiStatAo50({
    required List<Record> records,
  }) : super(
          records: records,
          color: Colors.purple[600]!,
          startIndex: 50,
          numEffectiveTimes: 30,
          numWorse: 10,
          showLowerBound: 150,
        );

  @override
  String toString() {
    return 'stat ao50';
  }
}

class MultiStatAo100 extends MultiStatAoX {
  // Constructor
  MultiStatAo100({
    required List<Record> records,
  }) : super(
          records: records,
          color: Colors.red[700]!,
          startIndex: 100,
          numEffectiveTimes: 60,
          numWorse: 20,
          showLowerBound: 500,
        );

  @override
  String toString() {
    return 'stat ao100';
  }
}
