import 'package:cubetimer/components/time_display.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordCard extends StatelessWidget {
  // Constructor
  const RecordCard({
    required this.record,
    required this.showRecordInfo,
    required this.onLongPress,
    Key? key,
  }) : super(key: key);

  // Variables
  final Record record;
  final Function showRecordInfo;
  final void Function() onLongPress;

  // Function
  void _onTap() {
    showRecordInfo(record);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.brown[100],
      child: InkWell(
        onTap: _onTap,
        onLongPress: onLongPress,
        child: Center(
          child: TimeDisplay(
            rawTime: record.rawTime,
            style: const TextStyle(
              fontSize: 23,
            ),
          ),
        ),
      ),
    );
  }
}
