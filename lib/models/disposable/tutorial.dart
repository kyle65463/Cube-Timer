import 'package:cubetimer/models/disposable/disposable.dart';

abstract class Tutorial extends Disposable {
  // Constructor
  Tutorial({
    required String key,
    bool defaultValue = true,
  }) : super(
          key: key,
          defaultValue: defaultValue,
        );
}

class TutorialSwipe extends Tutorial {
  // Singleton
  factory TutorialSwipe() => _singleton;
  static final TutorialSwipe _singleton = TutorialSwipe._internal();
  
  // Constructor
  TutorialSwipe._internal() : super(key: 'tutorial swipe');
}
