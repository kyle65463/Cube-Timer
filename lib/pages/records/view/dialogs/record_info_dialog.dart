import 'package:cubetimer/components/scramble_wrap.dart';
import 'package:cubetimer/components/time_display.dart';
import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/pages/records/controller/record_info_dialog_controller.dart';
import 'package:cubetimer/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RecordInfoDialog {
  // Constructor
  const RecordInfoDialog({
    required this.record,
  });

  // Variables
  final Record record;

  // Functions
  Future<void> show() async {
    CustomDialog(
      hasCancelButton: false,
      body: GetBuilder<RecordInfoDialogController>(
        init: RecordInfoDialogController(record: record),
        builder: (controller) {
          final bool hasPenalty = record.penalty is! PenaltyNone;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeDisplay(
                      rawTime: record.rawTime,
                      penalty: record.penalty,
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: Get.back,
                      child: FaIcon(
                        FontAwesomeIcons.times,
                        color: Colors.grey[600],
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ScrambleWrap(
                  scramble: record.scramble,
                ),
                const SizedBox(height: 12),
                Divider(
                  color: Colors.grey[500],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: controller.showDeleteRecordDialog,
                          child: const FaIcon(
                            FontAwesomeIcons.trash,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 25),
                        GestureDetector(
                          onTap: controller.showSetPenaltyDialog,
                          child: FaIcon(
                            FontAwesomeIcons.solidFlag,
                            color: hasPenalty ? Colors.blue : Colors.grey[600],
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(DateTImeUtils.parseOnlyDate(record.createTime)),
                        Text(DateTImeUtils.parseOnlyTime(record.createTime)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    ).show();
  }
}
