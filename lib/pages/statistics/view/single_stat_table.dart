import 'package:cubetimer/models/statistics/stat_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleStatTable extends StatelessWidget {
  // Constructor
  const SingleStatTable({
    required this.data,
    Key? key,
  }) : super(key: key);

  // Variables
  final SingleStatTableData data;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...data.displayedData.entries.map(
          (e) {
            return Text('${e.key.tr}: ${e.value}');
          },
        ).toList(),
      ],
    );
  }
}
