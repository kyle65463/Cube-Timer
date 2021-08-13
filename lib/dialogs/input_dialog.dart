import 'package:cubetimer/dialogs/controller/input_dialog_controller.dart';
import 'package:cubetimer/dialogs/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputDialog {
  InputDialog({
    required this.title,
  });

  // Variables
  final String title;

  // Functions
  Future<String?> show() async {
    await CustomDialog(
      title: title,
      width: Get.width * 0.9,
      body: GetBuilder<InputDialogController>(
        init: InputDialogController(),
        builder: (controller) => Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                ),
                controller: controller.inputController,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      btnOkOnPressed: () {},
      btnCancelOnPressed: () {
        Get.find<InputDialogController>().cancel();
      },
    ).show();

    // Return the input text
    if (Get.find<InputDialogController>().isCanceled) return null;
    return Get.find<InputDialogController>().validate();
  }
}
