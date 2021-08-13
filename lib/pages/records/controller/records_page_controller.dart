import 'package:cubetimer/dialogs/components/awesome_dialog.dart';
import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/pages/records/view/components/record_edit_mode_appbar.dart';
import 'package:cubetimer/pages/records/view/dialogs/record_info_dialog.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecordsPageController extends GetxController {
  // Constructor
  RecordsPageController() {
    _initDone = _init();
  }

  // Variables
  bool get inEditMode => _inEditMode;
  Track get track => _track;
  Future get initDone => _initDone;
  List<Record> get selectedRecords => _selectedRecords;
  final TracksRepository _repository = Get.find<TracksRepository>();
  bool _inEditMode = false;
  late Track _track;
  late Future _initDone;
  final List<Record> _selectedRecords = [];

  // Functions
  void showRecordInfo(Record record) {
    RecordInfoDialog(
      record: record,
    ).show();
  }

  void enterEditMode(Record record) {
    _inEditMode = true;
    _selectedRecords.clear();
    _selectedRecords.add(record);
    Get.find<MainMenuPageController>().showAppBar(const RecordEditModeAppbar());
    Get.find<MainMenuPageController>().toggleBottomNavBar();
    update();
  }

  void leaveEditMode() {
    _inEditMode = false;
    _selectedRecords.clear();
    Get.find<MainMenuPageController>().closeAppBar();
    Get.find<MainMenuPageController>().toggleBottomNavBar();
    update();
  }

  void editSelected(Record record) {
    if (_selectedRecords.contains(record)) {
      _selectedRecords.remove(record);
    } else {
      _selectedRecords.add(record);
    }
    update();
  }

  void showDeleteRecordsDialog() {
    CustomDialog(
      title: 'dialog title delete record'.tr,
      description: 'dialog description delete record'.tr,
      onConfirm: deleteSelectedRecords,
    ).show();
    return;
  }

  void deleteSelectedRecords() {
    for (final record in _selectedRecords) {
      _repository.deleteRecord(record);
    }
    Get.back();
    leaveEditMode();
  }

  Future<void> _init() async {
    await _loadCurrentTrack();
    _listenCurrentTrackStream();
  }

  Future<void> _loadCurrentTrack() async {
    _track = await _repository.loadCurrentTrack();
    update();
  }

  void _listenCurrentTrackStream() {
    _repository.currentTrackStream.listen((e) => _loadCurrentTrack());
  }
}
