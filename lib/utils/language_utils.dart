import 'package:cubetimer/models/settings/options/language.dart';
import 'package:flutter/material.dart';

class LanguageUtils {
  static Language localeToLanguage(Locale? locale) {
    if (locale != null) {
      final List<Language> languages = SettingsKeyLanguage.languages;
      for (final language in languages) {
        if (language.countryCode == locale.countryCode) return language;
      }
    }
    return EnUS();
  }
}
