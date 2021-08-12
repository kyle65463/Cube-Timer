import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/repository.dart';
import 'package:get/get.dart';

class TracksRepository extends Repository {
  // Variables
  final Database _database = Get.find<Database>();
  Stream get trackStream => _database.getTrackStream();

  // Functions
  List<Track> loadTracks() {
    final List<Track> tracks = _database.loadTracks();
    return tracks;
  }

  void createRecord(Record record, Track track) {
    track.records.add(record);
    _database.updateTrack(track);
  }
}
