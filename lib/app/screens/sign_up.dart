import 'package:demo/app/screens/login_page.dart';
import 'package:demo/app/services/auth_service.dart';
import 'package:demo/app/services/helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isVisible = false;
  bool _isLoading = false;

  String employee = "";
  String email = "";
  String password = "";

  final app = Get.find<AppController>();

  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 80),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            '회원가입',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text('사원번호 및 이메일을 입력해주세요.',
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
                          const SizedBox(height: 20),
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
                            decoration: InputDecoration(
                              hintText: '이메일',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              suffixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            validator: (value) {
                              // email regex
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
                              if (value!.isEmpty) {
                                return '이메일을 입력해주세요.';
                              } else if (!emailRegex.hasMatch(value)) {
                                return '이메일 형식이 올바르지 않습니다.';
                              } else {
                                return null;
                              }
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
                              password = value;
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
                                register();
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
                                '회원가입',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Text.rich(
                            // 이미 회원 가입이 되어있는 경우
                            TextSpan(
                              text: '이미 회원이신가요? ',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '로그인',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => LoginPage());
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth.signUp(employee, email, password).then((value) async {
        if (value) {
          await Helper.saveUserLoggedInstatus(true);
          await Helper.saveUserEmployee(employee);
          await Helper.saveUserEmail(email);
          Get.offAll(() => HomePage());
        } else {
          setState(() {
            _isLoading = false;
          });
          Get.snackbar('회원가입 실패', '이미 가입된 이메일입니다.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: const EdgeInsets.all(20),
              borderRadius: 10,
              duration: const Duration(seconds: 3),
              icon: const Icon(Icons.error_outline, color: Colors.white));
        }
      });
    }
  }
}
