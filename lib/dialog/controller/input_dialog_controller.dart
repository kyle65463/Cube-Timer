import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InputDialogController extends GetxController {
  // Constructor
  InputDialogController();

  // Variables
  final TextEditingController inputController = TextEditingController();
  final GlobalKey<FormState> inputKey = GlobalKey<FormState>();
  bool get isCanceled => _isCanceled;
  bool _isCanceled = false;

  // Functions
  void cancel() {
    _isCanceled = true;
  }

  String? validate() {
    if (inputController.text.isNotEmpty) return inputController.text;
    return null;
  }
}
