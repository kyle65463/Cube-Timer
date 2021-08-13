import 'dart:math';

import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/solve/move/turn.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPageController extends GetxController {
  // Constructor
  TimerPageController() {
    timer.records.listen(_saveRecord);
    _initDone = _init();
  }

  // Variables
  final StopWatchTimer timer = StopWatchTimer();
  bool get isRunning => timer.isRunning;
  Future get initDone => _initDone;

  int currentTime = 0;
  double timerCounterFontSize = 75;
  final TracksRepository _repository = Get.find<TracksRepository>();
  late Future _initDone;
  late Track _track;

  // Functions
  @override
  void onClose() {
    super.onClose();
    timer.dispose();
  }

  Future<void> _init() async {
    await _loadCurrentTrack();
    _listenCurrentTrackStream();
  }

  void onTimerTriggered() {
    Get.find<MainMenuPageController>().toggleBottomNavBar();
    Get.find<MainMenuPageController>().toggleCurrentTrackBadge();
    if (isRunning) {
      _stopTimer();
    } else {
      _resetTimer();
      _startTimer();
    }
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
        penalty: PenaltyNone(),
        scramble: Scramble(moves: [
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
          TurnU(positive: true),
          TurnR(positive: true),
        ]),
      ),
      _track,
    );
  }

  void _resetTimer() {
    timer.onExecute.add(StopWatchExecute.reset);
  }

  Future<void> _loadCurrentTrack() async {
    _track = await _repository.loadCurrentTrack();
    update();
  }

  void _listenCurrentTrackStream() {
    _repository.currentTrackStream.listen((e) => _loadCurrentTrack());
  }
}
