import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/statistics/data/line_chart_data.dart';
import 'package:cubetimer/models/statistics/multi_stat.dart';
import 'package:cubetimer/models/statistics/data/table_data.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  // Constructor
  StatisticsController() {
    _initDone = _init();
  }

  // Variables
  Future get initDone => _initDone;
  LineChartStatData get lineChartData => _lineChartData;
  SingleStatTableData get singleStatTableData => _singleStatTableData;

  final TracksRepository _repository = Get.find<TracksRepository>();
  late Future _initDone;
  late Track _track;
  late LineChartStatData _lineChartData;
  late SingleStatTableData _singleStatTableData;

  Future<void> _init() async {
    await _loadCurrentTrack();
    _listenCurrentTrackStream();
  }

  Future<void> _loadCurrentTrack() async {
    _track = await _repository.loadCurrentTrack();
    _lineChartData = LineChartStatData(records: _track.records);
    _lineChartData.prepare();
    _singleStatTableData = SingleStatTableData(records: _track.records);
    _singleStatTableData.prepare();
    update();
  }

  void _listenCurrentTrackStream() {
    _repository.currentTrackStream.listen((e) => _loadCurrentTrack());
  }
}
