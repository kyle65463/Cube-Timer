import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  // Constructor
  const TitleSection({
    required this.title,
    this.bottomPadding = 25,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final double bottomPadding;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
        SizedBox(height: bottomPadding)
      ],
    );
  }
}
