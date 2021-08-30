import 'package:cubetimer/dialogs/components/awesome_dialog.dart';
import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/session.dart';
import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/models/settings/toggle/delete_record_warning.dart';
import 'package:cubetimer/pages/main_menu/controller/main_menu_page_controller.dart';
import 'package:cubetimer/pages/records/view/components/record_edit_mode_appbar.dart';
import 'package:cubetimer/pages/records/view/dialogs/record_info_dialog.dart';
import 'package:cubetimer/repositories/settings_repository.dart';
import 'package:cubetimer/repositories/sessions_repository.dart';
import 'package:cubetimer/utils/analytics.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecordsPageController extends GetxController {
  // Constructor
  RecordsPageController() {
    _initDone = _init();
  }

  // Variables
  bool get inEditMode => _inEditMode;
  Session get session => _session;
  Future get initDone => _initDone;
  List<Record> get selectedRecords => _selectedRecords;
  final SessionsRepository _repository = Get.find<SessionsRepository>();
  final SettingsRepository _settingsRepository = Get.find<SettingsRepository>();
  bool _inEditMode = false;
  late Session _session;
  late Future _initDone;
  final List<Record> _selectedRecords = [];

  // Functions
  void showRecordInfo(Record record) {
    RecordInfoDialog(
      record: record,
    ).show();
  }

  void enterEditMode(Record record) {
    Analytics.log(AnalyticsFlag.enterRecordsEditMode);
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

  Future<void> showDeleteRecordsDialog() async {
    final Settings settings = await _settingsRepository.loadSettings();
    final DeleteRecordWarning value =
        settings.map[SettingsKeyDeleteRecordWarning()]! as DeleteRecordWarning;
    final bool showWarning = value.enabled;

    if (showWarning) {
      CustomDialog(
        title: 'dialog title delete record'.tr,
        description: 'dialog description delete record'.tr,
        onConfirm: deleteSelectedRecords,
      ).show();
    } else {
      deleteSelectedRecords();
    }
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
    await _loadCurrentSession();
    _listenCurrentSessionStream();
  }

  Future<void> _loadCurrentSession() async {
    _session = await _repository.loadCurrentSession();
    update();
  }

  void _listenCurrentSessionStream() {
    _repository.currentSessionStream.listen((e) => _loadCurrentSession());
  }
}
