import 'package:cubetimer/models/solve/scramble.dart';
import 'package:flutter/material.dart';

class ScrambleWrap extends StatelessWidget {
  // Constructor
  const ScrambleWrap({
    required this.scramble,
    this.alignment = WrapAlignment.start,
    Key? key,
  }) : super(key: key);

  // Variables
  final Scramble scramble;
  final WrapAlignment alignment;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3,
      alignment: alignment,
      children: [
        ...scramble.moves
            .map((move) => Text(
                  move.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ))
            .toList(),
      ],
    );
  }
}
