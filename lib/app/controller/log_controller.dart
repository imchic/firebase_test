import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LogController extends GetxController {

  var log = ''.obs;
  var logger = Logger();

  void v(String message) {
    logger.v(message);
    log.value = message;
  }

  void d(String message) {
    logger.d(message);
    log.value = message;
  }

  void i(String message) {
    logger.i(message);
    log.value = message;
  }

  void w(String message) {
    logger.w(message);
    log.value = message;
  }

  void e(String message) {
    logger.e(message);
    log.value = message;
  }

  void wtf(String message) {
    logger.wtf(message);
    log.value = message;
  }
}