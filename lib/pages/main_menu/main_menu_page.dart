import 'package:cubetimer/pages/main_menu/main_menu_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  // Constructor
  MainMenuPage({
    Key? key,
  }) : super(key: key);

  final MainMenuPageController controller = Get.put(MainMenuPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainMenuPageController>(
      builder: (controller) => Scaffold(
        body: controller.page,
        bottomNavigationBar: BottomNavigationBar(
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
          ],
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: controller.index,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
