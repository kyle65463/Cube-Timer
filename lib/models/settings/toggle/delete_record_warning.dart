import 'package:cubetimer/models/settings/settings_key.dart';
import 'package:cubetimer/models/settings/settings_value.dart';
import 'package:hive/hive.dart';

part 'delete_record_warning.g.dart';

// Settings key
class SettingsKeyDeleteRecordWarning extends SettingsToggleKey {
  // Singleton
  factory SettingsKeyDeleteRecordWarning() => _singleton;
  static final SettingsKeyDeleteRecordWarning _singleton = SettingsKeyDeleteRecordWarning._internal();

  // Constructor
  SettingsKeyDeleteRecordWarning._internal()
      : super(
          name: 'settings delete record warning',
          defaultValue: DeleteRecordWarning(enabled: true),
        );
}

// Settings Value
@HiveType(typeId: 142)
class DeleteRecordWarning extends SettingsValueToggle {
  // Constructor
  DeleteRecordWarning({
    required bool enabled,
  }) : super(enabled: enabled);
}