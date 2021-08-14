import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'stat_record_count.g.dart';

// Settings key
class SettingsKeyStatRecordCount extends SettingsSelectionKey {
  // Singleton
  factory SettingsKeyStatRecordCount() => _singleton;
  static final SettingsKeyStatRecordCount _singleton =
      SettingsKeyStatRecordCount._internal();

  // Constructor
  SettingsKeyStatRecordCount._internal()
      : super(
          name: 'stat record count',
          defaultValue: StatRecordCount(value: null),
          options: [
            StatRecordCount(value: null),
            StatRecordCount(value: 10),
            StatRecordCount(value: 50),
            StatRecordCount(value: 100),
            StatRecordCount(value: 500),
            StatRecordCount(value: 1000),
          ],
        );
}

// Settings value
@HiveType(typeId: 141) // 141
class StatRecordCount extends SettingsValue with Selectable {
  // Constructor
  StatRecordCount({
    required this.value,
  });

  // Variables
  @HiveField(0)
  final int? value;

  // Functions
  @override
  String toString() {
    if (value == null) return 'all';
    return 'recent $value';
  }

  @override
  bool isEqual(Selectable other) {
    return (other as StatRecordCount).value == value;
  }

  @override
  int compare(Selectable other) {
    print(value);
    if (value == null) return 0;
    final int? otherValue = (other as StatRecordCount).value;
    if (otherValue == null) return 1;
    return value! - otherValue;
  }
}
