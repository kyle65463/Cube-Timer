import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/pages/more/view/more_page.dart';
import 'package:cubetimer/pages/records/view/records_page.dart';
import 'package:cubetimer/pages/statistics/view/statistics_page.dart';
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
    StatisticsPage(),
    MorePage(),
  ];
  bool showNavBar = true;
  bool showCurrentTrackBadge = true;
  bool showTimeCounter = true;
  Function? leaveEditMode;
  List<Track> get tracks => _tracks;
  Track get currentTrack => _currentTrack;
  Future get initDone => _initDone;

  final TracksRepository _repository = Get.find<TracksRepository>();
  late List<Track> _tracks;
  late Track _currentTrack;
  late Future _initDone;
  Widget? get appBar => _appBar;
  Widget? _appBar;

  // Functions
  void toggleBottomNavBar() {
    showNavBar = !showNavBar;
    update();
  }

  void showAppBar(Widget appBar) {
    _appBar = appBar;
    update();
  }

  void closeAppBar() {
    _appBar = null;
    update();
  }

  void toggleCurrentTrackBadge() {
    showCurrentTrackBadge = !showCurrentTrackBadge;
    update();
  }

  void changePage(int index) {
    this.index = index;
    page = pages[index];
    update();
  }

  Future<Track> createTrack(String title) async {
    return _repository.createTrack(title);
  }

  void selectCurrentTrack(Track track) {
    _repository.setCurrentTrack(track);
  }

  @override
  Future<void> onClose() async {
    await Get.find<Database>().close();
    super.onClose();
  }

  Future<void> _init() async {
    await _loadTracks();
    await _loadCurrentTrack();
    _listenTrackStream();
    _listenCurrentTrackStream();
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
