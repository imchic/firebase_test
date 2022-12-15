import 'package:demo/app/constants/global.dart';
import 'package:demo/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_4),
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(AppTheme.lightTheme)
                    : Get.changeTheme(AppTheme.darkTheme);
                Global.log
                    .d('테마 변경 ${Get.isDarkMode ? '라이트 모드로 변경' : '다크 모드로 변경'}');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _auth.signOut();
                    Global.log.wtf('로그아웃');
                  },
                  child: Text('로그아웃', style: AppTheme.textTheme.button))
            ],
          ),
        ));
  }
}
