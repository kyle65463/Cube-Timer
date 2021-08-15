import 'package:cubetimer/components/tutorial_swipe_overlay.dart';
import 'package:cubetimer/models/more_info/more_info.dart';

class Help extends MoreInfo {
  // Singleton
  factory Help() => _singleton;
  static final Help _singleton = Help._internal();

  // Constructor
  Help._internal() : super(title: 'help');

  // Functions
  @override
  void onTap() {
    TutorialSwipeOverlay.show();
  }
}
