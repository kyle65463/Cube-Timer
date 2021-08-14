import 'package:cubetimer/components/title_section.dart';
import 'package:cubetimer/models/statistics/stat_data.dart';
import 'package:cubetimer/pages/statistics/controller/statistics_controller.dart';
import 'package:cubetimer/pages/statistics/view/stat_chart.dart';
import 'package:cubetimer/utils/statistics_utils.dart';
import 'package:cubetimer/utils/timer_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsPage extends StatelessWidget {
  // Constructor
  StatisticsPage({
    Key? key,
  }) : super(key: key);

  // Variables
  final StatisticsController controller =
      Get.put<StatisticsController>(StatisticsController());

  // Functions
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleSection(title: 'statistics'.tr),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: StatChart(stats: controller.stats),
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
