import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Localization extends Translations {
  void setLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'timer': 'Timer',
          'statistics': 'Statistics',
          'records': 'Records',
          'settings': 'Settings',
          'more': 'More',
          'language': 'Language',
          'theme': 'Theme',
          'about': 'About',

          // Languages
          'language en-us': 'English',
          'language zh-tw': 'Traditional Chinese',

          // Theme
          'theme brown': 'Brown',
          'theme white': 'White',
        },
        'zh_TW': {
          'timer': '計時器',
          'statistics': '統計',
          'records': '紀錄',
          'settings': '設定',
          'more': '更多',

          // Languages
          'language en-us': '英文',
          'language zh-tw': '繁體中文',

          // Themes
          'theme brown': '棕色',
          'theme white': '白色',
        }
      };
}
