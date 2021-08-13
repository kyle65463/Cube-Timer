import 'dart:math';

import 'package:cubetimer/models/cubes/cube.dart';
import 'package:cubetimer/models/solve/move/move.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/utils/random_choice.dart';

class ScrambleGenerator {
  static Scramble generate(Cube cube) {
    final List<Move> possibleMoves = cube.scrambleMoves;

    final List<Move> moves = [];
    int scrambleLength = Random().nextInt(3) + 18;
    while (scrambleLength > 0) {
      final Move move = randomChoice(possibleMoves);
      if (moves.isNotEmpty && move.symbol == moves.last.symbol) continue;
      moves.add(move);
      scrambleLength--;
    }

    return Scramble(
      moves: moves,
    );
  }
}
