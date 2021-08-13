import 'package:cubetimer/models/record/record.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordCard extends StatelessWidget {
  // Constructor
  const RecordCard({
    required this.record,
    required this.onTap,
    required this.onLongPress,
    Key? key,
  }) : super(key: key);

  // Variables
  final Record record;
  final void Function() onTap;
  final void Function() onLongPress;

  // Function
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.brown[100],
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Center(
          child: Text(
            record.toString(),
            style: GoogleFonts.gentiumBookBasic(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
