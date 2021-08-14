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
  Map<String, String> get sec1 => _sec1;
  Map<String, String> get sec2 => _sec2;
  Map<String, String> get sec3 => _sec3;
  final List<Record> records;
  final List<SingleStat> _stats1 = [];
  final List<SingleStat> _stats2 = [];
  final List<SingleStat> _stats3 = [];
  final Map<String, String> _sec1 = {};
  final Map<String, String> _sec2 = {};
  final Map<String, String> _sec3 = {};

  // Functions
  void _init() {
    _stats1.add(SingleStatBest(records: records));
    _stats1.add(SingleStatWorst(records: records));
    _stats2.add(SingleStatMean(records: records));
    _stats2.add(SingleStatDeviation(records: records));
    _stats3.add(SingleStatTotalCount(records: records));
    _stats3.add(SingleStatDNFCount(records: records));
  }

  void prepare([int? numRecords]) {
    for (final stat in _stats1) {
      _sec1[stat.toString()] = stat.getData(numRecords);
    }
    for (final stat in _stats2) {
      _sec2[stat.toString()] = stat.getData(numRecords);
    }
    for (final stat in _stats3) {
      _sec3[stat.toString()] = stat.getData(numRecords);
    }
  }
}
