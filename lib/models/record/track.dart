import 'package:cubetimer/models/record/record.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'track.g.dart';

@HiveType(typeId: 1)
class Track extends HiveObject {
  // Constructors
  Track({
    required this.id,
    required this.title,
    required this.records,
    required this.createTime,
    required this.lastUpdateTime,
  });

  Track.createNew({
    required this.title, 
  })
      : id = const Uuid().v4(),
        records = const [],
        createTime = DateTime.now(),
        lastUpdateTime = DateTime.now();

  Track.defaultValue()
      : id = const Uuid().v4(),
        title = 'default',
        records = const [],
        createTime = DateTime.now(),
        lastUpdateTime = DateTime.now();

  // Variables
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  List<Record> records;
  @HiveField(3)
  final DateTime createTime;
  @HiveField(4)
  DateTime lastUpdateTime;
}
