import 'package:hive/hive.dart';

part 'penalty.g.dart';

abstract class Penalty {
  const Penalty();
}

@HiveType(typeId: 6) // 6 - 10
class PenaltyNone extends Penalty {
  PenaltyNone();
  const PenaltyNone.cons();
}

@HiveType(typeId: 7)
class PenaltyDNF extends Penalty {
  PenaltyDNF();
  const PenaltyDNF.cons();
}

@HiveType(typeId: 8)
class PenaltyPlus2Sec extends Penalty {
  PenaltyPlus2Sec();
  const PenaltyPlus2Sec.cons();
}
