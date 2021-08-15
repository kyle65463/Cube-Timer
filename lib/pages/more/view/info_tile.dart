import 'package:cubetimer/models/more_info/more_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InfoTile extends StatelessWidget {
  // Constructor
  const InfoTile({
    required this.info,
    Key? key,
  }) : super(key: key);

  // Variables
  final MoreInfo info;

  // Functions
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        info.title.tr,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      trailing: info.trailText == null
          ? const FaIcon(FontAwesomeIcons.angleRight, size: 20)
          : Text(
              info.trailText!.tr,
              style: TextStyle(
                fontSize: 17,
                color: Colors.brown[800],
              ),
            ),
      tileColor: Colors.brown[100],
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      dense: true,
      onTap: info.onTap,
    );
  }
}
