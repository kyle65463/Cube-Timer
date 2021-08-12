import 'package:cubetimer/models/solve/move/move.dart';
import 'package:hive/hive.dart';

part 'turn.g.dart';

abstract class Turn extends Move {
  // Constructor
  Turn({
    required bool positive,
    required int count,
    required String symbol,
    this.wideness = 1,
  }) : super(
          positive: positive,
          count: count,
          symbol: symbol,
        );

  // Variables
  @HiveField(3)
  final int wideness;

  // Functions
  @override
  String toString() {
    String displaySymbol = symbol;
    String displayWideness = '';
    if (wideness > 1) {
      displayWideness = wideness == 2 ? '' : (wideness - 1).toString();
      displaySymbol = '${displaySymbol}w';
    }
    return '$displayWideness$displaySymbol${getDisplaySuffix()}';
  }
}

@HiveType(typeId: 11) // 11 - 40
class TurnR extends Turn {
  // Constructor
  TurnR({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'R',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 12)
class TurnL extends Turn {
  // Constructor
  TurnL({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'L',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 13)
class TurnU extends Turn {
  // Constructor
  TurnU({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'U',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 14)
class TurnD extends Turn {
  // Constructor
  TurnD({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'D',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 15)
class TurnB extends Turn {
  // Constructor
  TurnB({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'B',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 16)
class TurnF extends Turn {
  // Constructor
  TurnF({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'F',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 17)
class TurnM extends Turn {
  // Constructor
  TurnM({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'M',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 18)
class TurnS extends Turn {
  // Constructor
  TurnS({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'S',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}

@HiveType(typeId: 19)
class TurnE extends Turn {
  // Constructor
  TurnE({
    required bool positive,
    int count = 1,
    int wideness = 1,
  }) : super(
          symbol: 'E',
          positive: positive,
          count: count,
          wideness: wideness,
        );
}
