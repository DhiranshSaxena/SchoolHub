import 'package:flutter/material.dart';
import 'package:lpchub/SignUp/Utils/loading.dart';
import 'package:lpchub/landing.dart';
import 'package:lpchub/helper.dart';
import 'package:lpchub/DashBoard/dashboard.dart';

import '../../DashBoard/dashboard.dart';
import '../../landing.dart';
import '../../landing.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isLogged = false;

  ready() async {
    await HelperFunc.getUserloggedIn().then((value) {
      setState(() {
        isLogged = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    ready();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLogged == null ? Loading() : isLogged ? Dashboard() : Landing();
  }
}
