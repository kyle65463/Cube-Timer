import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

enum AnalyticsFlag {
  appOpened,
  completeTutorials,
  recordSaved,
  recordDeleted,
  sessionCreated,
  sessionDeleted,
  sessionRenamed,
  sessionSelected,
  penaltySet,
  showRate,
  showFeedback,
  showAbout,
  enterRecordsEditMode,
}

class Analytics {
  // Constructor
  factory Analytics() => _instance;
  Analytics._();
  static final Analytics _instance = Analytics._();
  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  static bool enable = true;

  static String _getFlagText(AnalyticsFlag flag) {
    final String text = flag.toString().split('.').last;
    final RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    final String result =
        text.replaceAllMapped(exp, (Match m) => '_${m.group(0)}').toLowerCase();
    return result;
  }

  static Future log(AnalyticsFlag flag) async {
    if (enable) {
      await _analytics.logEvent(
        name: _getFlagText(flag),
      );
    }
  }
}
