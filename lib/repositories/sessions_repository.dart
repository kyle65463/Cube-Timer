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
    final List<Session> sessions = await _database.loadSessions();
    return sessions;
  }

  Future<Session> loadCurrentSession() async {
    final List<Session> sessions = await loadSessions();
    Session? result;
    bool isFound = false;
    for (final session in sessions) {
      if (session.isCurrentSession) {
        if (isFound) {
          // Dulplicated, shouldn't happen
          session.isCurrentSession = false;
          await _database.updateSession(session);
          throw Exception('Current session duplicated');
        } else {
          // The current session
          isFound = true;
          result = session;
        }
      }
    }
    if (result == null || !isFound) {
      if (sessions.isNotEmpty) {
        // Return the first session, should only happen at the first launch
        result = sessions.first;
        result.isCurrentSession = true;
        await _database.updateSession(result);
        return result;
      } else {
        // No session, shouldn't happen
        throw Exception('No session');
      }
    } else {
      return result;
    }
  }

  Future<void> setCurrentSession(Session session) async {
    // Set all sessions to not current session
    final List<Session> sessions = await loadSessions();
    for (final session in sessions) {
      if (session.isCurrentSession) {
        session.isCurrentSession = false;
        await _database.updateSession(session);
      }
    }

    // Set the specific session to current session
    session.isCurrentSession = true;
    await _database.updateSession(session);
    _currentStreamController.sink.add(true);
  }

  Future<Session> createSession(String title) async {
    final Session session = Session.createNew(title: title);
    await _database.createSession(session);
    return session;
  }

  Future<void> updateSession(Session session) async {
    await _database.updateSession(session);
    _currentStreamController.sink.add(true);
  }

  Future<void> deleteSession(Session session) async {
    await _database.deleteSession(session);
    _currentStreamController.sink.add(true);
  }

  Future<void> createRecord(Record record, [Session? session]) async {
    // Create record to current session if not specified
    session ??= await loadCurrentSession();
    session.records.add(record);
    await _database.updateSession(session);
    _currentStreamController.sink.add(true);
  }

  Future<void> deleteRecord(Record record, [Session? session]) async {
    // Create record to current session if not specified
    session ??= await loadCurrentSession();
    session.records.remove(record);
    await _database.updateSession(session);
    _currentStreamController.sink.add(true);
  }

  Future<void> updateRecord(Record record, [Session? session]) async {
    session ??= await loadCurrentSession();
    if (!session.records.contains(record)) {
      // Shouldn't happen
      throw Exception('Record not found in the session!');
    }

    await _database.updateSession(session);
    _currentStreamController.sink.add(true);
  }
}
