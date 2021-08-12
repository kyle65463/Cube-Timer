import 'package:hive/hive.dart';

abstract class Move {
  // Constructor
  Move({
    required this.positive,
    required this.count,
    required this.symbol,
  });

  // Variables
  @HiveField(0)
  final bool positive;
  @HiveField(1)
  final int count;
  @HiveField(2)
  final String symbol;

  // Functions
  @override
  String toString() {
    return '$symbol${getDisplaySuffix()}';
  }

  String getDisplaySuffix() {
    final String suffixCount = count <= 1 ? '' : count.toString();
    final String suffixPrime = positive ? '' : "'";
    return '$suffixPrime$suffixCount';
  }
}
