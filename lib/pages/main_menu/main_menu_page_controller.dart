import 'package:cubetimer/pages/records/view/records_page.dart';
import 'package:cubetimer/pages/settings/view/settings_page.dart';
import 'package:cubetimer/pages/statistics/statistics_page.dart';
import 'package:cubetimer/pages/timer/view/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainMenuPageController extends GetxController {
  Widget page = TimerPage();
  int index = 0;
  List<Widget> pages = [
    TimerPage(),
    RecordsPage(),
    const StatisticsPage(),
    SettingsPage(),
  ];
  bool showNavBar = true;
  bool showTimeCounter = true;

  void toggleBottomNavBar() {
    showNavBar = !showNavBar;
    update();
  }

  void changePage(int index) {
    this.index = index;
    page = pages[index];
    update();
  }
}
