import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/statistics/statistics.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:cubetimer/utils/statistics_utils.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  // Constructor
  StatisticsController() {
    _initDone = _init();
  }

  // Variables
  Future get initDone => _initDone;
  List<Statistics> get stats =>
      [PlainRecords(data: StatUtils.fromRecords(_track.records))];

  final TracksRepository _repository = Get.find<TracksRepository>();
  late Future _initDone;
  late Track _track;

  Future<void> _init() async {
    await _loadCurrentTrack();
    _listenCurrentTrackStream();
  }

  Future<void> _loadCurrentTrack() async {
    _track = await _repository.loadCurrentTrack();
    update();
  }

  void _listenCurrentTrackStream() {
    _repository.currentTrackStream.listen((e) => _loadCurrentTrack());
  }
}
