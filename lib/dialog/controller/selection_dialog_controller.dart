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
  int _currentIndex = 0;

  // Functions
  void select(int index) {
    _currentIndex = index;
    update();
  }
}
