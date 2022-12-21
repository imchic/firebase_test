import 'package:demo/app/constants/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {

  // RxBool _isLightTheme = false.obs;
  //
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //
  // _saveThemeStatus() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _isLightTheme.value);
  // }
  //
  // getThemeStatus() async {
  //   var _isLight = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') ?? true;
  //   }).obs;
  //   _isLightTheme.value = (await _isLight.value)!;
  //   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  //   Global.log.wtf(_isLightTheme.value.toString());
  // }

  showSnackBar(String title, String message) async {
    if (Get.isSnackbarOpen) {
      Get.back();
    } else {
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          //backgroundColor: isDarkMode.value ? Colors.white : Colors.black,
          //colorText: isDarkMode.value ? Colors.black : Colors.white,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10),
          borderRadius: 10,
          snackStyle: SnackStyle.FLOATING,
          animationDuration: const Duration(milliseconds: 500),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeInBack,
          overlayBlur: 0,
          overlayColor: Colors.black.withOpacity(0.5),
          mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('닫기'),
          ));
    }
  }
}
