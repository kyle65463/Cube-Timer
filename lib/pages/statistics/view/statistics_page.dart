import 'package:badges/badges.dart';
import 'package:cubetimer/components/title_section.dart';
import 'package:cubetimer/models/statistics/data/table_data.dart';
import 'package:cubetimer/pages/statistics/controller/statistics_controller.dart';
import 'package:cubetimer/pages/statistics/view/chart_legend.dart';
import 'package:cubetimer/pages/statistics/view/stat_chart.dart';
import 'package:cubetimer/pages/statistics/view/single_stat_table.dart';
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
                  child: StatChart(
                    data: controller.lineChartData,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: controller.lineChartData.lines
                            .map((e) => ChartLegend(lineData: e))
                            .toList(),
                      ),
                      // ChartLegend(otherStats: controller.stats),
                      StatTypeSelectionBadge(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SingleStatTable(
                  data: controller.singleStatTableData,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
