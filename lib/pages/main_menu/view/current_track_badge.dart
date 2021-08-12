import 'package:badges/badges.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentTrackBadge extends StatelessWidget {
  // Constructor
  const CurrentTrackBadge({
    required this.currentTrack,
    Key? key,
  }) : super(key: key);

  // Variables
  final Track currentTrack;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Badge(
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
    );
  }
}
