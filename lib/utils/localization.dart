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
        },
        'zh_TW': {
          'timer': '計時器',
          'statistics': '統計',
          'records': '紀錄',
          'settings': '設定',
        }
      };
}
