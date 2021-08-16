import 'package:cubetimer/components/tile.dart';
import 'package:cubetimer/models/more_info/more_info.dart';
import 'package:flutter/material.dart';
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
    return Tile(
      title: info.title.tr,
      trailText: info.trailText,
      onTap: info.onTap,
    );
  }
}
