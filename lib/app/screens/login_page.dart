import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/app/controller/log_controller.dart';
import 'package:demo/app/screens/sign_up.dart';
import 'package:demo/app/services/auth_service.dart';
import 'package:demo/app/services/data_service.dart';
import 'package:demo/app/services/helper.dart';
import 'package:demo/app/values/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppController app = Get.find();
  LogController log = Get.find();

  final formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool _isLoading = false;

  String employee = "";
  String pw = "";

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Text(
                  '현장조사 모바일',
                  style: AppTheme.textTheme.headline4,
                ),
                const SizedBox(height: 30),
                const Text('On-site Survey Mobile',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/ic_sh_logo.png',
                  width: 150,
                  height: 100,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: '사원번호',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    suffixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      employee = value;
                      log.d(employee);
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '사원번호를 입력해주세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: isVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  onChanged: (value) {
                    pw = value;
                    log.d(pw);
                  },
                  validator: (value) {
                    if (value!.length < 6 || value.isEmpty) {
                      return '비밀번호를 6자 이상 입력해주세요.';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: app.isDarkMode.value
                      //     ? AppTheme.darkTheme.colorScheme.primary
                      //     : AppTheme.lightTheme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text.rich(
                  TextSpan(
                    text: '아이디가 없으신가요? ',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '회원가입',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Get.offAllNamed('/signup');
                            Get.to(SignUpPage(), transition: Transition.fade);
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth.loginWithUserNameandPassword(employee, pw).then((value) async {
        if (value == true) {
          QuerySnapshot querySnapshot =
              await DataService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(employee);

          await Helper.saveUserLoggedInstatus(true);
          await Helper.saveUserEmployee(employee);
          await Helper.saveUserEmail(querySnapshot.docs[0].get('email'));
          Get.to(HomePage(), transition: Transition.fade);
        } else {
          Get.snackbar('로그인 실패', '사원번호 또는 비밀번호를 확인해주세요.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      });
    }
  }
}
