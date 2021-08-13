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
          'select track': 'Select the track',
          'add': 'Add',
          'add new track': 'Add a new track',
          'enter': 'Enter',
          'enter title': 'Enter the title',
          'num records selected': '@num records selected',

          // Cubes
          'cube 3x3': '3x3',
          'cube 4x4': '4x4',

          // Penalty
          'penalty': 'Penalty',
          'penalty +2 sec': '+2 sec',
          'penalty dnf': 'DNF',
          'penalty none': 'None',

          // Dialogs
          'dialog title delete record': 'Delete record',
          'dialog description delete record':
              'Are you sure? This action can not be recovered.',

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
          'select track': '選擇分類',
          'add': '新增',
          'add new track': '新增分類',
          'enter': '輸入',
          'enter title': '輸入名稱',
          'num records selected': '已選擇 @num 筆紀錄',

          // Cubes
          'cube 3x3' : '3x3',
          'cube 4x4' : '4x4',

          // Penalty
          'penalty': '處罰',
          'penalty +2 sec': '+2 秒',
          'penalty dnf': 'DNF',
          'penalty none': '無',

          // Dialogs
          'dialog title delete record': '刪除紀錄',
          'dialog description delete record': '確定要刪除紀錄嗎？這個行動無法回復。',

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
