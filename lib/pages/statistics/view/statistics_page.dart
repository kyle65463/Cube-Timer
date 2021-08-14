import 'package:badges/badges.dart';
import 'package:cubetimer/components/title_section.dart';
import 'package:cubetimer/models/settings/options/stat_record_count.dart';
import 'package:cubetimer/models/statistics/data/table_data.dart';
import 'package:cubetimer/pages/statistics/controller/statistics_controller.dart';
import 'package:cubetimer/pages/statistics/view/chart_legend.dart';
import 'package:cubetimer/pages/statistics/view/line_chart.dart';
import 'package:cubetimer/pages/statistics/view/stat_table.dart';
import 'package:cubetimer/pages/statistics/view/stat_type_selection_badge.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StatLineChart(
                    data: controller.lineChartData,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Legends
                      Row(
                        children: controller.lineChartData.lines
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: ChartLegend(lineData: e),
                                ))
                            .toList(),
                      ),

                      // Stat type selection badge
                      StatTypeSelectionBadge(
                        statRecordCount: controller.statRecordCount,
                        statRecordCountKey: controller.statRecordCountKey,
                        updateSettings: controller.updateSettings,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: StatTable(
                    data: controller.singleStatTableData,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
