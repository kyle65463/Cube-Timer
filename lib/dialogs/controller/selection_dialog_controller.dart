import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SelectionDialogController extends GetxController {
  // Constructor
  SelectionDialogController({
    required this.options,
    required this.originalOption,
  }) {
    _init();
  }

  // Variables
  final List<Selectable> options;
  final Selectable originalOption;
  int get currentIndex => _currentIndex;
  bool get isCanceled => _isCanceled;
  int _currentIndex = -1;
  bool _isCanceled = false;

  // Functions
  void _init() {
    for (int i = 0; i < options.length; i++) {
      options.sort((a, b) => a.compare(b));
      if (options[i].isEqual(originalOption)) {
        _currentIndex = i;
        return;
      }
    }
  }

  void select(int index) {
    _currentIndex = index;
    update();
  }

  Selectable? confirm() {
    return options[_currentIndex];
  }

  void cancel() {
    _isCanceled = true;
  }

  void addOption(Selectable option) {
    options.add(option);
    options.sort((a, b) => a.compare(b));
    _currentIndex = options.indexOf(option);
    update();
  }
}
