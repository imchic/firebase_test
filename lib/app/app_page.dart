import 'package:demo/app/screens/login_page.dart';
import 'package:demo/app/screens/home_page.dart';
import 'package:demo/app/screens/sign_up.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static final rotues = [
    GetPage(name: "/home", page: () => HomePage(),),
    GetPage(name: "/login", page: () => LoginPage(),),
    GetPage(name: "/signup", page: () => SignUpPage()),
  ];
}
