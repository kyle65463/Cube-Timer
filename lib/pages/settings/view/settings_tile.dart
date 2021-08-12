import 'package:cubetimer/dialog/selection_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
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
            color: Colors.brown[700],
          ),
        ),
        tileColor: Colors.brown[100],
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        dense: true,
        onTap: () async {
          final List<SettingsValue> options =
              (settingsKey as SettingsSelectionKey).options;
          final Selectable? result = await SelectionDialog(
            title: titleText,
            options: options.map((e) => e as Selectable).toList(),
            originalOption: settingsValue as Selectable,
          ).show(context);

          if (result != null) {
            final SettingsValue newSettingsValue = result as SettingsValue;
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
