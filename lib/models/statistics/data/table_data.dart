import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/single_stat.dart';

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
    _stats.add(SingleStatBest(records: records));
    _stats.add(SingleStatWorst(records: records));
    _stats.add(SingleStatMean(records: records));
    _stats.add(SingleStatDeviation(records: records));
  }

  void prepare([int? numRecords]) {
    for (final stat in _stats) {
      _data[stat.toString()] = stat.getData(numRecords);
    }
  }
}
