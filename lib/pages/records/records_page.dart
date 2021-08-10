import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordsPage extends StatelessWidget {
  // Constructor
  const RecordsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('records'.tr),
          ),
        ],
      ),
    );
  }
}
