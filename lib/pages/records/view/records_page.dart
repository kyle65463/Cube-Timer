import 'package:cubetimer/pages/records/controller/records_page_controller.dart';
import 'package:cubetimer/pages/records/view/components/record_card.dart';
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
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      controller.inEditMode ? '' : 'records'.tr,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: controller.session.records.isEmpty
                        ? Center(
                            child: Text(
                              'no data'.tr,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : GridView.count(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount:
                                ((MediaQuery.of(context).size.width - 40) / 150)
                                    .ceil(),
                            shrinkWrap: true,
                            childAspectRatio: 2,
                            children: controller.session.records.reversed.map(
                              (record) {
                                return RecordCard(
                                  record: record,
                                  inEditMode: controller.inEditMode,
                                  isSelected: controller.selectedRecords
                                      .contains(record),
                                  showRecordInfo: controller.showRecordInfo,
                                  enterEditMode: controller.enterEditMode,
                                  editSelected: controller.editSelected,
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
