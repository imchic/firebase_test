import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  // keys
  static String userLoggedInKey = "ISLOGGEDIN";
  static String userEmployeeKey = "USEREMPLOYEE";
  static String userEmailKey = "USEREMAILKEY";

  // save data to shared preferences
  static Future<bool> saveUserLoggedInstatus(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserEmployee(String employee) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmployeeKey, employee);
  }

  static Future<bool> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, email);
  }

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey);
  }

}