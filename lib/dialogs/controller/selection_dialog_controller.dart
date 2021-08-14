import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/dialogs/input_dialog.dart';
import 'package:cubetimer/models/interfaces/renamable.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:get/get.dart';

class SelectionDialogController extends GetxController {
  // Constructor
  SelectionDialogController({
    required this.options,
    this.originalOption,
  }) {
    _init();
  }

  // Variables
  final List<Selectable> options;
  final Selectable? originalOption;
  int get currentIndex => _currentIndex;
  bool get isCanceled => _isCanceled;
  int _currentIndex = -1;
  bool _isCanceled = false;

  // Functions
  void _init() {
    if (originalOption == null) return;
    for (int i = 0; i < options.length; i++) {
      options.sort((a, b) => a.compare(b));
      if (options[i].isEqual(originalOption!)) {
        _currentIndex = i;
        return;
      }
    }
  }

  void select(int index) {
    _currentIndex = index;
    update();
  }

  void delete(Selectable option, Function onDelete) {
    CustomDialog(
      title: 'dialog title delete record'.tr,
      description: 'dialog description delete record'.tr,
      onConfirm: () {
        onDelete(option);
        final int index = options.indexOf(option);
        if (index == _currentIndex) {
          _currentIndex = 0;
        }
        options.remove(option);

        update();
      },
    ).show();
    return;
  }

  Future<bool> rename(int index) async {
    final String? result = await InputDialog(title: 'rename'.tr).show();
    if (result != null) {
      final Renameable option = options[index] as Renameable;
      option.rename(result);
      update();
      return true;
    }
    return false;
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
