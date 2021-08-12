import 'package:cubetimer/models/solve/move/move.dart';
import 'package:hive/hive.dart';

part 'rotate.g.dart';

abstract class Rotate extends Move {
  Rotate({
    required bool positive,
    required int count,
    required String symbol,
  }) : super(
          positive: positive,
          count: count,
          symbol: symbol,
        );
}

@HiveType(typeId: 41) // 41 - 50
class RotateX extends Move {
  // Constructor
  RotateX({
    required bool positive,
    int count = 1,
  }) : super(
          positive: positive,
          count: count,
          symbol: 'x',
        );
}

@HiveType(typeId: 42)
class RotateY extends Move {
  // Constructor
  RotateY({
    required bool positive,
    int count = 1,
  }) : super(
          positive: positive,
          count: count,
          symbol: 'y',
        );
}

@HiveType(typeId: 43)
class RotateZ extends Move {
  // Constructor
  RotateZ({
    required bool positive,
    int count = 1,
  }) : super(
          positive: positive,
          count: count,
          symbol: 'z',
        );
}
