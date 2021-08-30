import 'package:cubetimer/models/disposable/disposable.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';

abstract class Database {
  /* Initialize */
  Future<void> init();
  Future<void> close();

  /* Settings */
  Stream getSettingsStream();
  Future<SettingsValue> loadSettingsValue(SettingsKey option);
  Future<void> updateSettingsValue(SettingsKey key, SettingsValue value);

  /* Sessions */
  Stream getSessionStream();
  Future<List<Session>> loadSessions();
  Future<void> createSession(Session session);
  Future<void> deleteSession(Session session);
  Future<void> updateSession(Session session);

  /* Disposable */
  Future<bool> loadDisposable(Disposable disposable);
  Future<void> setDisposable(Disposable disposable, bool value);
}
