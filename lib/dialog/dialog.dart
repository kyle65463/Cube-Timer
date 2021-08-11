import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class MyDialog {
  // Constructor
  MyDialog({
    required this.title,
    this.description,
    this.body,
    this.btnOkOnPressed,
    this.btnCancelOnPressed,
    this.hasCancelButton = true,
  });

  // Variables
  final String title;
  final String? description;
  final Widget? body;
  final bool hasCancelButton;
  final Function? btnOkOnPressed;
  final Function? btnCancelOnPressed;

  // Functions
  Future<dynamic> show(BuildContext context) async {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      title: title,
      desc: description,
      body: body != null
          ? Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                body!,
              ],
            )
          : null,
      btnOkOnPress: btnOkOnPressed,
      btnCancelOnPress: !hasCancelButton ? null : btnCancelOnPressed ?? () {},
    ).show();
  }
}
