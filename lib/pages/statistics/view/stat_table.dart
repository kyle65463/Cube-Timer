import 'package:cubetimer/models/statistics/data/table_data.dart';
import 'package:cubetimer/pages/statistics/view/table_entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatTable extends StatelessWidget {
  // Constructor
  const StatTable({
    required this.data,
    Key? key,
  }) : super(key: key);

  // Variables
  final SingleStatTableData data;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sec 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...data.sec1.entries
                      .map(
                          (e) => TableEntry(title: e.key.tr, value: e.value.tr))
                      .toList(),
                  // const SizedBox(height: 10),
                  ...data.sec2.entries
                      .map(
                          (e) => TableEntry(title: e.key.tr, value: e.value.tr))
                      .toList(),
                ],
              ),

              const SizedBox(width: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: data.sec3.entries
                    .map((e) => TableEntry(title: e.key.tr, value: e.value.tr))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
