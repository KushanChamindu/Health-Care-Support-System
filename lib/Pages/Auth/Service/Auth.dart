import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);

  Future<String> createUserWithEmailAndPassword(String email, String password);

  Future<String> currentUser();
  Future<void> singOut();
  Future setUserData(
      String uid, String Username, DateTime Birthday, String bloodGroup);
  Stream<QuerySnapshot> get user_data;
  Future updateAccountDetails(
      String uid, String Username, String bloodGroup, DateTime Birthday);
  Future setUserImageDetails(String uid, String ImageURL);
//  Future<void> updateWaterTimer(String uid, DateTime startTime,DateTime finishedTime,int goal);
//  Future<void> updateIsAlarm (String uid, bool isAlermOn);
//  // ignore: missing_return
//  Stream<QuerySnapshot> get waterNotificationData;
}

class Auth implements BaseAuth {
  final CollectionReference waterNotification =
  Firestore.instance.collection('waterNotification');
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (user == null) {
      return null;
    } else {
      return user.uid;
    }
  }

  Future<void> singOut() async {
    return FirebaseAuth.instance.signOut();
  }

  Future setUserData(
      String uid, String Username, DateTime Birthday, String bloodGroup) async {
    print("in updateUserData function ${uid}");
    await userData.document(uid).setData({
      'Username': Username,
      "Birthday": Birthday,
      'bloodGroup': bloodGroup,
      'CKD': null,
      'Diabetits': null,
      'Breast_canser': null,
      'HeartIssue': null,
      'ProfilePic': null,
    });
    await waterNotification.document(uid).setData({
      'firstday':getAboveSunday(),
      'monday':null,
      'tuesday':null,
      'wednesday':null,
      'thursday':null,
      'friday':null,
      'saturday':null,
      'sunday ':null,
    });
  }
//  static List days=['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
  DateTime getAboveSunday(){
    var today = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
//    var date= days[(today.weekday)];
    for(var i=0; i<7;i++){
      today=today.add(Duration(days: 1));
      if(today.weekday==7){
        return today;
      }
    }
    return null;
  }

  Future updateAccountDetails(
      String uid, String Username, String bloodGroup, DateTime Birthday) async {
    await Firestore.instance.collection('user_data').document(uid).updateData({
      'Username': Username,
      'bloodGroup': bloodGroup,
      'Birthday': Birthday,
    });
  }

  Future setUserImageDetails(String uid, String ImageURL) async {
    Firestore.instance
        .collection('user_data')
        .document(uid)
        .updateData({'ProfilePic': ImageURL});
  }

  final CollectionReference userData =
      Firestore.instance.collection('user_data');

  // ignore: non_constant_identifier_names
  Stream<QuerySnapshot> get user_data{
    return userData.snapshots();
  }

}
