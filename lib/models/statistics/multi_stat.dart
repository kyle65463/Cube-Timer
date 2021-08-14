import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/statistics.dart';

abstract class MultiStat extends Stat {
  // Constructor
  MultiStat({
    required this.records,
  });

  // Variables
  final List<Record> records;

  // Functions
  List<double> getData([int numRecords]);
}

class MultiStatEverything extends MultiStat {
  // Constructor
  MultiStatEverything({
    required List<Record> records,
  }) : super(records: records);

  @override
  List<double> getData([int numRecords = -1]) {
    records.removeWhere((e) => e.finalTime < 0); // Do not count DNF
    List<Record> effectiveRecords = [];
    if (numRecords == -1) {
      effectiveRecords = List.from(records);
    } else {
      effectiveRecords = records.sublist(records.length - numRecords);
    }
    return effectiveRecords.map((e) => e.finalTime.toDouble()).toList();
  }
}
