import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectionBadge extends StatelessWidget {
  // Constructor
  const SelectionBadge({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final VoidCallback onTap;

  // Functions
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              FaIcon(
                FontAwesomeIcons.angleDown,
                size: 15,
                color: Colors.grey[800],
              )
            ],
          ),
        ),
      ),
    );
  }
}
