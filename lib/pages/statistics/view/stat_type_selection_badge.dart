import 'package:cubetimer/components/selection_badge.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/settings/options/stat_record_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatTypeSelectionBadge extends StatelessWidget {
  // Constructor
  const StatTypeSelectionBadge({
    required this.statRecordCountKey,
    required this.statRecordCount,
    required this.updateSettings,
    Key? key,
  }) : super(key: key);

  // Variables
  final SettingsKeyStatRecordCount statRecordCountKey;
  final StatRecordCount statRecordCount;
  final Function updateSettings;

  // Functions
  Future<void> _onTap() async {
    final List<Selectable> options =
        statRecordCountKey.options.map((e) => e as Selectable).toList();

    final Selectable? result = await SelectionDialog(
      title: statRecordCountKey.name.tr,
      options: options,
      originalOption: statRecordCount,
    ).show();

    if (result != null) {
      final StatRecordCount newStatRecordCount = result as StatRecordCount;
      updateSettings(statRecordCountKey, newStatRecordCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionBadge(
      title: statRecordCount.toString().tr,
      onTap: _onTap,
    );
  }
}
