import 'package:cubetimer/models/settings/options/language.dart';
import 'package:cubetimer/models/settings/options/stat_record_count.dart';
import 'package:cubetimer/models/settings/options/theme.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/models/settings/toggle/delete_record_warning.dart';
import 'package:cubetimer/models/settings/toggle/hide_timer.dart';
import 'package:cubetimer/models/settings/toggle/inspect_time.dart';
import 'package:hive/hive.dart';

abstract class SettingsKey extends HiveObject {
  // Constructor
  SettingsKey({
    required this.name,
    required this.defaultValue,
  });

  // Variables
  final String name;
  final SettingsValue defaultValue;

  static List<SettingsKey> keys = [
    SettingsKeyLanguage(),
    SettingsKeyTheme(),
    SettingsKeyStatRecordCount(),
    SettingsKeyDeleteRecordWarning(),
    SettingsKeyHideTimer(),
    SettingsKeyInspectTime(),
  ];

  static List<SettingsKey> morePageKeys = [
    SettingsKeyLanguage(),
    SettingsKeyTheme(),
  ];

  static List<SettingsKey> settingsPageKeys = [
    SettingsKeyDeleteRecordWarning(),
    SettingsKeyHideTimer(),
    SettingsKeyInspectTime(),
  ];
}

abstract class SettingsSelectionKey extends SettingsKey {
  // Constructor
  SettingsSelectionKey({
    required String name,
    required SettingsValue defaultValue,
    required this.options,
  }) : super(
          name: name,
          defaultValue: defaultValue,
        );

  // Variables
  final List<SettingsValue> options;
}

abstract class SettingsToggleKey extends SettingsKey {
  // Constructor
  SettingsToggleKey({
    required String name,
    required SettingsValue defaultValue,
  }) : super(
          name: name,
          defaultValue: defaultValue,
        );
}
