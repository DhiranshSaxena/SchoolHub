import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:lpchub/BunkZone/bunkZone.dart';
import 'package:lpchub/Circulars/Circulars.dart';
import 'package:lpchub/Circulars/CircularsHome.dart';
import 'package:lpchub/Confessions/ConfessHome.dart';
import 'package:lpchub/DashBoard/Components/DailogBox1.dart';
import 'package:lpchub/DashBoard/Components/DailogBox2.dart';
import 'package:lpchub/DashBoard/Components/DialogBox3.dart';
import 'package:lpchub/ImportantInfo/FirstInfo.dart';
import 'package:lpchub/Interviews/interviews.dart';
import 'package:lpchub/Memes/memes.dart';
import 'package:lpchub/Mentor/ComingSoon.dart';
import 'package:lpchub/Mentor/chatHome.dart';
import 'package:lpchub/Mentor/chatpage.dart';
import 'package:lpchub/Mentor/home.dart';
import 'package:lpchub/Notes/classSelect.dart';
import 'package:lpchub/PreviousPapers/schools.dart';
import 'package:lpchub/SignUp/UI/CurveDashboard.dart';
import 'package:lpchub/UI/bottomSheets.dart';
import 'package:lpchub/about.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lpchub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';
import '../helper.dart';
import 'Components/DailogBox.dart';


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
      backgroundColor: Color(0xffdae7e8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        HelperFunc.saveUserloggedIn(false);
                        print("Logged out");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Splash()));
                      },
                      child: Container(
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.personBooth, color: Color(0xff4e5ed9)),
                        ),
                      ),
                    ),
                    Container(
                     child: Text(
                       "SCHOOLHUB",
                       style: TextStyle(
                             fontFamily: 'MeriendaOne',
                             color: Color(0xff4e5ed9),
                             fontSize: 27.0,
                             shadows: [
                               Shadow(
                                   blurRadius: 3.0,
                                   color: Colors.black,
                                   offset: Offset(1.0,1.0)
                               )
                             ]
                       ),
                     )),
                    // Container(
                    //   child: IconButton(
                    //     icon: Icon(FontAwesomeIcons.layerGroup, color: Color(0xff4e5ed9),),
                    //   ),
                    // )
                    MyBottomSheet()
                  ],
                ),
            SizedBox(
              height: 20.0,
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        // Navigator.push(context,
                        //     PageRouteBuilder(
                        //       transitionDuration: Duration(seconds: 2),
                        //         transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){
                        //
                        //         animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                        //
                        //         return ScaleTransition(scale: animation, child: child,alignment: Alignment.center,);
                        //         },
                        //         pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
                        //           return FirstInfo();
                        //         }
                        //     ));
                              showDialog(
                                context: context,
                                builder: (_) => FunkyOverlay(),
                              );
                      },
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3)
                              )
                            ],
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(color: Color(0xff4e5ed9), width: 2.0)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                    image: AssetImage('asset/images/info.png'),fit: BoxFit.cover
                            ),
                          ),
                      ),
                    ),
                      )
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (_) => FunkyOverlay2(),
                        );
                      },
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Color(0xff4e5ed9), width: 2.0)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                    image: AssetImage('asset/images/info1.png'),fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (_) => FunkyOverlay3(),
                        );
                      },
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Color(0xff4e5ed9), width: 2.0)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                    image: AssetImage('asset/images/info2.png'),fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (_) => FunkyOverlay4(),
                        );
                      },
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Color(0xff4e5ed9), width: 2.0)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                    image: AssetImage('asset/images/info3.png'),fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
            SizedBox(
              height: 30.0,
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            PageRouteBuilder(
                                transitionDuration: Duration(seconds: 2),
                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){

                                  animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);

                                  return ScaleTransition(scale: animation, child: child,alignment: Alignment.center,);
                                },
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
                                  return CircularsHome();
                                }
                            ));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: Lottie.asset('asset/dailynews.json')
                            ),
                          ],
                        ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFFB8d4ff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xeb000000),
                                    blurRadius: 6)
                              ]),
                          width: 340,
                          height: 190,
                        ),
                    ),
                  ],
                ),
            SizedBox(
              height: 20.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       child: Lottie.asset('asset/check.json'),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.0),
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //                 color: const Color(0xeb000000),
            //                 blurRadius: 6)
            //           ]),
            //       width: 160,
            //       height: 190,
            //     ),
            //     SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.0),
            //           color: Color(0xFFe1bfbf),
            //           boxShadow: [
            //             BoxShadow(
            //                 color: const Color(0xeb000000),
            //                 blurRadius: 6)
            //           ]),
            //       width: 160,
            //       height: 190,
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 2),
                            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){

                              animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);

                              return ScaleTransition(scale: animation, child: child,alignment: Alignment.center,);
                            },
                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
                              return Interviews();
                            }
                        ));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Lottie.asset('asset/mentor.json')
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xeb000000),
                              blurRadius: 6)
                        ]),
                    width: 340,
                    height: 190,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(colors: [
                      Color(0xff4e5ed9),
                      Color(0xff4e5ed9),
                    ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 3.0],
                        tileMode: TileMode.clamp
                    ),
                  ),
                  width: 350.0,
                  height: 1.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Container(
                  child: Text('SOON ON SCHOOLHUB',
                    style: TextStyle(
                      color: Color(0xff4e5ed9),
                      fontSize: 16,
                      fontFamily: 'MeriendaOne',
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.5,0.5)
                          )
                        ]
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset('asset/resource.json'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xeb000000),
                            blurRadius: 6)
                      ]),
                  width: 160,
                  height: 190,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Lottie.asset('asset/chatting.json'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xeb000000),
                            blurRadius: 6)
                      ]),
                  width: 160,
                  height: 190,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset('asset/bunkzone.json'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xeb000000),
                            blurRadius: 6)
                      ]),
                  width: 160,
                  height: 190,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Lottie.asset('asset/plane.json'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xeb000000),
                            blurRadius: 6)
                      ]),
                  width: 160,
                  height: 190,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
              ],
        )
      ),
    );
  }
}
