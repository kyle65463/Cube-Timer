import 'package:cubetimer/pages/timer/timer_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerPage extends StatelessWidget {
  // Constructor
  TimerPage({
    Key? key,
  }) : super(key: key);

  final TimerPageController controller = Get.put(TimerPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<int>(
          stream: controller.timer.rawTime,
          initialData: controller.currentTime,
          builder: (context, snapshot) {
            final int time = snapshot.data!;
            final String displayTime = controller.parseDisplayTime(time);
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: controller.onTimerTriggered,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      displayTime,
                      style: TextStyle(
                        fontSize: 70,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
