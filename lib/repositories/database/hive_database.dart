import 'package:cubetimer/models/disposable/disposable.dart';
import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:cubetimer/models/settings/options/language.dart';
import 'package:cubetimer/models/settings/options/stat_record_count.dart';
import 'package:cubetimer/models/settings/options/theme.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/models/settings/toggle/delete_record_warning.dart';
import 'package:cubetimer/models/settings/toggle/hide_timer.dart';
import 'package:cubetimer/models/settings/toggle/inspect_time.dart';
import 'package:cubetimer/models/solve/move/rotate.dart';
import 'package:cubetimer/models/solve/move/turn.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase extends Database {
  // Variables
  late Box<SettingsValue> _settingsBox;
  late Box<Session> _sessionBox;
  late Box<bool> _disposableBox;

  // Functions
  /* Initialize */
  @override
  Future<void> init() async {
    Hive.registerAdapter(EnUSAdapter());
    Hive.registerAdapter(ZhTWAdapter());
    Hive.registerAdapter(BrownThemeAdapter());
    Hive.registerAdapter(WhiteThemeAdapter());
    Hive.registerAdapter(StatRecordCountAdapter());
    Hive.registerAdapter(HideTimerAdapter());
    Hive.registerAdapter(InspectionTimeAdapter());
    Hive.registerAdapter(DeleteRecordWarningAdapter());
    Hive.registerAdapter(RecordAdapter());
    Hive.registerAdapter(SessionAdapter());
    Hive.registerAdapter(TurnRAdapter());
    Hive.registerAdapter(TurnLAdapter());
    Hive.registerAdapter(TurnUAdapter());
    Hive.registerAdapter(TurnDAdapter());
    Hive.registerAdapter(TurnFAdapter());
    Hive.registerAdapter(TurnBAdapter());
    Hive.registerAdapter(TurnMAdapter());
    Hive.registerAdapter(TurnSAdapter());
    Hive.registerAdapter(TurnEAdapter());
    Hive.registerAdapter(RotateXAdapter());
    Hive.registerAdapter(RotateYAdapter());
    Hive.registerAdapter(RotateZAdapter());
    Hive.registerAdapter(ScrambleAdapter());
    Hive.registerAdapter(PenaltyNoneAdapter());
    Hive.registerAdapter(PenaltyDNFAdapter());
    Hive.registerAdapter(PenaltyPlus2SecAdapter());
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox('settings');
    _sessionBox = await Hive.openBox('sessions');
    _disposableBox = await Hive.openBox('disposable');
  }

  @override
  Future<void> close() async {
    await Hive.close();
  }

  /* Settings */
  @override
  Stream getSettingsStream() {
    return _settingsBox.watch();
  }

  @override
  Future<SettingsValue> loadSettingsValue(SettingsKey key) async {
    final SettingsValue? value = _settingsBox.get(key.name);
    if (value == null) {
      await _settingsBox.put(key.name, key.defaultValue);
      return key.defaultValue;
    }
    return value;
  }

  @override
  Future<void> updateSettingsValue(SettingsKey key, SettingsValue value) async {
    await _settingsBox.put(key.name, value);
  }

  /* Sessions */
  @override
  Stream getSessionStream() {
    return _sessionBox.watch();
  }

  @override
  Future<List<Session>> loadSessions() async {
    final List<Session> sessions = _sessionBox.values.toList();
    if (sessions.isEmpty) {
      final Session defaultSession = Session.defaultValue();
      await _sessionBox.put(defaultSession.id, defaultSession);
      return [defaultSession];
    }
    return sessions;
  }

  @override
  Future<void> createSession(Session session) async {
    await _sessionBox.put(session.id, session);
  }

  @override
  Future<void> updateSession(Session session) async {
    await session.save();
  }

  @override
  Future<void> deleteSession(Session session) async {
    await session.delete();
  }

  @override
  Future<bool> loadDisposable(Disposable disposable) async {
    final bool? value = _disposableBox.get(disposable.key);
    if (value == null) {
      await _disposableBox.put(disposable.key, disposable.defaultValue);
      return disposable.defaultValue;
    }
    return value;
  }

  @override
  Future<void> setDisposable(Disposable disposable, bool value) async {
    await _disposableBox.put(disposable.key, value);
  }
}
