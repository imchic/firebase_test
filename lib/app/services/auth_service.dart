import 'package:demo/app/constants/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data_service.dart';
import 'helper.dart';

class AuthService {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {

      // mail 확인안하고 로그인
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      User user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password)
      ).user!;

      if (user != null) {
         return true;
      }

    } on FirebaseAuthException catch (e) {
      Global.log.wtf(e.message.toString());
      return e.message;
    }
  }

  // 회원가입
  Future signUp(String employeeNum, String email, String password) async {
    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        await DataService(uid: user.uid).updateUserData(employeeNum, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      Global.log.wtf(e.toString());
      return false;
    }
  }

  // 로그아웃
  Future signOut() async {
    try {
      await Helper.saveUserLoggedInstatus(false);
      await Helper.saveUserEmail("");
      await Helper.saveUserEmployee("");
      await firebaseAuth.signOut();
    } catch (e) {
      Global.log.wtf(e.toString());
      return null;
    }
  }

}
