import 'package:cubetimer/pages/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class TimerPage extends StatelessWidget {
  // Constructor
  const TimerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Timer'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAll(const StatisticsPage());
            },
            child: const Text('to statistics'),
          ),
        ],
      ),
    );
  }
}
