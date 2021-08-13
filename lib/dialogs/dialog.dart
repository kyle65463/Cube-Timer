import 'package:cubetimer/dialogs/components/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  // Constructor
  CustomDialog({
    this.title,
    this.description,
    this.body,
    this.btnOkOnPressed,
    this.btnCancelOnPressed,
    this.hasCancelButton = true,
    this.width,
  });

  // Variables
  final String? title;
  final String? description;
  final Widget? body;
  final bool hasCancelButton;
  final Function? btnOkOnPressed;
  final Function? btnCancelOnPressed;
  final double? width;

  // Functions
  Future<dynamic> show() async {
    return AwesomeDialog(
      dialogType: DialogType.NO_HEADER,
      title: title,
      desc: description,
      width: width,
      body: body != null
          ? Column(
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
                body!,
              ],
            )
          : null,
      btnOkText: 'confirm'.tr,
      btnCancelText: 'cancel'.tr,
      btnOkOnPress: btnOkOnPressed,
      btnCancelOnPress: !hasCancelButton ? null : btnCancelOnPressed ?? () {},
    ).show();
  }
}
