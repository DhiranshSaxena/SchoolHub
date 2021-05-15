import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:lpchub/landing.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void completed(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Landing()));
  }

  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  @override
  Widget build(BuildContext context) {
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