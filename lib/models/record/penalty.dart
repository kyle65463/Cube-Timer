import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:hive/hive.dart';

part 'penalty.g.dart';

abstract class Penalty implements Selectable {
  const Penalty();

  static List<Penalty> penalties = [
    PenaltyNone(),
    PenaltyDNF(),
    PenaltyPlus2Sec(),
  ];
}

@HiveType(typeId: 6) // 6 - 10
class PenaltyNone extends Penalty {
  // Singleton
  factory PenaltyNone() => _singleton;
  static final PenaltyNone _singleton = PenaltyNone._internal();
  PenaltyNone._internal();

  // Functions
  @override
  String toString() {
    return 'penalty none';
  }
}

@HiveType(typeId: 7)
class PenaltyDNF extends Penalty {
  // Singleton
  factory PenaltyDNF() => _singleton;
  static final PenaltyDNF _singleton = PenaltyDNF._internal();
  PenaltyDNF._internal();

  // Functions
  @override
  String toString() {
    return 'penalty dnf';
  }
}

@HiveType(typeId: 8)
class PenaltyPlus2Sec extends Penalty {
  // Singleton
  factory PenaltyPlus2Sec() => _singleton;
  static final PenaltyPlus2Sec _singleton = PenaltyPlus2Sec._internal();
  PenaltyPlus2Sec._internal();

  // Functions
  @override
  String toString() {
    return 'penalty +2 sec';
  }
}
