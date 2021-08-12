import 'package:cubetimer/dialog/controller/selection_dialog_controller.dart';
import 'package:cubetimer/dialog/dialog.dart';
import 'package:cubetimer/dialog/input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectionDialog {
  SelectionDialog({
    required this.title,
    required this.options,
    required this.originalIndex,
    this.onCreate,
  });

  // Variables
  final String title;
  final List<String> options;
  final int originalIndex;
  final Function? onCreate;

  // Functions
  Future<int?> show(BuildContext context) async {
    await MyDialog(
      title: title,
      body: GetBuilder<SelectionDialogController>(
        init: SelectionDialogController(
          options: options,
          currentIndex: originalIndex,
        ),
        builder: (controller) => Column(
          children: [
            ...controller.options.asMap().entries.map(
              (e) {
                final int index = e.key;
                final String title = e.value.tr;
                return ListTile(
                  title: Text(title),
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
                onTap: () async {
                  String? input = await InputDialog(
                    title: 'Enter the title',
                  ).show(context);
                  if (input != null) {
                    controller.addOption(input);
                    // onCreate!();
                  }
                },
                title: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.plus,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text('add'.tr),
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
    return Get.find<SelectionDialogController>().currentIndex;
  }
}
