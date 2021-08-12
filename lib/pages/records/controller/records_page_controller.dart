import 'package:cubetimer/models/record/track.dart';
import 'package:cubetimer/repositories/records_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecordsPageController extends GetxController {
  // Constructor
  RecordsPageController() {
    _initDone = _loadTracks();
    _listenTrackStream();
  }

  // Variables
  List<Track> get tracks => _tracks;
  Future get initDone => _initDone;
  final TracksRepository _repository = Get.find<TracksRepository>();
  late List<Track> _tracks;
  late Future _initDone;

  // Functions
  Future<void> _loadTracks() async {
    _tracks = _repository.loadTracks();
    update();
  }

  void _listenTrackStream() {
    _repository.trackStream.listen((e) => _loadTracks());
  }
}
