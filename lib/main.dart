


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcaresupportsystem/Pages/Account.dart';
import 'package:healthcaresupportsystem/Pages/Auth/Auth.dart';
import 'package:healthcaresupportsystem/Pages/CKD_pages/CKD_precautions.dart';
import 'package:healthcaresupportsystem/Pages/CKD_pages/CKD_symptom.dart';
import 'package:healthcaresupportsystem/Pages/CKD_pages/CKD_webview.dart';
import 'package:healthcaresupportsystem/Pages/Home.dart';
import 'Pages/Auth/LogIn.dart';
import 'Pages/Loading.dart';
import 'Pages/CKD_pages/CKD_message.dart';
import 'Pages/CKD_pages/CKD_discription.dart';

void main() => runApp(MaterialApp(
  routes: {
//    '/loading':(context) =>Loading(auth: Auth()),
    '/':(context)=> LogIn(auth: Auth(),),
    '/account':(context)=> Account(),
    '/home': (context) => Home(),
    '/CKD_message' :(context)=> CKD_message(),
    '/CKD_discription':(context) =>CKD_discription(),
    '/CKD_webview':(context) => CKD_webview(),
    '/CKD_symptom':(context)=> CKD_symptoms(),
    '/CKD_precaution':(context)=> CKD_precautions()
  },
));



