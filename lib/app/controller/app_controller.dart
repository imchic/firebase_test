import 'package:demo/app/controller/log_controller.dart';
import 'package:demo/app/values/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../firebase_options.dart';

class AppController extends GetxController {

  // 메시징 서비스 기본 객체 생성
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // 로그 컨트롤러
  final LogController log = Get.find();

  // 시스템 테마 설정
  RxBool isDarkMode = false.obs;

  void _showSnackBar(String message) async {
    Get.snackbar('알림', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: isDarkMode.value ? Colors.white : Colors.black,
        colorText: isDarkMode.value ? Colors.black : Colors.white,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        borderRadius: 10,
        isDismissible: true
    );
  }
  
  getSystemTheme(BuildContext context) async {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = brightness == Brightness.dark;
    log.v('isDark: $isDark');
    if(isDark) {
      isDarkMode.value = true;
    } else {
      isDarkMode.value = false;
    }
  }

  changeTheme() {

    // 시스템 테마 구별
    var brightness = WidgetsBinding.instance.window.platformBrightness;

    if(brightness == Brightness.dark) {
      Get.changeTheme(AppTheme.darkTheme);
      isDarkMode.value = true;
    } else {
      Get.changeTheme(AppTheme.lightTheme);
      isDarkMode.value = false;
    }

    var message = isDarkMode.value ? '다크 모드로 변경' : '라이트 모드로 변경';
    _showSnackBar('테마 변경 : $message');


  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

    // 모바일에서만 실행
    if (GetPlatform.isMobile) {
      log.v('onBackgroundMessage: ${message.messageId}');
      await Firebase.initializeApp();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      flutterLocalNotificationsPlugin.show(
          message.notification.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: message.notification!.android!.smallIcon,
            ),
          ));

      log.i('A background message just showed up : ${message.messageId}');
    }
  }

  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> onInit() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log.d('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log.d('User granted provisional permission');
    } else {
      log.d('User declined or has not accepted permission');
    }

    log.i('User granted permission: ${settings.authorizationStatus}');

    _init();
    _onMessage();
    _getToken();

    super.onInit();
  }

  void _init() async {
    // 앱이 백그라운드에서 실행중일 때 메시지가 도착하면 호출될 콜백 함수 등록
    FirebaseMessaging.onBackgroundMessage(
        (message) => _firebaseMessagingBackgroundHandler(message));

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_sh'),
            // flutter noti change icon (android)
            iOS: IOSInitializationSettings()),
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        log.d('notification payload: $payload');
      }
    });
  }

  void _onMessage() {
    // foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteMessage notification = message;
      RemoteNotification? remoteNotification = notification.notification;
      AndroidNotification? android = remoteNotification?.android;

      if (remoteNotification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.notification.hashCode,
            remoteNotification.title,
            remoteNotification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android.smallIcon,
              ),
            ),
            payload: remoteNotification.body);

        log.i('onMessage ${message.data}');
        log.i('onMessage ${message.notification}');
      }
    });

    // background message handler
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log.i('onMessageOpenedApp ${message.data}');
      log.i('onMessageOpenedApp ${message.data['id']}');
    });
  }

  // 디바이스 토큰 가져오기
  void _getToken() async {
    try {
      String? token = await messaging.getToken();
      log.i('token: $token');
    } catch (e) {
      log.e(e.toString());
    }
  }
}
