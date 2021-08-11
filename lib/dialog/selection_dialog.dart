import 'package:cubetimer/dialog/controller/selection_dialog_controller.dart';
import 'package:cubetimer/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionDialog {
  SelectionDialog({
    required this.title,
    required this.options,
    required this.originalIndex,
  });

  // Variables
  final String title;
  final List<String> options;
  final int originalIndex;

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
                return TextButton(
                  onPressed: () {
                    controller.select(index);
                  },
                  child: Text(
                    '${e.key} ${e.value.tr}${controller.currentIndex == e.key ? '   selected' : ''}',
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
      btnOkOnPressed: () {},
      btnCancelOnPressed: () {},
    ).show(context);
    return Get.find<SelectionDialogController>().currentIndex;
  }
}
