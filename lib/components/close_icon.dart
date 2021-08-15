import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloseIcon extends StatelessWidget {
  // Constructor
  const CloseIcon({
    Key? key,
  }) : super(key: key);

  // Functions
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.all(10),
      child: FaIcon(
        FontAwesomeIcons.times,
        color: Colors.grey[500],
        size: 25,
      ),
    );
  }
}
