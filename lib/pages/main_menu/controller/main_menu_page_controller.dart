import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/pages/records/view/records_page.dart';
import 'package:cubetimer/pages/settings/view/settings_page.dart';
import 'package:cubetimer/pages/statistics/statistics_page.dart';
import 'package:cubetimer/pages/timer/view/timer_page.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainMenuPageController extends GetxController {
  // Constructor
  MainMenuPageController() {
    _initDone = _init();
  }

  // Variables
  Widget page = TimerPage();
  int index = 0;
  List<Widget> pages = [
    TimerPage(),
    RecordsPage(),
    const StatisticsPage(),
    SettingsPage(),
  ];
  bool showNavBar = true;
  bool showTimeCounter = true;
  List<Track> get tracks => _tracks;
  Track get currentTrack => _currentTrack;
  Future get initDone => _initDone;

  final TracksRepository _repository = Get.find<TracksRepository>();
  late List<Track> _tracks;
  late Track _currentTrack;
  late Future _initDone;

  // Functions
  void toggleBottomNavBar() {
    showNavBar = !showNavBar;
    update();
  }

  void changePage(int index) {
    this.index = index;
    page = pages[index];
    update();
  }

  @override
  Future<void> onClose() async {
    await Get.find<Database>().close();
    super.onClose();
  }

  Future<void> _init() async {
    _listenTrackStream();
    _listenCurrentTrackStream();
    await _loadTracks();
    await _loadCurrentTrack();
  }

  Future<void> _loadTracks() async {
    _tracks = await _repository.loadTracks();
    update();
  }

  void _listenTrackStream() {
    _repository.trackStream.listen((e) => _loadTracks());
  }

  Future<void> _loadCurrentTrack() async {
    _currentTrack = await _repository.loadCurrentTrack();
    update();
  }

  void _listenCurrentTrackStream() {
    _repository.currentTrackStream.listen((e) => _loadCurrentTrack());
  }
}
