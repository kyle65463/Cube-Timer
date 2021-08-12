import 'package:hive/hive.dart';

part 'penalty.g.dart';

abstract class Penalty {}

@HiveType(typeId: 1) // 1 - 5
class PenaltyNone extends Penalty {}

@HiveType(typeId: 2)
class PenaltyDNF extends Penalty {}

@HiveType(typeId: 3)
class PenaltyPlus2Sec extends Penalty {}
