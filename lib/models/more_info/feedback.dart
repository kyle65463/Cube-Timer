import 'package:cubetimer/models/more_info/more_info.dart';
import 'package:cubetimer/utils/constants.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class Feedback extends MoreInfo {
  // Singleton
  factory Feedback() => _singleton;
  static final Feedback _singleton = Feedback._internal();

  // Constructor
  Feedback._internal() : super(title: 'feedback');

  // Functions
  @override
  Future<void> onTap() async {
    try {
      final Email email = Email(
        subject: 'email subject app feeback'.trParams({
          'appname': Constants.appName,
        }),
        recipients: [Constants.email],
      );
      await FlutterEmailSender.send(email);
    } catch (e) {
      // Something went wrong
      print(e.toString());
    }
  }
}
