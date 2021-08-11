import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/repository.dart';
import 'package:get/get.dart';

class SettingsRepository extends Repository {
  // Variables
  Database database = Get.find<Database>();

  // Functions
  Settings loadSettings() {
    final List<SettingsKey> keys = SettingsKey.keys;
    final Map<SettingsKey, SettingsValue> map = {};
    for (final key in keys) {
      final SettingsValue value = database.loadSettingsValue(key);
      map[key] = value;
    }
    return Settings(map: map);
  }

  void saveSettings(Settings settings) {
    settings.map.forEach(database.saveSettingsValue);
  }
}
