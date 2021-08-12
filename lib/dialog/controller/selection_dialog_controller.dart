import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SelectionDialogController extends GetxController {
  // Constructor
  SelectionDialogController({
    required this.options,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  // Variables
  final List<String> options;
  int get currentIndex => _currentIndex;
  bool get isCanceled => _isCanceled;
  int _currentIndex = 0;
  bool _isCanceled = false;

  // Functions
  void select(int index) {
    _currentIndex = index;
    update();
  }

  void cancel() {
    _isCanceled = true;
  }

  void addOption(String option) {
    options.add(option);
    _currentIndex = options.length - 1;
    update();
  }
}
