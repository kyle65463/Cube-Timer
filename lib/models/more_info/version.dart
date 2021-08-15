import 'package:cubetimer/models/more_info/more_info.dart';
import 'package:cubetimer/utils/constants.dart';

class Version extends MoreInfo {
  // Singleton
  factory Version() => _singleton;
  static final Version _singleton = Version._internal();

  // Constructor
  Version._internal()
      : super(
          title: 'version',
          trailText: Constants.version,
        );

  // Functions
  @override
  void onTap() {}
}
