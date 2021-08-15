import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TutorialSwipeOverlay {
  static void show() {
    if (Get.context != null) {
      TutorialSwipeOverlay.of(Get.context!)._show();
    }
  }

  BuildContext _context;

  void hide() {
    if (_enable) {
      Navigator.of(_context).pop();
      _enable = false;
    }
  }

  bool _enable = false;

  void _show() {
    if (!_enable) {
      _enable = true;
      showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (_) => _FullScreenLoader(
          close: hide,
        ),
      );
    }
  }

  Future<T> during<T>(Future<T> future) {
    _show();
    return future.whenComplete(() => hide());
  }

  TutorialSwipeOverlay._create(this._context);

  factory TutorialSwipeOverlay.of(BuildContext context) {
    return TutorialSwipeOverlay._create(context);
  }
}

class _FullScreenLoader extends StatefulWidget {
  const _FullScreenLoader({
    required this.close,
  });

  // Functions
  final VoidCallback close;

  @override
  __FullScreenLoaderState createState() => __FullScreenLoaderState();
}

class __FullScreenLoaderState extends State<_FullScreenLoader> {
  final int numPages = 3;
  int currentPage = 0;

  final List<String> imgPaths = [
    'assets/img/swipe-left.png',
    'assets/img/swipe-right.png',
    'assets/img/swipe-up.png',
  ];

  final List<String> texts = [
    'tutorial swipe left',
    'tutorial swipe right',
    'tutorial swipe up',
  ];

  // Functions
  void _onTap() {
    if (currentPage < numPages - 1) {
      setState(() {
        currentPage++;
      });
    } else {
      widget.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.75)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgPaths[currentPage],
                scale: 5,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 30),
              Text(
                texts[currentPage].tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.grey[300],
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
