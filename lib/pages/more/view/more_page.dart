import 'package:cubetimer/components/title_section.dart';
import 'package:cubetimer/pages/more/controller/more_page_controller.dart';
import 'package:cubetimer/pages/more/view/info_tile.dart';
import 'package:cubetimer/pages/more/view/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorePage extends StatelessWidget {
  // Constructor
  MorePage({
    Key? key,
  }) : super(key: key);

  // Variables
  final MorePageController controller = Get.put(MorePageController());

  // Functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MorePageController>(
          builder: (controller) => FutureBuilder<void>(
            future: controller.initDone,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    TitleSection(title: 'more'.tr),

                    // Settings section
                    ...controller.settings.map.entries.map((entry) {
                      return SettingsTile(
                        settingsKey: entry.key,
                        settingsValue: entry.value,
                        saveSettings: controller.updateSettings,
                      );
                    }).toList(),
                    InfoTile(
                      title: 'timer settings'.tr,
                    ),
                    const SizedBox(height: 30),

                    // Info section
                    InfoTile(
                      title: 'rate us'.tr,
                    ),
                    InfoTile(
                      title: 'feedback'.tr,
                    ),
                    InfoTile(
                      title: 'about'.tr,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
