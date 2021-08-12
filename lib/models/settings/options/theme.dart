import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'theme.g.dart';

// Settings key
class SettingsKeyTheme extends SettingsSelectionKey {
  // Singleton
  factory SettingsKeyTheme() => _singleton;
  static final SettingsKeyTheme _singleton = SettingsKeyTheme._internal();
  
  // Constructor
  SettingsKeyTheme._internal()
      : super(
          name: 'theme',
          defaultValue: BrownTheme(),
          options: [
            BrownTheme(),
            WhiteTheme(),
          ],
        );
}

// Settings value
abstract class Theme extends SettingsValue implements Selectable {
  // Functions
  @override
  void apply() {
    // Get.changeTheme(ThemeData.light());
  }
}

@HiveType(typeId: 131) // 131 - 140
class BrownTheme extends Theme {
  // Singleton
  factory BrownTheme() => _singleton;
  static final BrownTheme _singleton = BrownTheme._internal();
  BrownTheme._internal();

  // Functions
  @override
  String toString() => 'theme brown';
}

@HiveType(typeId: 132)
class WhiteTheme extends Theme {
  // Singleton
  factory WhiteTheme() => _singleton;
  static final WhiteTheme _singleton = WhiteTheme._internal();
  WhiteTheme._internal();

  // Functions
  @override
  String toString() => 'theme white';
}
