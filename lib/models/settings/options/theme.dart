import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'theme.g.dart';

// Settings key
class SettingsKeyTheme extends SettingsSelectionKey {
  SettingsKeyTheme()
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
abstract class Theme extends SettingsValue {}

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
