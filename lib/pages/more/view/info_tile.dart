import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoTile extends StatelessWidget {
  // Constructor
  const InfoTile({
    required this.title,
    this.trailText,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final String? trailText;

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
          ? const FaIcon(FontAwesomeIcons.angleRight, size: 20)
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
      onTap: () {},
    );
  }
}
