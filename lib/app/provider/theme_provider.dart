import 'package:flutter/material.dart';

import '../values/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  getTheme() => _themeData;

  bool isDarkTheme = false;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    if(themeData == AppTheme.darkTheme) {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }
    notifyListeners();
  }
}