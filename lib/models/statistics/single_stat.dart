import 'dart:math';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/statistics.dart';
import 'package:statistics/statistics.dart';

abstract class SingleStat extends Stat {
  // Constructor
  SingleStat({
    required this.records,
  });

  // Variables
  final List<Record> records;

  // Functions
  String getData([int numRecords]);
}

class SingleStatCount extends SingleStat {
  // Constructor
  SingleStatCount({
    required List<Record> records,
  }) : super(records: records);

  @override
  String getData([int numRecords = -1]) {
    return records.length.toString();
  }

  @override
  String toString() {
    return 'stat count';
  }
}

// class SingleStatAo5 extends SingleStat {
//   // Constructor
//   SingleStatAo5({
//     required List<Record> records,
//   }) : super(records: records);

//   @override
//   String getData([int numRecords]) {
//     return 0;
//   }
// }

// class SingleStatAo12 extends SingleStat {
//   // Constructor
//   SingleStatAo12({
//     required List<Record> records,
//   }) : super(records: records);

//   @override
//   String getData([int numRecords]) {
//     return 0;
//   }
// }

// class SingleStatWorst extends SingleStat {
//   // Constructor
//   SingleStatWorst({
//     required List<Record> records,
//   }) : super(records: records);

//   @override
//   String getData([int numRecords]) {
//     records.removeWhere((e) => e.finalTime < 0); // Do not count DNF
//     if (records.isEmpty) return -1;
//     double worst = -1;
//     for (final record in records) {
//       worst = max(worst, record.finalTime.toDouble());
//     }
//     return worst;
//   }
// }

// class SingleStatBest extends SingleStat {
//   // Constructor
//   SingleStatBest({
//     required List<Record> records,
//   }) : super(records: records);

//   @override
//   String getData([int numRecords]) {
//     records.removeWhere((e) => e.finalTime < 0); // Do not count DNF
//     if (records.isEmpty) return -1;
//     double best = double.infinity;
//     for (final record in records) {
//       best = min(best, record.finalTime.toDouble());
//     }
//     return 0;
//   }
// }

// class SingleStatDeviation extends SingleStat {
//   // Constructor
//   SingleStatDeviation({
//     required List<Record> records,
//   }) : super(records: records);

//   @override
//   String getData([int numRecords]) {
//     records.removeWhere((e) => e.finalTime < 0); // Do not count DNF
//     if (records.isEmpty) return -1;
//     return records
//         .map((e) => e.finalTime)
//         .toList()
//         .statistics
//         .standardDeviation;
//   }
// }

// class SingleStatMean extends SingleStat {
//   // Constructor
//   SingleStatMean({
//     required List<Record> records,
//   }) : super(records: records);

//   @override
//   String getData([int numRecords]) {
//     records.removeWhere((e) => e.finalTime < 0); // Do not count DNF
//     if (records.isEmpty) return -1;
//     return records.map((e) => e.finalTime).toList().statistics.mean;
//   }
// }
