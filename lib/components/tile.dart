import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tile extends StatelessWidget {
  // Constructor
  const Tile({
    required this.title,
    this.trailText,
    this.onTap,
    this.onToggle,
    this.toggleValue = false,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final String? trailText;
  final VoidCallback? onTap;
  final Function? onToggle;
  final bool toggleValue;

  // Functions
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      trailing: trailText == null
          ? onToggle == null
              ? const FaIcon(FontAwesomeIcons.angleRight, size: 20)
              : SizedBox(
                  width: 60,
                  child: FlutterSwitch(
                    activeColor: Colors.brown[500]!,
                    value: toggleValue,
                    onToggle: (val) {
                      onToggle!(val);
                    },
                  ),
                )
          : Text(
              trailText!,
              style: TextStyle(
                fontSize: 17,
                color: Colors.brown[800],
              ),
            ),
      tileColor: Colors.brown[100],
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      dense: true,
      onTap: onTap,
    );
  }
}
