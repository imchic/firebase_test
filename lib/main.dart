import 'dart:async';

import 'package:demo/app/constants/global.dart';
import 'package:demo/app/controller/log_controller.dart';
import 'package:demo/app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'capi demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    Get.put(LogController());

    return Scaffold(
      appBar: capiAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            setDateTextAndUserInfo(),
            setDashboardTextImage(),
            setSurveyDataInfo(context),
          ],
        ),
      ),
    );
  }
}

// 대시보드 텍스트 이미지
setDashboardTextImage() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: 50),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'assets/images/img_dashboard_center_text.png',
            width: 200,
            height: 200,
          ),
          SizedBox(width: 20),
          Image.asset(
            'assets/images/img_dashboard_right.png',
            width: 350,
          ),
        ]),
      ),
    ],
  );
}

// 조사결과
setSurveyDataInfo(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
          child: Container(
        // display with만큼
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Get.isDarkMode ? Colors.black : Colors.white,
          //color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '조사현황',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '대상가구수',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '963',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '|',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '완료',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '88',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '|',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '미완료',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '93',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                '|',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              SizedBox(width: 5),
              Text(
                '조사현황',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '74',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ))
    ],
  );
}

/// 앱 바
capiAppBar() {
  return AppBar(
      automaticallyImplyLeading: true,
      leading: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_outlined),
            onPressed: () {
              Get.back();
            },
          ),
          Image(
              image: AssetImage('assets/images/sos.png'),
              width: 80,
              height: 50),
        ],
      ),
      leadingWidth: 140.0,
      // menu button on the right
      actions: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Global.log.i('timer button pressed');
                },
                icon: const Icon(Icons.timer_outlined)),
            Text('55:29'),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ],
      //leadingWidth: 120.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/2022_census.png',
            width: 100,
            height: 55,
          ),
          SizedBox(width: 10.0),
          Image.asset(
            'assets/images/cesnus_txt.png',
            width: 100,
            height: 55,
          ),
        ],
      ));
}

getStatusExample() {
  // switch with controller value
  // Switch(
  //     value: flag,
  //     onChanged: (value) {
  //       setState(() {
  //         flag = value;
  //         if (flag) {
  //           Get.changeThemeMode(ThemeMode.dark);
  //         } else {
  //           Get.changeThemeMode(ThemeMode.light);
  //         }
  //       });
  //     }),
  // ElevatedButton(
  //     onPressed: () => setState(() {
  //           flag = !flag;
  //         }),
  //     child: Text('switch')),
}

/// 시스템 대시보드 텍스트
setDateTextAndUserInfo() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 30, left: 60, right: 60),
        child: Row(
          children: [
            // left
            Row(
              children: [
                Text('Census System',
                    style: AppTheme.textTheme.headline4?.copyWith(
                        color: Get.isDarkMode
                            ? AppTheme.lightTheme.primaryColor
                            : AppTheme.darkTheme.primaryColor,
                        fontWeight: FontWeight.w700)),
                SizedBox(width: 15),
                Text('|',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                        color: Get.isDarkMode
                            ? AppTheme.lightTheme.colorScheme.surface
                            : AppTheme.darkTheme.colorScheme.surface,
                        fontWeight: FontWeight.w700)),
                SizedBox(width: 15),
              ],
            ),
            // center
            Expanded(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(setDate(),
                      style: AppTheme.textTheme.bodyMedium?.copyWith(
                          color: Get.isDarkMode
                              ? AppTheme.lightTheme.colorScheme.surface
                              : AppTheme.darkTheme.colorScheme.surface,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            // right
            Row(
              children: [
                Icon(Icons.person_outline,
                    color: Get.isDarkMode
                        ? AppTheme.lightTheme.primaryColor
                        : AppTheme.darkTheme.primaryColor),
                Text('김철수',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                        color: Get.isDarkMode
                            ? AppTheme.lightTheme.colorScheme.outline
                            : AppTheme.darkTheme.colorScheme.outline,
                        fontWeight: FontWeight.w700)),
                SizedBox(width: 5),
                Text('사원',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      color: Get.isDarkMode
                          ? AppTheme.lightTheme.primaryColor
                          : AppTheme.darkTheme.primaryColor,
                    )),
              ],
            ),
          ],
        ),
      )

      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      //   child: Row(
      //     children: [
      //       Text('Census System',
      //           style: AppTheme.textTheme.headline4?.copyWith(
      //             color: Get.isDarkMode
      //                 ? AppTheme.lightTheme.primaryColor
      //                 : AppTheme.darkTheme.primaryColor,
      //           )),
      //     ],
      //   ),
      // ),
      // SizedBox(height: 10),
      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      //   child: Row(
      //     children: [
      //       Row(
      //         children: [
      //           Text(setDate(),
      //               style: AppTheme.textTheme.bodyMedium?.copyWith(
      //                 color: Get.isDarkMode
      //                     ? AppTheme.lightTheme.colorScheme.surface
      //                     : AppTheme.darkTheme.colorScheme.surface,
      //               )),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Text('  |  '),
      //           Icon(
      //             Icons.person,
      //             color: Get.isDarkMode
      //                 ? AppTheme.lightTheme.colorScheme.surface
      //                 : AppTheme.darkTheme.colorScheme.surface,
      //           ),
      //           Text(' 홍길동 조사원님 환영합니다.'),
      //           SizedBox(width: 10),
      //           Icon(
      //             Icons.cloud,
      //             color: Get.isDarkMode
      //                 ? AppTheme.lightTheme.colorScheme.surface
      //                 : AppTheme.darkTheme.colorScheme.surface,
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    ],
  );
}

// 날짜 가져오기
setDate() {
  DateTime dateToday = DateTime.now();
  String date = dateToday.toString().substring(0, 10);

  // 요일 가져오기
  String day = dateToday.weekday.toString();
  String dayString = '';
  switch (day) {
    case '1':
      dayString = '월';
      break;
    case '2':
      dayString = '화';
      break;
    case '3':
      dayString = '수';
      break;
    case '4':
      dayString = '목';
      break;
    case '5':
      dayString = '금';
      break;
    case '6':
      dayString = '토';
      break;
    case '7':
      dayString = '일';
      break;
  }

  // 현재 시간
  String time = dateToday.toString().substring(11, 19);

  // 24hour -> 12hour convert
  String hour = time.substring(0, 2);
  String minute = time.substring(3, 5);
  String second = time.substring(6, 8);
  String ampm = '오전';
  if (int.parse(hour) > 12) {
    hour = (int.parse(hour) - 12).toString();
    ampm = '오후';
  }

  var sumTimeStr = '$ampm $hour:$minute';
  //Global.log.d('sumTimeStr: $sumTimeStr');

  // 1분마다 시간 갱신
  Timer.periodic(Duration(seconds: 60), (timer) {
    DateTime dateToday = DateTime.now();
    String time = dateToday.toString().substring(11, 19);

    // 24hour -> 12hour convert
    String hour = time.substring(0, 2);
    String minute = time.substring(3, 5);
    String second = time.substring(6, 8);
    String ampm = '오전';
    if (int.parse(hour) > 12) {
      hour = (int.parse(hour) - 12).toString();
      ampm = '오후';
    }

    var sumTimeStr = '$ampm $hour:$minute';
    //Global.log.wtf('sumTimeStr: $sumTimeStr');
  });

  return "${date.replaceAll("-", ".")}($dayString) $sumTimeStr";
}
