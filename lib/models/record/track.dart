import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'track.g.dart';

@HiveType(typeId: 1)
class Track extends HiveObject implements Selectable {
  // Constructors
  Track({
    required this.id,
    required this.title,
    required this.records,
    required this.createTime,
    required this.lastUpdateTime,
    required this.isArchived,
    required this.isCurrentTrack,
  });

  Track.createNew({
    required this.title,
  })  : id = const Uuid().v4(),
        records = [],
        createTime = DateTime.now(),
        lastUpdateTime = DateTime.now(),
        isArchived = false,
        isCurrentTrack = false;

  Track.defaultValue()
      : id = const Uuid().v4(),
        title = 'Default track',
        records = [],
        createTime = DateTime.now(),
        lastUpdateTime = DateTime.now(),
        isArchived = false,
        isCurrentTrack = false;

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
  @HiveField(5)
  bool isArchived;
  @HiveField(6)
  bool isCurrentTrack;

  // Functions
  @override
  String toString() {
    return title;
  }
}
