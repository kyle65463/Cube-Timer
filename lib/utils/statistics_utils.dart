import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/statistics/stat_data.dart';
import 'package:cubetimer/utils/extension.dart';

class StatUtils {
  // Return -1 if no sufficient data
  // Return -2 if DNF
  // A number < 0 represents a DNF
  static int ao5(List<int> rawTimes) {
    const int numTimes = 5;
    const int numEffectiveTimes = 3;
    int numWorse = 1;
    if (rawTimes.length < numTimes) return -1; // No sufficient data
    List<int> effectiveTimes = rawTimes.sublist(rawTimes.length - numTimes);
    numWorse -= effectiveTimes.where((e) => e < 0).length;
    effectiveTimes.removeWhere((e) => e < 0);
    if (numWorse < 0) return -2; // DNF
    effectiveTimes.sort();
    // final int start =
    effectiveTimes = effectiveTimes.sublist(
        effectiveTimes.length - numWorse - numEffectiveTimes,
        effectiveTimes.length - numWorse);
    final int sum = effectiveTimes.reduce((a, b) => a + b);
    final int result = (sum / numEffectiveTimes).ceil();
    return result;
  }

  static int ao12(List<int> rawTimes) {
    const int numTimes = 12;
    const int numEffectiveTimes = 9;
    int numWorse = 2;
    if (rawTimes.length < numTimes) return -1; // No sufficient data
    List<int> effectiveTimes = rawTimes.sublist(rawTimes.length - numTimes);
    numWorse -= effectiveTimes.where((e) => e < 0).length;
    effectiveTimes.removeWhere((e) => e < 0);
    if (numWorse < 0) return -2; // DNF
    effectiveTimes.sort();
    // final int start =
    effectiveTimes = effectiveTimes.sublist(
        effectiveTimes.length - numWorse - numEffectiveTimes,
        effectiveTimes.length - numWorse);
    final int sum = effectiveTimes.reduce((a, b) => a + b);
    final int result = (sum / numEffectiveTimes).ceil();
    return result;
  }

  static int best(List<int> rawTimes) {
    if (rawTimes.isEmpty) return -1;
    rawTimes.sort();
    for (final time in rawTimes) {
      if (time < 0) continue;
      return time;
    }
    return -2; // DNF
  }

  static List<StatData> fromRecords(List<Record> records) {
    return records
        .mapIndexed(
            (record, index) => StatData(index: index, rawTime: record.rawTime))
        .toList();
  }
}
