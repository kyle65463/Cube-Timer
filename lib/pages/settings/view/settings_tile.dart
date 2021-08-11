import 'package:cubetimer/dialog/selection_dialog.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsTile extends StatelessWidget {
  // Constructor
  const SettingsTile({
    required this.settingsKey,
    required this.settingsValue,
    required this.saveSettings,
    Key? key,
  }) : super(key: key);

  // Variables
  final SettingsKey settingsKey;
  final SettingsValue settingsValue;
  final Function saveSettings;

  // Functions
  @override
  Widget build(BuildContext context) {
    final String titleText = settingsKey.name.tr;
    if (settingsKey is SettingsSelectionKey) {
      final String trailText = settingsValue.toString().tr;
      final List<SettingsValue> options =
          (settingsKey as SettingsSelectionKey).options;
      return ListTile(
        title: Text(
          titleText,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        trailing: Text(
          trailText,
          style: TextStyle(
            fontSize: 17,
            color: Colors.brown[800],
          ),
        ),
        tileColor: Colors.brown[100],
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        dense: true,
        onTap: () async {
          int? index = await SelectionDialog(
            title: titleText,
            options: options.map((e) => e.toString()).toList(),
            originalIndex: 0,
          ).show(context);

          if (index != null) {
            final SettingsValue newSettingsValue = options[index];
            newSettingsValue.apply();
            saveSettings(settingsKey, newSettingsValue);
          }
        },
      );
    } else if (settingsKey is SettingsSelectionKey) {
      return Container();
    } else {
      return Container();
    }
  }
}
