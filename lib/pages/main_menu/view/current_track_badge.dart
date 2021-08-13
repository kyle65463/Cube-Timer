import 'package:badges/badges.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CurrentTrackBadge extends StatelessWidget {
  // Constructor
  const CurrentTrackBadge({
    required this.tracks,
    required this.currentTrack,
    required this.onCreateTrack,
    required this.onSelectCurrentTrack,
    Key? key,
  }) : super(key: key);

  // Variables
  final List<Track> tracks;
  final Track currentTrack;
  final Function onCreateTrack;
  final Function onSelectCurrentTrack;

  // Functions
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Selectable? result = await SelectionDialog(
          title: 'select track'.tr,
          options: tracks,
          originalOption: currentTrack,
          onCreate: onCreateTrack,
          btnAddText: 'add new track'.tr,
          inputDialogTitle: 'enter title'.tr,
        ).show();
        if (result != null) {
          final Track selectedTrack = result as Track;
          onSelectCurrentTrack(selectedTrack);
        }
      },
      child: Badge(
        toAnimate: false,
        shape: BadgeShape.square,
        badgeColor: Colors.brown[100]!,
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        badgeContent: Container(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  currentTrack.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              const FaIcon(
                FontAwesomeIcons.angleDown,
                size: 18,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
