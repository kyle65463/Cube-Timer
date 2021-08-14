import 'package:cubetimer/models/record/record.dart';

abstract class Stat {
  List<Record> filter(
    List<Record> records,
    int? numRecords, {
    bool includeDNF = false,
  }) {
    final List<Record> newRecords = List<Record>.from(records);
    if (!includeDNF) {
      newRecords.removeWhere((record) => record.finalTime < 0);
    }
    if (numRecords != null && numRecords <= records.length) {
      return newRecords.sublist(newRecords.length - numRecords);
    }
    return newRecords;
  }
}
