import 'dart:developer';

import 'package:demo/app/controller/log_controller.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  // log controller
  final LogController logController = Get.find();

  void increment() {
    count++;
    logController.i('Count incremented to $count');
  }

  void decrement() {
    count--;
    logController.i('Count decremented to $count');
  }
}