import 'package:cubetimer/models/disposable/tutorial.dart';
import 'package:cubetimer/repositories/database/database.dart';
import 'package:cubetimer/repositories/repository.dart';
import 'package:get/get.dart';

class DisposableRepository extends Repository {
  // Variables
  final Database _database = Get.find<Database>();

  // Functions
  Future<bool> loadTutorial(Tutorial tutorial) async {
    bool value = await _database.loadDisposable(tutorial);
    return value;
  }

  Future<void> disposeTutorial(Tutorial tutorial) async {
    await _database.setDisposable(tutorial, !tutorial.defaultValue);
  }
}
