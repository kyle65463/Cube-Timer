import 'package:cubetimer/pages/records/records_page.dart';
import 'package:cubetimer/pages/statistics/statistics_page.dart';
import 'package:cubetimer/pages/timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainMenuPageController extends GetxController {
  Widget page = const TimerPage();
  int index = 0;
  List<Widget> pages = [
    const TimerPage(),
    const RecordsPage(),
    const StatisticsPage(),
  ];

  void changePage(int index) {
    this.index = index;
    page = pages[index];
    update();
  }
}
