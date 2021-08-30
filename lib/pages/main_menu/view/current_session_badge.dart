import 'package:cubetimer/components/selection_badge.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentSessionBadge extends StatelessWidget {
  // Constructor
  const CurrentSessionBadge({
    required this.sessions,
    required this.currentSession,
    required this.onCreate,
    required this.onRename,
    required this.onDelete,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  // Variables
  final List<Session> sessions;
  final Session currentSession;
  final Function onCreate;
  final Function onRename;
  final Function onDelete;
  final Function onSelect;

  // Functions
  Future<void> _onTap(BuildContext context) async {
    final Selectable? result = await SelectionDialog(
      title: 'select session'.tr,
      options: sessions,
      originalOption: currentSession,
      onCreate: onCreate,
      onRename: onRename,
      onDelete: onDelete,
      btnAddText: 'add new session'.tr,
      inputDialogTitle: 'enter title'.tr,
    ).show(context);
    if (result != null) {
      final Session selectedSession = result as Session;
      onSelect(selectedSession);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionBadge(
      title: currentSession.title,
      onTap: () {
        _onTap(context);
      },
    );
  }
}
