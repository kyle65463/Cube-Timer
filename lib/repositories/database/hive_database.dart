import 'package:cubetimer/models/settings/options/language.dart';
import 'package:cubetimer/models/settings/options/theme.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase extends Database {
  // Variables
  late Box<SettingsValue> _settingsBox;

  // Functions
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EnUSAdapter());
    Hive.registerAdapter(ZhTWAdapter());
    Hive.registerAdapter(BrownThemeAdapter());
    Hive.registerAdapter(WhiteThemeAdapter());
    _settingsBox = await Hive.openBox('settings');
  }

  @override
  SettingsValue loadSettingsValue(SettingsKey key) {
    final SettingsValue? value = _settingsBox.get(key.name);
    if (value == null) {
       _settingsBox.put(key.name, key.defaultValue);
      return key.defaultValue;
    }
    return value;
  }

  @override
  void saveSettingsValue(SettingsKey key, SettingsValue value) {
    _settingsBox.put(key.name, value);
  }
}
