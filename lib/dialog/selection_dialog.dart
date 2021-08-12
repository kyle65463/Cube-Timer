import 'package:cubetimer/dialog/controller/selection_dialog_controller.dart';
import 'package:cubetimer/dialog/dialog.dart';
import 'package:cubetimer/dialog/input_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectionDialog {
  SelectionDialog({
    required this.title,
    required this.options,
    required this.originalOption,
    this.onCreate,
    this.btnAddText,
    this.inputDialogTitle,
  });

  // Variables
  final String title;
  final List<Selectable> options;
  final Selectable originalOption;
  final Function? onCreate;
  final String? btnAddText;
  final String? inputDialogTitle;

  // Functions
  Future<Selectable?> show(BuildContext context) async {
    options.sort((a, b) => a.toString().compareTo(b.toString()));
    await MyDialog(
      title: title,
      body: GetBuilder<SelectionDialogController>(
        init: SelectionDialogController(
          options: options,
          originalOption: originalOption,
        ),
        builder: (controller) => Column(
          children: [
            ...controller.options.asMap().entries.map(
              (e) {
                final int index = e.key;
                final String title = e.value.toString().tr;
                return ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(fontSize: 17),
                  ),
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  trailing: index == controller.currentIndex
                      ? const FaIcon(
                          FontAwesomeIcons.check,
                          size: 20,
                        )
                      : null,
                  onTap: () {
                    controller.select(index);
                  },
                );
              },
            ).toList(),
            if (onCreate != null)
              ListTile(
                dense: true,
                onTap: () async {
                  final String? input = await InputDialog(
                    title: inputDialogTitle ?? 'enter'.tr,
                  ).show(context);
                  if (input != null) {
                    final Selectable newOption =
                        await onCreate!(input) as Selectable;
                    controller.addOption(newOption);
                  }
                },
                title: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.plus,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      btnAddText ?? 'add'.tr,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      btnOkOnPressed: () {},
      btnCancelOnPressed: () {
        Get.find<SelectionDialogController>().cancel();
      },
    ).show(context);

    // Return the selected index
    if (Get.find<SelectionDialogController>().isCanceled) return null;
    return Get.find<SelectionDialogController>().confirm();
  }
}
