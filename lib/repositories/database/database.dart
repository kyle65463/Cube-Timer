import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';

abstract class Database {
  /* Initialize */
  Future<void> init();

  /* Settings */
  Stream getSettingsStream();
  SettingsValue loadSettingsValue(SettingsKey option);
  void updateSettingsValue(SettingsKey key, SettingsValue value);

  /* Tracks */
  Stream getTrackStream();
  List<Track> loadTracks();
  void createTrack(Track track);
  void deleteTrack(Track track);
  void updateTrack(Track track);
}
