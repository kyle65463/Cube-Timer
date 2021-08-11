import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'language.g.dart';

// Settings key
class SettingsKeyLanguage extends SettingsSelectionKey {
  SettingsKeyLanguage()
      : super(name: 'language', defaultValue: EnUS(), options: [
          ZhTW(),
          EnUS(),
        ]);
}

// Settings Value
abstract class Language extends SettingsValue {
  // Constructor
  Language({
    required this.languageCode,
    required this.countryCode,
  });

  // Variables
  final String languageCode;
  final String countryCode;
  Locale get locale => Locale(languageCode, countryCode);

  // Functions
  @override
  String toString() => 'language $languageCode-$countryCode'.toLowerCase();

  @override
  void apply() {
    Get.updateLocale(locale);
  }
}

@HiveType(typeId: 101) // 101 - 130
class ZhTW extends Language {
  // Singleton
  factory ZhTW() => _singleton;
  static final ZhTW _singleton = ZhTW._internal();

  // Constructor
  ZhTW._internal()
      : super(
          languageCode: 'zh',
          countryCode: 'TW',
        );
}

@HiveType(typeId: 102)
class EnUS extends Language {
  // Singleton
  factory EnUS() => _singleton;
  static final EnUS _singleton = EnUS._internal();

  // Constructor
  EnUS._internal()
      : super(
          languageCode: 'en',
          countryCode: 'US',
        );
}
