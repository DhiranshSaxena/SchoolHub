import 'package:flutter/material.dart';
import 'package:lpchub/Circulars/Circulars.dart';
import 'package:lpchub/Interviews/interviews.dart';
import 'package:lpchub/Memes/memes.dart';
import 'package:lpchub/Mentor/chatpage.dart';
import 'package:lpchub/Mentor/home.dart';
import 'package:lpchub/Notes/classSelect.dart';
import 'package:lpchub/PreviousPapers/schools.dart';
import 'package:lpchub/SignUp/UI/CurveDashboard.dart';
import 'package:lpchub/about.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../helper.dart';
import '../helper.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    HelperFunc.saveUserloggedIn(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper2(),
                child: Container(
                  width: 720,
                  height: 300,
                  decoration:
                      BoxDecoration(color: Color(0xff104976), boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          "DASHBOARD",
                          style: TextStyle(
                              fontFamily: 'MeriendaOne',
                              color: Color(0xffE69494),
                              fontSize: 23),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        child: Image(
                          image: AssetImage('asset/images/img2.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Circulars(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff104976),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xeb000000),
                                        blurRadius: 6)
                                  ]),
                              width: 140,
                              height: 120,
                              child: Center(
                                child: Text(
                                  "CIRCULAR",
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontSize: 20,
                                      fontFamily: 'MeriendaOne'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Schools(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff104976),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xeb000000),
                                        blurRadius: 6)
                                  ]),
                              width: 140,
                              height: 120,
                              child: Center(
                                child: Text(
                                  "PREVIOUS YEARS PAPERS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontSize: 20,
                                      fontFamily: 'MeriendaOne'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Interviews(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff104976),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xeb000000),
                                        blurRadius: 6)
                                  ]),
                              width: 140,
                              height: 120,
                              child: Center(
                                child: Text(
                                  "WEEKLY INTERVIEWS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontSize: 20,
                                      fontFamily: 'MeriendaOne'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Memes(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff104976),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xeb000000),
                                        blurRadius: 6)
                                  ]),
                              width: 140,
                              height: 120,
                              child: Center(
                                child: Text(
                                  "MEMES",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontSize: 20,
                                      fontFamily: 'MeriendaOne'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff104976),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xeb000000),
                                        blurRadius: 6)
                                  ]),
                              width: 140,
                              height: 120,
                              child: Center(
                                child: Text(
                                  "DISCUSSION BOX",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontSize: 20,
                                      fontFamily: 'MeriendaOne'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => About(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff104976),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xeb000000),
                                        blurRadius: 6)
                                  ]),
                              width: 140,
                              height: 120,
                              child: Center(
                                child: Text(
                                  "SETTINGS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontSize: 20,
                                      fontFamily: 'MeriendaOne'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
