import 'package:flutter/material.dart';

class PopupMenuPosition {
  static RelativeRect fromKeyAndContext({
    required GlobalKey objKey,
    required BuildContext context,
    Offset offset = const Offset(20, 20),
  }) {
    final RenderBox object = objKey.currentContext!.findRenderObject() as RenderBox;
    final screenPos =
        Overlay.of(context)!.context.findRenderObject()!.semanticBounds.size;
    final objWidth = object.size.width;
    final globalPos = object.localToGlobal(Offset.zero);
    return RelativeRect.fromRect(
      Offset(globalPos.dx + objWidth - offset.dx, globalPos.dy + offset.dy) &
          const Size(0, 0),
      Offset.zero & screenPos,
    );
  }
}
