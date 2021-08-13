import 'package:cubetimer/models/solve/scramble.dart';
import 'package:flutter/material.dart';

class ScrambleWrap extends StatelessWidget {
  // Constructor
  const ScrambleWrap({
    required this.scramble,
    Key? key,
  }) : super(key: key);

  // Variables
  final Scramble scramble;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3,
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
