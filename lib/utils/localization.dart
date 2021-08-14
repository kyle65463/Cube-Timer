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
          'stat record count': 'Range',
          'stat record count all': 'All records',
          'stat record count 10': 'Recent 10',
          'stat record count 50': 'Recent 50',
          'stat record count 100': 'Recent 100',
          'stat record count 500': 'Recent 500',
          'stat record count 1000': 'Recent 1000',
          'no data': 'No data',

          // Stats
          'stat dnf count': 'DNF',
          'stat count': 'Count',
          'stat deviation': 'Deviation',
          'stat best': 'Best',
          'stat worst': 'Worst',
          'stat mean': 'Mean',
          'stat all': 'All',
          'stat ao5': 'Ao5',
          'stat ao12': 'Ao12',
          'stat ao50': 'Ao50',
          'stat ao100': 'Ao100',

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
          'stat record count': '範圍',
          'stat record count all': '不限範圍',
          'stat record count 10': '最近 10 筆',
          'stat record count 50': '最近 50 筆',
          'stat record count 100': '最近 100 筆',
          'stat record count 500': '最近 500 筆',
          'stat record count 1000': '最近 1000 筆',
          'no data': '無資料',

          // Stats
          'stat count': '總計',
          'stat dnf count': 'DNF',
          'stat deviation': '標準差',
          'stat best': '最佳',
          'stat worst': '最差',
          'stat mean': '平均',
          'stat all': '全部',
          'stat ao5': 'Ao5',
          'stat ao12': 'Ao12',
          'stat ao50': 'Ao50',
          'stat ao100': 'Ao100',

          // Cubes
          'cube 3x3': '3x3',
          'cube 4x4': '4x4',

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
