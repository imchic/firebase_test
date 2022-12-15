import 'package:demo/app/controller/app_controller.dart';
import 'package:demo/app/controller/log_controller.dart';
import 'package:demo/app/screens/home_page.dart';
import 'package:demo/app/screens/login_page.dart';
import 'package:demo/app/services/helper.dart';
import 'package:demo/app/values/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> with WidgetsBindingObserver {
  final LogController log = Get.put(LogController());
  final AppController app = Get.put(AppController());

  bool _isSignedIn = false;

  @override
  void initState() {
    getUserLoggedInStatus();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //app.changeTheme();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        log.v('앱 실행중');
        break;
      case AppLifecycleState.inactive:
        log.v('앱 비활성화');
        break;
      case AppLifecycleState.detached:
        log.v('앱 종료');
        break;
      case AppLifecycleState.paused:
        log.v('앱 일시정지');
        break;
    }
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness(); // make sure you call this
    app.changeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo App',
      darkTheme: AppTheme.darkTheme,
      theme: app.isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme,
      getPages: AppPages.rotues,
      initialBinding: BindingsBuilder(
        () {
          WidgetsFlutterBinding.ensureInitialized();
          Firebase.initializeApp();
          log;
          app;
        },
      ),
      home: _isSignedIn ? HomePage() : LoginPage(),
    );
  }

  getUserLoggedInStatus() async {
    await Helper.getUserLoggedInStatus().then((value) {
      log.d('로그인 상태: $value');
      if(value != null){
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
}
