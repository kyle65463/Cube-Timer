import 'package:cubetimer/models/more_info/more_info.dart';
import 'package:cubetimer/utils/analytics.dart';
import 'package:cubetimer/utils/constants.dart';
import 'package:launch_review/launch_review.dart';

class RateUs extends MoreInfo {
  // Singleton
  factory RateUs() => _singleton;
  static final RateUs _singleton = RateUs._internal();

  // Constructor
  RateUs._internal() : super(title: 'rate us');

  // Functions
  @override
  void onTap() {
    try {
      LaunchReview.launch(
        androidAppId: Constants.packageName,
        iOSAppId: Constants.iosAppId,
      );
      Analytics.log(AnalyticsFlag.showRate);
    } catch (e) {
      // Something went wrong
      print(e.toString());
    }
  }
}
