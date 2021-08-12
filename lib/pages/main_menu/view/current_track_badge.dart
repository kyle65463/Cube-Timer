import 'package:badges/badges.dart';
import 'package:cubetimer/dialog/selection_dialog.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CurrentTrackBadge extends StatelessWidget {
  // Constructor
  const CurrentTrackBadge({
    required this.tracks,
    required this.currentTrack,
    Key? key,
  }) : super(key: key);

  // Variables
  final List<Track> tracks;
  final Track currentTrack;

  // Functions
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // int index
        SelectionDialog(
          title: 'choose track'.tr,
          options: tracks.map((e) => e.title).toList(),
          originalIndex:
              tracks.map((e) => e.id).toList().indexOf(currentTrack.id),
          onCreate: () {},
        ).show(context);
      },
      child: Badge(
        toAnimate: false,
        shape: BadgeShape.square,
        badgeColor: Colors.brown[100]!,
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        badgeContent: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentTrack.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1,
                ),
              ),
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
