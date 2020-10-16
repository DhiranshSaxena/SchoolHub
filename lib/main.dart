import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/Login.dart';
import 'package:lpchub/SignUp/Utils/auth.dart';
import 'package:lpchub/SignUp/Utils/wrapper.dart';
import 'package:lpchub/landing.dart';
import 'package:provider/provider.dart';

import 'SignUp/Utils/user.dart';

void main() async {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SchoolHub',
        routes: {
          '/wrapper': (_)=> Wrapper(),
        },
        home: Scaffold(
          backgroundColor: Color(0xff104976),
          body: Wrapper()
        ),
      )
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

