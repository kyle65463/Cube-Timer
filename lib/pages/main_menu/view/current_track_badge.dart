import 'package:cubetimer/components/selection_badge.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentTrackBadge extends StatelessWidget {
  // Constructor
  const CurrentTrackBadge({
    required this.tracks,
    required this.currentTrack,
    required this.onCreateTrack,
    required this.onRenameTrack,
    required this.onDeleteTrack,
    required this.onSelectCurrentTrack,
    Key? key,
  }) : super(key: key);

  // Variables
  final List<Track> tracks;
  final Track currentTrack;
  final Function onCreateTrack;
  final Function onRenameTrack;
  final Function onDeleteTrack;
  final Function onSelectCurrentTrack;

  // Functions
  Future<void> _onTap(BuildContext context) async {
    final Selectable? result = await SelectionDialog(
      title: 'select track'.tr,
      options: tracks,
      originalOption: currentTrack,
      onCreate: onCreateTrack,
      onRename: onRenameTrack,
      onDelete: onDeleteTrack,
      btnAddText: 'add new track'.tr,
      inputDialogTitle: 'enter title'.tr,
    ).show(context);
    if (result != null) {
      final Track selectedTrack = result as Track;
      onSelectCurrentTrack(selectedTrack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionBadge(
      title: currentTrack.title,
      onTap: () {
        _onTap(context);
      },
    );
  }
}
