import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  // Constructor
  MyDialog({
    required this.title,
    this.description,
    this.body,
    this.btnOkOnPressed,
    this.btnCancelOnPressed,
    this.hasCancelButton = true,
    this.width,
  });

  // Variables
  final String title;
  final String? description;
  final Widget? body;
  final bool hasCancelButton;
  final Function? btnOkOnPressed;
  final Function? btnCancelOnPressed;
  final double? width;

  // Functions
  Future<dynamic> show(BuildContext context) async {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      title: title,
      desc: description,
      width: width,
      body: body != null
          ? Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
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
