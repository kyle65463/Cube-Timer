import 'package:cubetimer/components/selection_badge.dart';
import 'package:flutter/material.dart';

class StatTypeSelectionBadge extends StatelessWidget {
  // Constructor
  const StatTypeSelectionBadge({
    Key? key,
  }) : super(key: key);

  // Functions
  @override
  Widget build(BuildContext context) {
    return SelectionBadge(
      title: 'select',
      onTap: () {},
    );
  }
}
