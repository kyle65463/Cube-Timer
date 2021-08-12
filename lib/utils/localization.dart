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
          'rate us': 'Rate Us',
          'feedback': 'Feedback',
          'about': 'About',
          'timer settings': 'Timer Settings',
          'confirm': 'Confirm',
          'cancel': 'Cancel',
          'choose track': 'Choose the Track',
          'add': 'Add a new track',

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
          'more': '更多',
          'choose track': '選擇分類',
          'add': '新增',

          // Settings
          'settings': '設定',
          'timer settings': '計時器設定',
          'language': '語言',
          'theme': '主題',
          'rate us': '評分',
          'feedback': '意見與回饋',
          'about': '關於',

          // Languages
          'language en-us': '英文',
          'language zh-tw': '繁體中文',

          // Themes
          'theme brown': '棕色',
          'theme white': '白色',

          'confirm': '確認',
          'cancel': '取消',
        }
      };
}
