import 'package:cubetimer/models/settings/options/language.dart';
import 'package:cubetimer/models/settings/options/theme.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
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
