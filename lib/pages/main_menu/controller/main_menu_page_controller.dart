import 'package:cubetimer/components/tutorial_swipe_overlay.dart';
import 'package:cubetimer/models/disposable/tutorial.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:cubetimer/pages/more/view/more_page.dart';
import 'package:cubetimer/pages/records/view/records_page.dart';
import 'package:cubetimer/pages/statistics/view/statistics_page.dart';
import 'package:cubetimer/pages/timer/view/timer_page.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/disposable_repository.dart';
import 'package:cubetimer/repositories/sessions_repository.dart';
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
  bool showCurrentSessionBadge = true;
  bool showTimeCounter = true;
  Function? leaveEditMode;
  List<Session> get sessions => _sessions;
  Session get currentSession => _currentSession;
  Future get initDone => _initDone;

  final SessionsRepository _repository = Get.find<SessionsRepository>();
  final DisposableRepository _disposableRepository =
      Get.find<DisposableRepository>();
  late List<Session> _sessions;
  late Session _currentSession;
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

  void toggleCurrentSessionBadge() {
    showCurrentSessionBadge = !showCurrentSessionBadge;
    update();
  }

  void changePage(int index) {
    this.index = index;
    page = pages[index];
    update();
  }

  Future<Session> createSession(String title) async {
    return _repository.createSession(title);
  }

  Future<void> renameSession(Session session) async {
    return _repository.updateSession(session);
  }

  Future<void> deleteSession(Session session) async {
    return _repository.deleteSession(session);
  }

  void selectCurrentSession(Session session) {
    _repository.setCurrentSession(session);
  }

  @override
  Future<void> onClose() async {
    await Get.find<Database>().close();
    super.onClose();
  }

  Future<void> _init() async {
    await _loadSessions();
    await _loadCurrentSession();
    _listenSessionStream();
    _listenCurrentSessionStream();
    _showSwipeTutorial();
  }

  Future<void> _loadSessions() async {
    _sessions = await _repository.loadSessions();
    update();
  }

  void _listenSessionStream() {
    _repository.sessionStream.listen((e) => _loadSessions());
  }

  Future<void> _loadCurrentSession() async {
    _currentSession = await _repository.loadCurrentSession();
    update();
  }

  void _listenCurrentSessionStream() {
    _repository.currentSessionStream.listen((e) => _loadCurrentSession());
  }

  Future<void> _showSwipeTutorial() async {
    final bool show = await _disposableRepository.loadTutorial(TutorialSwipe());
    if (show) {
      TutorialSwipeOverlay.show();
      _disposableRepository.disposeTutorial(TutorialSwipe());
    }
  }
}
