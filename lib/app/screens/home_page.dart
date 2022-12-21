import 'package:demo/app/constants/global.dart';
import 'package:demo/app/controller/app_controller.dart';
import 'package:demo/app/controller/theme_service.dart';
import 'package:demo/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthService _auth = AuthService();
    ThemeService _theme = ThemeService();
    AppController _app = Get.find<AppController>();

    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: Text('대시보드'),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_4),
              onPressed: () {

                if(_theme.getSavedTheme() == 'light') {
                  _theme.setThemeMode('dark');
                  Get.changeTheme(AppTheme.darkTheme);
                } else {
                  _theme.setThemeMode('light');
                  Get.changeTheme(AppTheme.lightTheme);
                }

                Global.log.wtf('Theme: ${_theme.getSavedTheme()}');

              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ));
  }
}
