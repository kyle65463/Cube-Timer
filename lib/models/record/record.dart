import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:hive/hive.dart';

part 'record.g.dart';

@HiveType(typeId: 0)
class Record {
  // Constructor
  Record({
    required this.rawTime,
    required this.scramble,
    required this.penalty,
    required this.dateTime,
  });

  // Variables
  @HiveField(0)
  int rawTime;
  @HiveField(1)
  final Scramble scramble;
  @HiveField(2)
  Penalty penalty;
  @HiveField(3)
  final DateTime dateTime;
}