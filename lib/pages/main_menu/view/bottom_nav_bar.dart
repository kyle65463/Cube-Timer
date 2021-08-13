import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  // Constructor
  BottomNavBar({
    Key? key,
  }) : super(key: key);

  // Variables
  final MainMenuPageController controller = Get.find<MainMenuPageController>();

  // Functions
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.stopwatch),
            label: 'timer'.tr,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.history),
            label: 'records'.tr,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.chartBar),
            label: 'statistics'.tr,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.bars),
            label: 'more'.tr,
          ),
        ],
        selectedItemColor: Colors.grey[800],
        unselectedItemColor: Colors.grey[500],
        backgroundColor: Colors.brown[100],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: controller.index,
        onTap: controller.changePage,
      ),
    );
  }
}
