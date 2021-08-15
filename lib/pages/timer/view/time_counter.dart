import 'package:cubetimer/components/time_display.dart';
import 'package:cubetimer/pages/timer/controller/timer_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';

class TimeCounter extends StatelessWidget {
  // Constructor
  const TimeCounter({Key? key}) : super(key: key);

  // Functions
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerPageController>(
      builder: (controller) {
        return StreamBuilder<int>(
          stream: controller.timer.rawTime,
          initialData: controller.currentTime,
          builder: (context, snapshot) {
            final int rawTime = snapshot.data!;
            final double fontSize = controller.getTimeCounterFontSize(rawTime);
            controller.currentTime = rawTime;
            return Swipe(
              verticalMinDisplacement: 30,
              horizontalMinDisplacement: 30,
              onSwipeUp: controller.showSetPenaltyDialog,
              onSwipeLeft: controller.showDeleteRecordDialog,
              onSwipeRight: controller.generateScramble,
              child: GestureDetector(
                onTap: controller.onTimerTriggered,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TimeDisplay(
                        rawTime: rawTime,
                        penalty: controller.penalty,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
