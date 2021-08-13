import 'package:cubetimer/components/time_display.dart';
import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecordCard extends StatelessWidget {
  // Constructor
  const RecordCard({
    required this.record,
    required this.inEditMode,
    required this.isSelected,
    required this.showRecordInfo,
    required this.editSelected,
    required this.enterEditMode,
    Key? key,
  }) : super(key: key);

  // Variables
  final Record record;
  final bool inEditMode;
  final bool isSelected;
  final Function showRecordInfo;
  final Function editSelected;
  final Function enterEditMode;

  // Function
  void _onTap() {
    if (inEditMode) {
      editSelected(record);
    } else {
      showRecordInfo(record);
    }
  }

  void _onLongPress() {
    if (!inEditMode) enterEditMode(record);
  }

  @override
  Widget build(BuildContext context) {
    final bool hasPenalty = record.penalty is! PenaltyNone;
    return Card(
      shape: RoundedRectangleBorder(
        side: isSelected
            ? BorderSide(
                color: Colors.grey[700]!,
                width: 1.5,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.brown[100],
      child: InkWell(
        onTap: _onTap,
        onLongPress: _onLongPress,
        child: Stack(
          children: [
            Center(
              child: TimeDisplay(
                rawTime: record.rawTime,
                penalty: record.penalty,
                style: const TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            if (hasPenalty)
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  child: FaIcon(
                    FontAwesomeIcons.solidFlag,
                    color: Colors.blue[700],
                    size: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
