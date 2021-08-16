import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';

/*
  Steps to add new settings:
  1. Create two classes extend SettingsKey and SettingsValue repectively
  2. Set up key name and initial value in the class extending SettingsKey
  3. Append the new SettingsKey class to the keys variables in SettingsKey
*/

class Settings {
  // Constructor
  Settings({
    required this.map,
  });

  // Variables
  Map<SettingsKey, SettingsValue> map;
}
