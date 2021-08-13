import 'package:cubetimer/components/scramble_wrap.dart';
import 'package:cubetimer/pages/timer/controller/timer_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: !controller.isRunning
                  ? Column(
                      children: [
                        const SizedBox(height: 38),
                        Row(
                          children: [
                            Text(
                              '3x3 Timer'.tr,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                            const SizedBox(width: 10),
                            FaIcon(
                              FontAwesomeIcons.angleDown,
                              size: 20,
                              color: Colors.grey[800],
                            )
                          ],
                        ),
                        const SizedBox(height: 35),
                        Container(
                          alignment: Alignment.center,
                          child: ScrambleWrap(
                            scramble: controller.scramble,
                            alignment: WrapAlignment.center,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
