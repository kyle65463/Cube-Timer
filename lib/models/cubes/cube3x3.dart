import 'package:cubetimer/models/cubes/cube.dart';
import 'package:cubetimer/models/solve/move/turn.dart';

class Cube3x3 extends Cube {
  // Constructor
  Cube3x3()
      : super(
          scrambleMoves: [
            TurnR(positive: true),
            TurnR(positive: false),
            TurnR(positive: true, count: 2),
            TurnL(positive: true),
            TurnL(positive: false),
            TurnL(positive: true, count: 2),
            TurnU(positive: true),
            TurnU(positive: false),
            TurnU(positive: true, count: 2),
            TurnD(positive: true),
            TurnD(positive: false),
            TurnD(positive: true, count: 2),
            TurnF(positive: true),
            TurnF(positive: false),
            TurnF(positive: true, count: 2),
            TurnB(positive: true),
            TurnB(positive: false),
            TurnB(positive: true, count: 2),
          ],
        );

  // Functions
  @override
  String toString() {
    return 'cube 3x3';
  }
}
