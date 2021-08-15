import 'package:cubetimer/models/disposable/disposable.dart';
import 'package:cubetimer/models/record/track.dart';
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

  /* Tracks */
  Stream getTrackStream();
  Future<List<Track>> loadTracks();
  Future<void> createTrack(Track track);
  Future<void> deleteTrack(Track track);
  Future<void> updateTrack(Track track);

  /* Disposable */
  Future<bool> loadDisposable(Disposable disposable);
  Future<void> setDisposable(Disposable disposable, bool value);
}
