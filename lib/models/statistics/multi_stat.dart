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
  List<double> getData([int? numRecords]);
}

class MultiStatAll extends MultiStat {
  // Constructor
  MultiStatAll({
    required List<Record> records,
  }) : super(records: records);

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
