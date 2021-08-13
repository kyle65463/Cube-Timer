import 'package:cubetimer/models/record/penalty.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeDisplay extends StatelessWidget {
  // Constructor
  const TimeDisplay({
    required this.rawTime,
    this.style,
    this.penalty,
    Key? key,
  }) : super(key: key);

  // Variables
  final int rawTime;
  final TextStyle? style;
  final Penalty? penalty;

  // Functions
  @override
  Widget build(BuildContext context) {
    final bool isDNF = penalty is PenaltyDNF;
    if (isDNF) {
      return Text(
        'DNF',
        style: TextStyle(
          fontSize: (style?.fontSize ?? 30) * 0.65,
          fontWeight: style?.fontWeight,
          color: style?.color,
          height: 1,
        ),
      );
    } else {
      final int time = penalty?.apply(rawTime) ?? rawTime;
      final List<String> displayTime =
          TimerUtils.parseTime(time).split('.');
      final String seconds = displayTime.first;
      final String milliseconds = displayTime.last;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            seconds,
            style: GoogleFonts.gentiumBookBasic(
              textStyle: TextStyle(
                fontSize: (style?.fontSize ?? 30) * 1,
                fontWeight: style?.fontWeight,
                color: style?.color,
                height: 1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: (style?.fontSize ?? 30) * 0.03),
            child: Text(
              '.$milliseconds',
              style: GoogleFonts.gentiumBookBasic(
                textStyle: TextStyle(
                  fontSize: (style?.fontSize ?? 30) * 0.85,
                  fontWeight: style?.fontWeight,
                  color: style?.color,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
