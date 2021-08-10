import 'package:cubetimer/pages/timer/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class StatisticsPage extends StatelessWidget {
  // Constructor
  const StatisticsPage({
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
            child: Text('Statistics'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAll(const TimerPage());
            },
            child: const Text('to timer'),
          ),
        ],
      ),
    );
  }
}
