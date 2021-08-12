import 'package:cubetimer/pages/timer/controller/timer_page_controller.dart';
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
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: controller.onTimerTriggered,
          child: Column(
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
