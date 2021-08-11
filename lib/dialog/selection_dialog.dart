import 'package:cubetimer/dialog/controller/selection_dialog_controller.dart';
import 'package:cubetimer/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          ],
        ),
      ),
      btnOkOnPressed: () {},
      btnCancelOnPressed: () {},
    ).show(context);

    // Return the selected index
    return Get.find<SelectionDialogController>().currentIndex;
  }
}
