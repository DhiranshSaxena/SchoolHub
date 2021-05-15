import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        // routes: {
        //   '/wrapper': (_)=> Wrapper(),
        // },
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Splash()
        ),
      )
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class Splash extends StatefulWidget{
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash>{
  void completed(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Wrapper()));
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfffef5f5),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Lottie.asset('asset/schoolhub.json'),
        ),
      ),
    );
  }

}
