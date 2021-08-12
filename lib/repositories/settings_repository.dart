import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/repository.dart';
import 'package:get/get.dart';

class SettingsRepository extends Repository {
  // Variables
  final Database _database = Get.find<Database>();
  Stream get settingsStream => _database.getSettingsStream();

  // Functions
  Settings loadSettings() {
    final List<SettingsKey> keys = SettingsKey.keys;
    final Map<SettingsKey, SettingsValue> map = {};
    for (final key in keys) {
      final SettingsValue value = _database.loadSettingsValue(key);
      map[key] = value;
    }
    return Settings(map: map);
  }

  void updateSettings(SettingsKey key, SettingsValue value) {
    _database.updateSettingsValue(key, value);
  }
}
