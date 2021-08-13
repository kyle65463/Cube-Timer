import 'package:cubetimer/components/time_display.dart';
import 'package:cubetimer/dialogs/dialog.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeDisplay(
                  rawTime: record.rawTime,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.red,
                  size: 20,
                )
              ],
            ),
            Text(record.createTime.toString()),
            const SizedBox(height: 15),
          ],
        ),
      ),
    ).show();
  }
}
