import 'dart:math';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/statistics.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:statistics/statistics.dart';

abstract class SingleStat extends Stat {
  // Constructor
  SingleStat({
    required this.records,
  });

  // Variables
  final List<Record> records;

  // Functions
  String getData([int? numRecords]);
}

class SingleStatAoX extends SingleStat {
  // Constructor
  SingleStatAoX({
    required List<Record> records,
    required this.numTimes,
    required this.numEffectiveTimes,
    required this.numWorse,
  }) : super(records: records);

  // Variables
  final int numTimes;
  final int numEffectiveTimes;
  int numWorse;

  @override
  String getData([int? numRecords]) {
    final List<int> rawTimes = super
        .filter(records, numTimes, includeDNF: true)
        .map((e) => e.finalTime)
        .toList();
    if (rawTimes.length < numTimes) return '-'; // No sufficient data
    List<int> effectiveTimes = rawTimes.sublist(rawTimes.length - numTimes);
    numWorse -= effectiveTimes.where((e) => e < 0).length;
    effectiveTimes.removeWhere((e) => e < 0);
    if (numWorse < 0) return 'DNF'; // DNF
    effectiveTimes.sort();
    effectiveTimes = effectiveTimes.sublist(
        effectiveTimes.length - numWorse - numEffectiveTimes,
        effectiveTimes.length - numWorse);
    final int sum = effectiveTimes.reduce((a, b) => a + b);
    final int result = (sum / numEffectiveTimes).ceil();
    return TimerUtils.parseTime(result);
  }
}

class SingleStatCount extends SingleStat {
  // Constructor
  SingleStatCount({
    required List<Record> records,
  }) : super(records: records);

  @override
  String getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(
      records,
      numRecords,
      includeDNF: true,
    );
    return effectiveRecords.length.toString();
  }

  @override
  String toString() {
    return 'stat count';
  }
}

class SingleStatAo5 extends SingleStatAoX {
  // Constructor
  SingleStatAo5({
    required List<Record> records,
  }) : super(
          records: records,
          numTimes: 12,
          numEffectiveTimes: 9,
          numWorse: 2,
        );

  @override
  String toString() {
    return 'stat ao5';
  }
}

class SingleStatAo12 extends SingleStatAoX {
  // Constructor
  SingleStatAo12({
    required List<Record> records,
  }) : super(
          records: records,
          numTimes: 12,
          numEffectiveTimes: 9,
          numWorse: 2,
        );

  @override
  String toString() {
    return 'stat ao12';
  }
}

class SingleStatWorst extends SingleStat {
  // Constructor
  SingleStatWorst({
    required List<Record> records,
  }) : super(records: records);

  @override
  String getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(records, numRecords);
    if (effectiveRecords.isEmpty) return '-';
    double worst = -1;
    for (final record in effectiveRecords) {
      worst = max(worst, record.finalTime.toDouble());
    }
    return TimerUtils.parseTime(worst.toInt());
  }

  @override
  String toString() {
    return 'stat worst';
  }
}

class SingleStatBest extends SingleStat {
  // Constructor
  SingleStatBest({
    required List<Record> records,
  }) : super(records: records);

  @override
  String getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(records, numRecords);
    if (effectiveRecords.isEmpty) return '-';
    double best = double.infinity;
    for (final record in effectiveRecords) {
      best = min(best, record.finalTime.toDouble());
    }
    return TimerUtils.parseTime(best.toInt());
  }

  @override
  String toString() {
    return 'stat best';
  }
}

class SingleStatDeviation extends SingleStat {
  // Constructor
  SingleStatDeviation({
    required List<Record> records,
  }) : super(records: records);

  @override
  String getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(records, numRecords);
    if (effectiveRecords.isEmpty) return '-';
    final double deviation = effectiveRecords
        .map((e) => e.finalTime)
        .toList()
        .statistics
        .standardDeviation;
    return TimerUtils.parseTime(deviation.toInt());
  }

  @override
  String toString() {
    return 'stat deviation';
  }
}

class SingleStatMean extends SingleStat {
  // Constructor
  SingleStatMean({
    required List<Record> records,
  }) : super(records: records);

  @override
  String getData([int? numRecords]) {
    final List<Record> effectiveRecords = super.filter(records, numRecords);
    if (effectiveRecords.isEmpty) return '-';
    final double mean =
        effectiveRecords.map((e) => e.finalTime).toList().statistics.mean;
    return TimerUtils.parseTime(mean.toInt());
  }

  @override
  String toString() {
    return 'stat mean';
  }
}
