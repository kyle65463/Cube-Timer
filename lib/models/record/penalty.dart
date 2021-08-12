import 'package:hive/hive.dart';

part 'penalty.g.dart';

abstract class Penalty {
  const Penalty();
}

@HiveType(typeId: 6) // 6 - 10
class PenaltyNone extends Penalty {
  const PenaltyNone();
}

@HiveType(typeId: 7)
class PenaltyDNF extends Penalty {
  const PenaltyDNF();
}

@HiveType(typeId: 8)
class PenaltyPlus2Sec extends Penalty {
  const PenaltyPlus2Sec();
}
