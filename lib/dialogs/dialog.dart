import 'package:cubetimer/components/close_icon.dart';
import 'package:cubetimer/dialogs/components/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  // Constructor
  CustomDialog({
    this.title,
    this.description,
    this.body,
    this.onConfirm,
    this.onCancel,
    this.hasCancelButton = true,
    this.width,
    this.dialogType,
    this.cancelText,
    this.confirmText,
    this.showCloseIcon = false,
  });

  // Variables
  final String? title;
  final String? description;
  final Widget? body;
  final bool hasCancelButton;
  final Function? onConfirm;
  final Function? onCancel;
  final double? width;
  final DialogType? dialogType;
  final String? cancelText;
  final String? confirmText;
  final bool showCloseIcon;

  // Functions
  Future<void> show() async {
    return AwesomeDialog(
      dialogType: dialogType ?? DialogType.NO_HEADER,
      desc: description,
      width: width,
      body: Column(
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
          if (description != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                description!,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.5),
              ),
            ),
          if (body != null) body!,
        ],
      ),
      btnOkText: confirmText ?? 'confirm'.tr,
      btnCancelText: cancelText ?? 'cancel'.tr,
      btnOkOnPress: onConfirm,
      btnCancelOnPress: !hasCancelButton ? null : onCancel ?? () {},
    ).show();
  }
}
