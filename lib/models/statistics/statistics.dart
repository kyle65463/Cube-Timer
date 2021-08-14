import 'package:cubetimer/models/statistics/stat_data.dart';

class Statistics {
  // Constructor
  Statistics({
    required this.data,
  });

  // Variables
  final List<StatData> data;
}

class PlainRecords extends Statistics {
  // Constructor
  PlainRecords({
    required List<StatData> data,
  }) : super(data: data);
}

class Ao5 extends Statistics {
  // Constructor
  Ao5({
    required List<StatData> data,
  }) : super(data: data);
}

class Ao12 extends Statistics {
  // Constructor
  Ao12({
    required List<StatData> data,
  }) : super(data: data);
}
