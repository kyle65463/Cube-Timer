import 'dart:math';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/solve/move/turn.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/repositories/records_repository.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPageController extends GetxController {
  // Constructor
  TimerPageController() {
    timer.records.listen(_saveRecord);
    _initDone = _loadTracks();
    _listenTrackStream();
  }

  // Variables
  final StopWatchTimer timer = StopWatchTimer();
  int get currentTime => _currentTime;
  bool get isRunning => timer.isRunning;
  Future get initDone => _initDone;

  int _currentTime = 0;
  double timerCounterFontSize = 75;
  final TracksRepository _repository = Get.find<TracksRepository>();
  late List<Track> _tracks;
  late Future _initDone;

  // Functions
  @override
  void onClose() {
    super.onClose();
    timer.dispose();
  }

  void onTimerTriggered() {
    Get.find<MainMenuPageController>().toggleBottomNavBar();
    if (isRunning) {
      _stopTimer();
    } else {
      _resetTimer();
      _startTimer();
    }
  }

  String parseDisplayTime(int time) {
    _currentTime = time;
    return TimerUtils.parseDisplayTime(time);
  }

  double getTimeCounterFontSize(int time) {
    const double lowerBound = 70, upperBound = 95;
    if (!isRunning) {
      return lowerBound;
    } else {
      return min(lowerBound + (time / 5), upperBound);
    }
  }

  void _startTimer() {
    timer.onExecute.add(StopWatchExecute.start);
    timerCounterFontSize = 95;
  }

  void _stopTimer() {
    timer.onExecute.add(StopWatchExecute.lap);
    timer.onExecute.add(StopWatchExecute.stop);
    timerCounterFontSize = 75;
  }

  void _saveRecord(List<StopWatchRecord> records) {
    if (records.isEmpty) return;
    final int rawTime = records.first.rawValue ?? 0;
    _repository.createRecord(
      Record.createNew(
        rawTime: rawTime,
        scramble: Scramble(moves: [
          TurnU(positive: true),
          TurnR(positive: true),
        ]),
      ),
      _tracks.first,
    );
  }

  void _resetTimer() {
    timer.onExecute.add(StopWatchExecute.reset);
  }

  Future<void> _loadTracks() async {
    _tracks = await  _repository.loadTracks();
    update();
  }

  void _listenTrackStream() {
    _repository.trackStream.listen((e) => _loadTracks());
  }
}
