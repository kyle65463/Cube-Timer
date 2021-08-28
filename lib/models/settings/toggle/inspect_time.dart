import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'inspect_time.g.dart';

// Settings key
class SettingsKeyInspectionTime extends SettingsToggleKey {
  // Singleton
  factory SettingsKeyInspectionTime() => _singleton;
  static final SettingsKeyInspectionTime _singleton =
      SettingsKeyInspectionTime._internal();

  // Constructor
  SettingsKeyInspectionTime._internal()
      : super(
          name: 'settings inspection time',
          defaultValue: InspectionTime(enabled: false),
        );
}

// Settings Value
@HiveType(typeId: 143)
class InspectionTime extends SettingsValueToggle {
  // Constructor
  InspectionTime({
    required bool enabled,
  }) : super(enabled: enabled);
}
