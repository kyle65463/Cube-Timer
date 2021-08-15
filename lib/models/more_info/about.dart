import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/models/more_info/more_info.dart';
import 'package:get/get.dart';

class About extends MoreInfo {
  // Singleton
  factory About() => _singleton;
  static final About _singleton = About._internal();

  // Constructor
  About._internal() : super(title: 'about');

  // Functions
  @override
  void onTap() {
    CustomDialog(
      title: 'dialog title about'.tr,
      description: 'dialog description about'.tr,
      cancelText: 'close'.tr,
    ).show();
  }
}
