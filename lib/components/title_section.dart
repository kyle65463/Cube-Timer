import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TitleSection extends StatelessWidget {
  // Constructor
  const TitleSection({
    required this.title,
    this.bottomPadding = 25,
    this.showBackButton = false,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final double bottomPadding;
  final bool showBackButton;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: showBackButton ? 5 : 25),
          child: Row(
            children: [
              if (showBackButton)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 50,
                    alignment: Alignment.center,
                    // color: Colors.amber,
                    child: const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      size: 30,
                    ),
                  ),
                ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: bottomPadding)
      ],
    );
  }
}
