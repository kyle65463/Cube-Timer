import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'record.g.dart';

@HiveType(typeId: 3)
class Record {
  // Constructor
  Record({
    required this.id,
    required this.rawTime,
    required this.scramble,
    required this.penalty,
    required this.createTime,
  });

  Record.createNew({
    required this.rawTime,
    required this.scramble,
    required this.penalty,
  })  : id = const Uuid().v4(),
        createTime = DateTime.now();

  // Variables
  @HiveField(0)
  String id;
  @HiveField(1)
  int rawTime;
  @HiveField(2)
  final Scramble scramble;
  @HiveField(3)
  Penalty penalty;
  @HiveField(4)
  final DateTime createTime;

  // Functions
  @override
  String toString() {
    return TimerUtils.parseDisplayTime(rawTime);
  }
}
