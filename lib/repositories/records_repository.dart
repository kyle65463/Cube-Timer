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
  Future<List<Track>> loadTracks() async{
    final List<Track> tracks = await _database.loadTracks();
    return tracks;
  }

  Future<Track> loadCurrentTrack() async {
    final List<Track> tracks = await loadTracks();
    Track? result;
    bool isFound = false;
    for (final track in tracks) {
      if (track.isCurrentTrack) {
        if (isFound) {
          // Dulplicated, shouldn't happen
          track.isCurrentTrack = false;
          await _database.updateTrack(track);
        } else {
          // The current track
          isFound = true;
          result = track;
        }
      }
    }
    if (result == null || !isFound) {
      if (tracks.isNotEmpty) {
        // Return the first track, should only happen at the first launch
        result = tracks.first;
        result.isCurrentTrack = true;
        await _database.updateTrack(result);
        return result;
      }
    }

    // No track, shouldn't happen
    return Track.defaultValue();
  }

  Future<void> setCurrentTrack(Track track) async {
    // Set all tracks to not current track
    final List<Track> tracks = await loadTracks();
    for (final track in tracks) {
      if (track.isCurrentTrack) {
        track.isCurrentTrack = false;
        await _database.updateTrack(track);
      }
    }

    // Set the specific track to current track
    track.isCurrentTrack = true;
    await _database.updateTrack(track);
  }

  Future<void> createTrack(String title) async {
    final Track track = Track.createNew(title: title);
    await _database.createTrack(track);
  }

  Future<void> createRecord(Record record, Track track) async{
    track.records.add(record);
    await _database.updateTrack(track);
  }
}
