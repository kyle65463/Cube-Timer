import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsTile extends StatelessWidget {
  // Constructor
  const SettingsTile({
    required this.settingsKey,
    required this.settingsValue,
    Key? key,
  }) : super(key: key);

  // Variables
  final SettingsKey settingsKey;
  final SettingsValue settingsValue;

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
            color: Colors.brown[800],
          ),
        ),
        tileColor: Colors.brown[100],
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        dense: true,
        onTap: () {},
      );
    } else if (settingsKey is SettingsSelectionKey) {
      return Container();
    } else {
      return Container();
    }
  }
}
