import 'package:flutter/material.dart';

class TableEntry extends StatelessWidget {
  // Constructor
  const TableEntry({
    required this.title,
    required this.value,
    this.dense = false,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final String value;
  final bool dense;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title: ',
          style: TextStyle(
            fontSize: 16,
            height: dense == false ? 1.5 : null,
            wordSpacing: 3,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800]?.withOpacity(0.85),
          ),
        ),
      ],
    );
  }
}
