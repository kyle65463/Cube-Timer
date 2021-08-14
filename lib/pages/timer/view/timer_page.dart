import 'package:cubetimer/components/scramble_wrap.dart';
import 'package:cubetimer/models/record/record.dart';
import 'package:cubetimer/pages/timer/controller/timer_page_controller.dart';
import 'package:cubetimer/utils/statistics_utils.dart';
import 'package:cubetimer/utils/timer_utils.dart';
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
      builder: (controller) {
        final List<int> times =
            controller.records.map((e) => e.penalty.apply(e.rawTime)).toList();
        final int ao5 = StatUtils.ao5(times);
        final int ao12 = StatUtils.ao12(times); 
        final int best = StatUtils.best(times); 
        final String ao5Str = TimerUtils.parseTime(ao5);
        final String ao12Str = TimerUtils.parseTime(ao12);
        final String bestStr = TimerUtils.parseTime(best);
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: controller.onTimerTriggered,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: !controller.isRunning
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 38),
                              Row(
                                children: [
                                  Text(
                                    '${controller.cube.toString().tr} ${'timer'.tr}',
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
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ao5: $ao5Str'),
                                  Text('Ao12: $ao12Str'),
                                  Text('Best: $bestStr'),
                                  Text('Count: 15'),
                                  const SizedBox(height: 20),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}
