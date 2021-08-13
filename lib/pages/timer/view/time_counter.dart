import 'package:cubetimer/components/time_display.dart';
import 'package:cubetimer/pages/timer/controller/timer_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeCounter extends StatelessWidget {
  TimeCounter({Key? key}) : super(key: key);
  final TimerPageController controller = Get.find<TimerPageController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: controller.timer.rawTime,
      initialData: controller.currentTime,
      builder: (context, snapshot) {
        final int rawTime = snapshot.data!;
        final double fontSize = controller.getTimeCounterFontSize(rawTime);
        controller.currentTime = rawTime;
        return GestureDetector(
          onTap: controller.onTimerTriggered,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TimeDisplay(
                  rawTime: rawTime,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
