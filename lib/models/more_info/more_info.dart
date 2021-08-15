import 'package:cubetimer/models/more_info/about.dart';
import 'package:cubetimer/models/more_info/feedback.dart';
import 'package:cubetimer/models/more_info/help.dart';
import 'package:cubetimer/models/more_info/rate_us.dart';
import 'package:cubetimer/models/more_info/version.dart';

abstract class MoreInfo {
  // Constructor
  MoreInfo({
    required this.title,
    this.trailText,
  });

  // Variables
  final String title;
  final String? trailText;

  static final List<MoreInfo> info = [
    Help(),
    Feedback(),
    RateUs(),
    About(),
    Version(),
  ];

  // Functions
  void onTap();
}
