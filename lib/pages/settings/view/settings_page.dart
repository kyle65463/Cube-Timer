import 'package:cubetimer/components/tile.dart';
import 'package:cubetimer/components/title_section.dart';
import 'package:cubetimer/pages/more/view/settings_tile.dart';
import 'package:cubetimer/pages/settings/controller/settings_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  // Constructor
  SettingsPage({
    Key? key,
  }) : super(key: key);

  // Variables
  final SettingsPageController controller = Get.put(SettingsPageController());

  // Functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SettingsPageController>(
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
                    TitleSection(
                      title: 'settings'.tr,
                      showBackButton: true,
                    ),

                    // Settings section
                    ...controller.settingsKeys.map((key) {
                      return SettingsTile(
                        settingsKey: key,
                        settingsValue: controller.settings.map[key]!,
                        saveSettings: controller.updateSettings,
                      );
                    }).toList(),
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
