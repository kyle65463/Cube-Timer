import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/models/record/track.dart';
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
  Track get track => _track;
  Future get initDone => _initDone;
  final TracksRepository _repository = Get.find<TracksRepository>();
  late Track _track;
  late Future _initDone;

  // Functions
  void showRecordInfo(Record record) {
    RecordInfoDialog(
      record: record,
    ).show();
  }

  void enterRecordsEditingMode() {}

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
