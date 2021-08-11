import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/utils/language_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'language.g.dart';

// Settings key
class SettingsKeyLanguage extends SettingsSelectionKey {
  // Singleton
  factory SettingsKeyLanguage() => _singleton;
  static final SettingsKeyLanguage _singleton = SettingsKeyLanguage._internal();

  // Constructor
  SettingsKeyLanguage._internal()
      : super(
          name: 'language',
          defaultValue: LanguageUtils.localeToLanguage(Get.deviceLocale),
          options: languages,
        );

  static List<Language> languages = [
    ZhTW(),
    EnUS(),
  ];
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
