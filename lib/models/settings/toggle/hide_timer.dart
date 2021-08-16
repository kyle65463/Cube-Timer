import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'hide_timer.g.dart';

// Settings key
class SettingsKeyHideTimer extends SettingsToggleKey {
  // Singleton
  factory SettingsKeyHideTimer() => _singleton;
  static final SettingsKeyHideTimer _singleton =
      SettingsKeyHideTimer._internal();

  // Constructor
  SettingsKeyHideTimer._internal()
      : super(
          name: 'hide timer',
          defaultValue: HideTimer(enabled: false),
        );
}

// Settings Value
@HiveType(typeId: 144)
class HideTimer extends SettingsValueToggle {
  // Constructor
  HideTimer({
    required bool enabled,
  }) : super(enabled: enabled);
}
