import 'package:cubetimer/models/settings/settings.dart';
import 'package:cubetimer/repositories/settings_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SettingsPageController extends GetxController {
  // Constructor
  SettingsPageController() {
    _initDone = _loadSettings();
  }

  // Variables

  Settings get settings => _settings;
  Future get initDone => _initDone;
  final SettingsRepository _repository = Get.find<SettingsRepository>();
  late Settings _settings;
  late Future _initDone;

  // Functions
  void saveSettings() {}

  Future<void> _loadSettings() async {
    _settings = _repository.loadSettings();
    update();
  }
}
