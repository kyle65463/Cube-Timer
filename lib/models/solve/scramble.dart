import 'package:cubetimer/models/solve/move/move.dart';
import 'package:hive/hive.dart';

part 'scramble.g.dart';

@HiveType(typeId: 2)
class Scramble {
  // Constructor
  Scramble({
    required this.moves,
  });

  // Variables
  @HiveField(0)
  final List<Move> moves;
}
