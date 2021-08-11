import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';

abstract class Database {
  Future<void> init();
  SettingsValue loadSettingsValue(SettingsKey option);
  void saveSettingsValue(SettingsKey key, SettingsValue value);
}

