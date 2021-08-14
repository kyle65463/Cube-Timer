import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/dialogs/selection_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/repositories/tracks_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecordInfoDialogController extends GetxController {
  // Constructor
  RecordInfoDialogController({
    required this.record,
  });

  // Variables
  final Record record;
  final TracksRepository _repository = Get.find<TracksRepository>();

  // Functions
  void showDeleteRecordDialog() {
    CustomDialog(
      title: 'dialog title delete record'.tr,
      description: 'dialog description delete record'.tr,
      onConfirm: deleteRecord,
    ).show();
    return;
  }

  void deleteRecord() {
    _repository.deleteRecord(record);
    Get.back();
  }

  Future<void> showSetPenaltyDialog() async {
    final List<Selectable> options = Penalty.penalties;
    final Selectable? selectable = await SelectionDialog(
      title: 'penalty'.tr,
      options: options,
      originalOption: record.penalty,
    ).show();
    if (selectable != null) {
      final Penalty penalty = selectable as Penalty;
      record.penalty = penalty;
      _repository.updateRecord(record);
      update();
    }
  }
}
