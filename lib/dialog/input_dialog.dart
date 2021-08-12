import 'package:cubetimer/dialog/controller/input_dialog_controller.dart';
import 'package:cubetimer/dialog/controller/selection_dialog_controller.dart';
import 'package:cubetimer/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InputDialog {
  InputDialog({
    required this.title,
  });

  // Variables
  final String title;

  // Functions
  Future<String?> show(BuildContext context) async {
    await MyDialog(
      title: title,
      width: MediaQuery.of(context).size.width,
      body: GetBuilder<InputDialogController>(
        init: InputDialogController(),
        builder: (controller) => Column(
          children: [
            const TextField(),
          ],
        ),
      ),
      btnOkOnPressed: () {},
      btnCancelOnPressed: () {},
    ).show(context);

    // Return the selected index
    return Get.find<InputDialogController>().validate();
  }
}
