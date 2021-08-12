import 'package:cubetimer/pages/records/controller/records_page_controller.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordsPage extends StatelessWidget {
  // Constructor
  RecordsPage({
    Key? key,
  }) : super(key: key);

  // Variables
  final RecordsPageController controller = Get.put(RecordsPageController());

  // Functions
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordsPageController>(
      builder: (controller) => Scaffold(
        body: FutureBuilder<void>(
          future: controller.initDone,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'records'.tr,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...controller.track.records
                        .map(
                            (e) => Text(TimerUtils.parseDisplayTime(e.rawTime)))
                        .toList(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
