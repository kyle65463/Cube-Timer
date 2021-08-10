import 'package:flutter/material.dart';
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
        children:  [
          Center(
            child: Text('timer'.tr),
          ),
        ],
      ),
    );
  }
}
