import 'package:hive/hive.dart';

abstract class SettingsValue {
  void apply() {}
}

abstract class SettingsValueToggle extends SettingsValue{
  // Constructor
  SettingsValueToggle({
    required this.enabled,
  });

  // Variables
  @HiveField(0)
  bool enabled;
}
