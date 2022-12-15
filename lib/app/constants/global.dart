import 'package:demo/app/controller/log_controller.dart';
import 'package:get/get.dart';

class Global {
  static const String appName = 'My App';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  static LogController log = Get.find<LogController>();
}