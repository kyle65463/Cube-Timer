import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'inspect_time.g.dart';

// Settings key
class SettingsKeyInspectTime extends SettingsToggleKey {
  // Singleton
  factory SettingsKeyInspectTime() => _singleton;
  static final SettingsKeyInspectTime _singleton =
      SettingsKeyInspectTime._internal();

  // Constructor
  SettingsKeyInspectTime._internal()
      : super(
          name: 'inspect time',
          defaultValue: InspectTime(enabled: false),
        );
}

// Settings Value
@HiveType(typeId: 143)
class InspectTime extends SettingsValueToggle {
  // Constructor
  InspectTime({
    required bool enabled,
  }) : super(enabled: enabled);
}
