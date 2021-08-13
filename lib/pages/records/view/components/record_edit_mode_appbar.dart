import 'package:cubetimer/pages/records/controller/records_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RecordEditModeAppbar extends StatelessWidget {
  // Constructor
  const RecordEditModeAppbar({
    Key? key,
  }) : super(key: key);

  // Functions
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordsPageController>(builder: (controller) {
      return AppBar(
        title: Text(
          'num records selected'.trParams({
            'num': controller.selectedRecords.length.toString(),
          }),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: controller.leaveEditMode,
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.showDeleteRecordsDialog,
            icon: FaIcon(
              FontAwesomeIcons.trash,
              color: Colors.grey[600],
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
        ],
        centerTitle: false,
        backgroundColor: Colors.brown[100],
      );
    });
  }
}
