import 'dart:async';

import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/repository.dart';
import 'package:get/get.dart';

class SessionsRepository extends Repository {
  // Variables
  Stream get sessionStream => _database.getSessionStream();
  Stream get currentSessionStream => _currentStreamController.stream;
  final Database _database = Get.find<Database>();
  final StreamController _currentStreamController =
      StreamController.broadcast();

  // Functions
  Future<List<Session>> loadSessions() async {
    final List<Session> tracks = await _database.loadSessions();
    return tracks;
  }

  Future<Session> loadCurrentSession() async {
    final List<Session> tracks = await loadSessions();
    Session? result;
    bool isFound = false;
    for (final track in tracks) {
      if (track.isCurrentTrack) {
        if (isFound) {
          // Dulplicated, shouldn't happen
          track.isCurrentTrack = false;
          await _database.updateSession(track);
          throw Exception('Current track duplicated');
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
        await _database.updateSession(result);
        return result;
      } else {
        // No track, shouldn't happen
        throw Exception('No track');
      }
    } else {
      return result;
    }
  }

  Future<void> setCurrentSession(Session track) async {
    // Set all tracks to not current track
    final List<Session> tracks = await loadSessions();
    for (final track in tracks) {
      if (track.isCurrentTrack) {
        track.isCurrentTrack = false;
        await _database.updateSession(track);
      }
    }

    // Set the specific track to current track
    track.isCurrentTrack = true;
    await _database.updateSession(track);
    _currentStreamController.sink.add(true);
  }

  Future<Session> createSession(String title) async {
    final Session track = Session.createNew(title: title);
    await _database.createSession(track);
    return track;
  }

  Future<void> updateSession(Session track) async {
    await _database.updateSession(track);
    _currentStreamController.sink.add(true);
  }

  Future<void> deleteSession(Session track) async {
    await _database.deleteSession(track);
    _currentStreamController.sink.add(true);
  }

  Future<void> createRecord(Record record, [Session? track]) async {
    // Create record to current track if not specified
    track ??= await loadCurrentSession();
    track.records.add(record);
    await _database.updateSession(track);
    _currentStreamController.sink.add(true);
  }

  Future<void> deleteRecord(Record record, [Session? session]) async {
    // Create record to current track if not specified
    session ??= await loadCurrentSession();
    session.records.remove(record);
    await _database.updateSession(session);
    _currentStreamController.sink.add(true);
  }

  Future<void> updateRecord(Record record, [Session? track]) async {
    track ??= await loadCurrentSession();
    if (!track.records.contains(record)) {
      // Shouldn't happen
      throw Exception('Record not found in the track!');
    }

    await _database.updateSession(track);
    _currentStreamController.sink.add(true);
  }
}
