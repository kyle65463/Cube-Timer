import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/settings/options/language.dart';
import 'package:cubetimer/models/settings/options/stat_record_count.dart';
import 'package:cubetimer/models/settings/options/theme.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/models/solve/move/rotate.dart';
import 'package:cubetimer/models/solve/move/turn.dart';
import 'package:cubetimer/models/solve/scramble.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase extends Database {
  // Variables
  late Box<SettingsValue> _settingsBox;
  late Box<Track> _trackBox;

  // Functions
  /* Initialize */
  @override
  Future<void> init() async {
    Hive.registerAdapter(EnUSAdapter());
    Hive.registerAdapter(ZhTWAdapter());
    Hive.registerAdapter(BrownThemeAdapter());
    Hive.registerAdapter(WhiteThemeAdapter());
    Hive.registerAdapter(StatRecordCountAdapter());
    Hive.registerAdapter(RecordAdapter());
    Hive.registerAdapter(TrackAdapter());
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
    _trackBox = await Hive.openBox('track');
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

  /* Tracks */
  @override
  Stream getTrackStream() {
    return _trackBox.watch();
  }

  @override
  Future<List<Track>> loadTracks() async {
    final List<Track> tracks = _trackBox.values.toList();
    if (tracks.isEmpty) {
      final Track defaultTrack = Track.defaultValue();
      await _trackBox.put(defaultTrack.id, defaultTrack);
      return [defaultTrack];
    }
    return tracks;
  }

  @override
  Future<void> createTrack(Track track) async {
    await _trackBox.put(track.id, track);
  }

  @override
  Future<void> updateTrack(Track track) async {
    await track.save();
  }

  @override
  Future<void> deleteTrack(Track track) async {
    await track.delete();
  }
}
