import 'dart:math';

import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/cubes/cube.dart';
import 'package:cubetimer/models/cubes/cube3x3.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:cubetimer/utils/scramble_generator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPageController extends GetxController {
  // Constructor
  TimerPageController() {
    timer.records.listen(_solveDone);
    _initDone = _init();
  }

  // Variables
  final StopWatchTimer timer = StopWatchTimer();
  bool get isRunning => timer.isRunning;
  Future get initDone => _initDone;
  Scramble get scramble => _scramble;
  Cube get cube => _cube;
  List<Record> get records => _track.records;
  Penalty? get penalty => _lastRecord?.penalty;

  int currentTime = 0;
  double timerCounterFontSize = 75;
  final TracksRepository _repository = Get.find<TracksRepository>();
  late Future _initDone;
  late Track _track;
  late Cube _cube;
  late Scramble _scramble;
  Record? _lastRecord;

  // Functions
  @override
  void onClose() {
    super.onClose();
    timer.dispose();
  }

  Future<void> _init() async {
    await _loadCurrentTrack();
    _listenCurrentTrackStream();
    _cube = Cube3x3();
    _scramble = ScrambleGenerator.generate(_cube);
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
    update();
  }

  double getTimeCounterFontSize(int time) {
    const double lowerBound = 85, upperBound = 115;
    if (!isRunning) {
      return lowerBound;
    } else {
      return min(lowerBound + (time / 5), upperBound);
    }
  }

  void generateScramble() {
    _scramble = ScrambleGenerator.generate(Cube3x3());
    update();
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

  void _solveDone(List<StopWatchRecord> records) {
    _saveRecord(records);
    generateScramble();
  }

  void _saveRecord(List<StopWatchRecord> records) {
    if (records.isEmpty) return;
    final int rawTime = records.first.rawValue ?? 0;
    _lastRecord = Record.createNew(
      rawTime: rawTime,
      penalty: PenaltyNone(),
      scramble: scramble,
    );
    _repository.createRecord(
      _lastRecord!,
      _track,
    );
  }

  void showDeleteRecordDialog() {
    if (_lastRecord == null) return;
    CustomDialog(
      title: 'dialog title delete record'.tr,
      description: 'dialog description delete record'.tr,
      onConfirm: deleteRecord,
    ).show();
    return;
  }

  Future<void> showSetPenaltyDialog() async {
    if (_lastRecord == null) return;
    final List<Selectable> options = Penalty.penalties;
    final Selectable? selectable = await SelectionDialog(
      title: 'penalty'.tr,
      options: options,
      originalOption: _lastRecord!.penalty,
    ).show();
    if (selectable != null) {
      final Penalty penalty = selectable as Penalty;
      _lastRecord!.penalty = penalty;
      _repository.updateRecord(_lastRecord!);
      update();
    }
  }

  void deleteRecord() {
    _repository.deleteRecord(_lastRecord!);
    Get.back();
    _resetTimer();
    update();
  }

  void _resetTimer() {
    _lastRecord = null;
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
