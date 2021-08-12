import 'package:cubetimer/pages/settings/controller/settings_page_controller.dart';
import 'package:cubetimer/pages/settings/view/info_tile.dart';
import 'package:cubetimer/pages/settings/view/settings_tile.dart';
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'more'.tr,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

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
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
