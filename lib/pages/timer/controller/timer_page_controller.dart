import 'dart:math';

import 'package:cubetimer/pages/main_menu/main_menu_page_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerPageController extends GetxController {
  // Variables
  final StopWatchTimer timer = StopWatchTimer();
  int get currentTime => _currentTime;
  bool get isRunning => timer.isRunning;

  int _currentTime = 0;
  double timerCounterFontSize = 75;

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
    final displayTime = StopWatchTimer.getDisplayTime(time);
    final List<String> displayTimeList = displayTime.split(':');
    if (displayTimeList.length < 3) return displayTime;
    final hour = num.parse(displayTimeList[0]);
    final minute = num.parse(displayTimeList[1]);
    final second = displayTimeList[2][0] == '0' && minute == 0 && hour == 0
        ? displayTimeList[2].substring(1)
        : displayTimeList[2];
    String result = hour == 0 ? '' : '$hour:';
    result += minute == 0
        ? ''
        : hour > 0 && minute < 10
            ? '0$minute:'
            : '$minute:';
    result += second;
    return result;
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
    timer.onExecute.add(StopWatchExecute.stop);
    timerCounterFontSize = 75;
  }

  void _resetTimer() {
    timer.onExecute.add(StopWatchExecute.reset);
  }
}
