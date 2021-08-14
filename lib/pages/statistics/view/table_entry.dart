import 'package:flutter/material.dart';

class TableEntry extends StatelessWidget {
  // Constructor
  const TableEntry({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  // Variables
  final String title;
  final String value;

  // Functions
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            wordSpacing: 3,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
