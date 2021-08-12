import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/pages/main_menu/view/current_track_badge.dart';
import 'package:cubetimer/pages/settings/view/settings_page.dart';
import 'package:cubetimer/pages/timer/view/time_counter.dart';
import 'package:cubetimer/pages/timer/view/timer_page.dart';
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
        body: SafeArea(
          bottom: false,
          child: FutureBuilder<void>(
            future: controller.initDone,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: controller.page),
                      AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget? child) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: controller.showNavBar ? 80 : 0,
                            child: child,
                          );
                        },
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
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
                        ),
                      ),
                    ],
                  ),
                  if (controller.page is TimerPage)
                    TimeCounter()
                  else
                    Container(),
                  if (controller.page is! SettingsPage)
                    Positioned(
                      top: 25,
                      right: 25,
                      child: CurrentTrackBadge(
                        tracks: controller.tracks,
                        currentTrack: controller.currentTrack,
                      ),
                    )
                  else
                    Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
