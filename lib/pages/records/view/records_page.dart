import 'package:cubetimer/pages/records/controller/records_page_controller.dart';
import 'package:cubetimer/pages/records/view/components/record_card.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
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
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount:
                          ((MediaQuery.of(context).size.width - 40) / 150)
                              .ceil(),
                      shrinkWrap: true,
                      childAspectRatio: 2,
                      children: controller.track.records.reversed.map(
                        (record) {
                          return RecordCard(
                            record: record,
                            showRecordInfo: controller.showRecordInfo,
                            onLongPress: controller.enterRecordsEditingMode,
                          );
                        },
                      ).toList(),
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
