import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final String? uid;

  DataService({this.uid});

  // reference to collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users'); // 유저 정보 저장
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups'); // 그룹 정보 저장

  // Firebase Storage 사용자 정보 저장
  Future updateUserData(String employee, String email) async {
    return await userCollection.doc(uid).set({
      'employee': employee,
      'email': email,
      'groups': [],
      'profiePic': '',
      'uid': uid,
    });
  }

  Future gettingUserData(String employee) async {
    QuerySnapshot querySnapshot =
        await userCollection.where('employee', isEqualTo: employee).get();
    return querySnapshot;
  }
}
