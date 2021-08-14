import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/models/settings/options/stat_record_count.dart';
import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:cubetimer/models/statistics/data/line_chart_data.dart';
import 'package:cubetimer/models/statistics/data/table_data.dart';
import 'package:cubetimer/repositories/settings_repository.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  // Constructor
  StatisticsController() {
    _initDone = _init();
  }

  // Variables
  Future get initDone => _initDone;
  LineChartStatData get lineChartData => _lineChartData;
  SingleStatTableData get singleStatTableData => _singleStatTableData;
  SettingsKeyStatRecordCount get statRecordCountKey =>
      SettingsKeyStatRecordCount();
  StatRecordCount get statRecordCount =>
      _settings.map[SettingsKeyStatRecordCount()]! as StatRecordCount;

  final TracksRepository _repository = Get.find<TracksRepository>();
  final SettingsRepository _settingsRepository = Get.find<SettingsRepository>();
  late Future _initDone;
  late Track _track;
  late LineChartStatData _lineChartData;
  late SingleStatTableData _singleStatTableData;
  late Settings _settings;

  Future<void> _init() async {
    await _loadSettings();
    _listenSettingsStream();
    await _loadCurrentTrack();
    _listenCurrentTrackStream();
  }

  void updateSettings(SettingsKey key, SettingsValue value) {
    _settingsRepository.updateSettings(key, value);
    update();
  }

  Future<void> _loadCurrentTrack() async {
    _track = await _repository.loadCurrentTrack();
    _lineChartData = LineChartStatData(records: _track.records);
    _lineChartData.prepare(statRecordCount.value);
    _singleStatTableData = SingleStatTableData(records: _track.records);
    _singleStatTableData.prepare(statRecordCount.value);
    update();
  }

  void _listenCurrentTrackStream() {
    _repository.currentTrackStream.listen((e) => _loadCurrentTrack());
  }

  Future<void> _loadSettings() async {
    _settings = await _settingsRepository.loadSettings();
    update();
  }

  void _listenSettingsStream() {
    _settingsRepository.settingsStream.listen((e) async {
      await _loadSettings();
      _loadCurrentTrack();
    });
  }
}
