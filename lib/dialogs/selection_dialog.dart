import 'package:cubetimer/components/popup_menu_position.dart';
import 'package:cubetimer/dialogs/controller/selection_dialog_controller.dart';
import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/dialogs/input_dialog.dart';
import 'package:cubetimer/models/interfaces/selectable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectionDialog {
  // Constructor
  SelectionDialog({
    required this.title,
    required this.options,
    this.originalOption,
    this.onCreate,
    this.onRename,
    this.onDelete,
    this.btnAddText,
    this.inputDialogTitle,
  });

  // Variables
  final String title;
  final List<Selectable> options;
  final Selectable? originalOption;
  final Function? onCreate;
  final Function? onRename;
  final Function? onDelete;
  final String? btnAddText;
  final String? inputDialogTitle;

  // Functions
  Future<Selectable?> show([BuildContext? context]) async {
    options.sort((a, b) => a.toString().compareTo(b.toString()));
    await CustomDialog(
      title: title,
      body: GetBuilder<SelectionDialogController>(
        init: SelectionDialogController(
          options: options,
          originalOption: originalOption,
        ),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              ...controller.options.asMap().entries.map(
                (e) {
                  final int index = e.key;
                  final String title = e.value.toString().tr;
                  final GlobalKey objKey = GlobalKey();
                  return ListTile(
                    key: objKey,
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
                    onLongPress: () async {
                      if (context != null) {
                        final items = <PopupMenuEntry<String>>[
                          // Edit
                          PopupMenuItem<String>(
                            value: 'rename',
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.pen,
                                  size: 15,
                                  color: Colors.grey[700],
                                ),
                                const SizedBox(width: 10),
                                Text('rename'.tr),
                              ],
                            ),
                          ),

                          // Delete
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.trash,
                                  size: 15,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 10),
                                Text('delete'.tr),
                              ],
                            ),
                          ),
                        ];
                        if (controller.options.length <= 1) {
                          items.removeLast();
                        }
                        final result = await showMenu(
                          context: context,
                          position: PopupMenuPosition.fromKeyAndContext(
                            objKey: objKey,
                            context: context,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey[200]!),
                          ),
                          items: items,
                        );
                        if (result == 'rename') {
                          final bool rename = await controller.rename(index);
                          if (rename) {
                            onRename!(e.value);
                          }
                        } else if (result == 'delete') {
                          controller.delete(e.value, onDelete!);
                        }
                      }
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
                    ).show();
                    if (input != null) {
                      final Selectable newOption =
                          await onCreate!(input) as Selectable;
                      controller.addOption(newOption);
                    }
                  },
                  title: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.plus,
                        size: 20,
                        color: Colors.blue[600],
                      ),
                      const SizedBox(width: 10),
                      Text(
                        btnAddText ?? 'add'.tr,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      onConfirm: () {},
      onCancel: () {
        Get.find<SelectionDialogController>().cancel();
      },
    ).show();

    // Return the selected index
    if (Get.find<SelectionDialogController>().isCanceled) return null;
    return Get.find<SelectionDialogController>().confirm();
  }
}
