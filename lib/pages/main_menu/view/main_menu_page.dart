import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/pages/main_menu/view/bottom_nav_bar.dart';
import 'package:cubetimer/pages/main_menu/view/current_track_badge.dart';
import 'package:cubetimer/pages/more/view/more_page.dart';
import 'package:cubetimer/pages/timer/view/time_counter.dart';
import 'package:cubetimer/pages/timer/view/timer_page.dart';
import 'package:flutter/material.dart';
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
        body: FutureBuilder<void>(
          future: controller.initDone,
          builder: (context, snapshot) {
            // Waiting for init
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    // Body
                    Expanded(child: controller.page),

                    // Bottom nav bar
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      height: controller.showNavBar
                          ? 55 + MediaQuery.of(context).padding.bottom
                          : 0,
                      child: BottomNavBar(),
                    ),
                  ],
                ),

                // Time counter
                if (controller.page is TimerPage)
                  TimeCounter()

                // Current track badge
                else
                  Container(),
                if (controller.page is! MorePage &&
                    controller.showCurrentTrackBadge &&
                    controller.appBar == null)
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 35,
                    right: 25,
                    child: CurrentTrackBadge(
                      tracks: controller.tracks,
                      currentTrack: controller.currentTrack,
                      onCreateTrack: controller.createTrack,
                      onDeleteTrack: controller.deleteTrack,
                      onRenameTrack: controller.renameTrack,
                      onSelectCurrentTrack: controller.selectCurrentTrack,
                    ),
                  ),

                // App bar
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: controller.appBar != null
                      ? MediaQuery.of(context).padding.top + 60
                      : 0,
                  child: controller.appBar ?? Container(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
