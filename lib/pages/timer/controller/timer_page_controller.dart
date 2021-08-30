import 'dart:math';

import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/cubes/cube.dart';
import 'package:cubetimer/models/cubes/cube3x3.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/models/settings/toggle/delete_record_warning.dart';
import 'package:cubetimer/models/settings/toggle/hide_timer.dart';
import 'package:cubetimer/models/settings/toggle/inspect_time.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/repositories/settings_repository.dart';
import 'package:cubetimer/repositories/sessions_repository.dart';
import 'package:cubetimer/utils/scramble_generator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPageController extends GetxController {
  // Constructor
  TimerPageController() {
    _initDone = _init();
  }

  // Variables
  final StopWatchTimer timer = StopWatchTimer();
  late StopWatchTimer inspectingTimer;
  bool get isRunning => timer.isRunning;
  bool get isInspecting => inspectingTimer.isRunning;
  Future get initDone => _initDone;
  Scramble get scramble => _scramble;
  Cube get cube => _cube;
  List<Record> get records => _session.records;
  Penalty? get penalty => _lastRecord?.penalty;
  bool get showTime =>
      !(_settings.map[SettingsKeyHideTimer()]! as HideTimer).enabled;

  int currentTime = 0;
  double timerCounterFontSize = 75;
  final SettingsRepository _settingsRepository = Get.find<SettingsRepository>();
  final SessionsRepository _repository = Get.find<SessionsRepository>();
  late Future _initDone;
  late Session _session;
  late Cube _cube;
  late Scramble _scramble;
  late Settings _settings;
  Record? _lastRecord;

  // Functions
  @override
  void onClose() {
    super.onClose();
    timer.dispose();
  }

  Future<void> _init() async {
    await _loadCurrentSession();
    _listenCurrentSessionStream();
    await _loadSettings();
    _listenSettingsStream();
    timer.records.listen(_solveDone);
    inspectingTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      onEnded: () {
        _stopInspecting();
        _startTimer();
        update();
      },
    );
    _cube = Cube3x3();
    _scramble = ScrambleGenerator.generate(_cube);
  }

  void onTimerTriggered() {
    final bool enableInspection =
        (_settings.map[SettingsKeyInspectionTime()]! as InspectionTime).enabled;
    if (isRunning) {
      _stopTimer();
      Get.find<MainMenuPageController>().toggleBottomNavBar();
      Get.find<MainMenuPageController>().toggleCurrentSessionBadge();
    } else {
      if (!isInspecting && enableInspection) {
        Get.find<MainMenuPageController>().toggleBottomNavBar();
        Get.find<MainMenuPageController>().toggleCurrentSessionBadge();
        _startInspecting();
        update();
        return;
      } else {
        _stopInspecting();
      }
      if (!enableInspection) {
        Get.find<MainMenuPageController>().toggleBottomNavBar();
        Get.find<MainMenuPageController>().toggleCurrentSessionBadge();
      }
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
    _resetTimer();
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
      _session,
    );
  }

  Future<void> showDeleteRecordDialog() async {
    if (_lastRecord == null) return;
    final Settings settings = await _settingsRepository.loadSettings();
    final DeleteRecordWarning value =
        settings.map[SettingsKeyDeleteRecordWarning()]! as DeleteRecordWarning;
    final bool showWarning = value.enabled;

    if (showWarning) {
      CustomDialog(
        title: 'dialog title delete record'.tr,
        description: 'dialog description delete record'.tr,
        onConfirm: deleteRecord,
      ).show();
    } else {
      deleteRecord();
    }
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

  void _startInspecting() {
    inspectingTimer.clearPresetTime();
    inspectingTimer.setPresetSecondTime(15);
    inspectingTimer.onExecute.add(StopWatchExecute.start);
  }

  void _stopInspecting() {
    inspectingTimer.onExecute.add(StopWatchExecute.stop);
    inspectingTimer.onExecute.add(StopWatchExecute.reset);
    inspectingTimer.clearPresetTime();
  }

  void _resetTimer() {
    _lastRecord = null;
    timer.onExecute.add(StopWatchExecute.reset);
  }

  Future<void> _loadCurrentSession() async {
    _session = await _repository.loadCurrentSession();
    update();
  }

  void _listenCurrentSessionStream() {
    _repository.currentSessionStream.listen((e) => _loadCurrentSession());
  }

  Future<void> _loadSettings() async {
    _settings = await _settingsRepository.loadSettings();
    update();
  }

  void _listenSettingsStream() {
    _settingsRepository.settingsStream.listen((e) => _loadSettings());
  }
}
