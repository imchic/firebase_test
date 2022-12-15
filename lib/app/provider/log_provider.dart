import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogProvider extends ChangeNotifier {

  final String _log = '';

  String get log => _log;

  void show(String type, String message) {
    var logger = Logger();

    if(type == 'info') {
      logger.i(message);
    } else if(type == 'error') {
      logger.e(message);
    } else if(type == 'warning') {
      logger.w(message);
    } else if(type == 'debug') {
      logger.d(message);
    } else {
      logger.v(message);
    }

    notifyListeners();
  }
}