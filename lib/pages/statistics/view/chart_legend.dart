import 'package:flutter/material.dart';

class ChartLegend extends StatelessWidget {
  // Constructor
  const ChartLegend({
    required this.name,
    required this.color,
    Key? key,
  }) : super(key: key);

  // Variables
  final String name;
  final Color? color;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 15,
        height: 3,
        color: Colors.lightBlue[800],
        // decoration: const BoxDecoration(
        //   color: Colors.orange,
        //   shape: BoxShape.circle,
        // ),
      ),
      Text('全部'),
    ]);
  }
}
