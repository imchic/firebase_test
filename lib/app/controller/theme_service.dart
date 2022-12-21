import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/global.dart';

class ThemeService {
  final _getStorage = GetStorage('theme');
  final themeBrightness = 'savedTheme';
  final themeColor = 'themeColor';

  ThemeMode getThemeMode() {
    String theme = getSavedTheme();
    Global.log.v('Loading theme: $theme');

    switch (theme) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  String getSavedTheme() {
    var value = _getStorage.read(themeBrightness);
    return value ?? 'light';
  }

  void setThemeMode(String theme) {
    _getStorage.write(themeBrightness, theme);
  }
}