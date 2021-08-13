import 'package:cubetimer/components/scramble_wrap.dart';
import 'package:cubetimer/pages/timer/controller/timer_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerPage extends StatelessWidget {
  // Constructor
  TimerPage({
    Key? key,
  }) : super(key: key);

  // Variables
  final TimerPageController controller = Get.put(TimerPageController());

  // Functions
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerPageController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: controller.onTimerTriggered,
            child: Column(
              children: [
                ScrambleWrap(
                  scramble: controller.scramble,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
