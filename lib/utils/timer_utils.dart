import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerUtils {
  static String parseTime(int time) {
    if (time == -1) return '-';
    if (time == -2) return 'DNF';
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
}
