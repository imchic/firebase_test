import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';
import 'log_provider.dart';

// class FirebaseMessageProvider extends ChangeNotifier {
//   Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform);
//   }
//
//   Future<void> init() async {
//     //logProvider.show('info', 'firebase init');
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //logProvider.show('info', 'firebase onMessage');
//       //logProvider.show('info', 'firebase onMessage ${message.data}');
//       //logProvider.show('info', 'firebase onMessage ${message.notification}');
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       //logProvider.show('info', 'firebase onMessageOpenedApp');
//       //logProvider.show('info', 'firebase onMessageOpenedApp ${message.data}');
//       //logProvider.show('info', 'firebase onMessageOpenedApp ${message.notification}');
//     });
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     //logProvider.show('info', 'firebase init end');
//
//   }
// }
