import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lpchub/Circulars/Circulars.dart';
import 'package:lpchub/Circulars/CircularsCMS.dart';
import 'package:lpchub/Circulars/CircularsLPC.dart';

class CircularsHome extends StatelessWidget{
  Widget build(BuildContext context){
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                      "CICULARS AND NEWS",
                      style: TextStyle(
                          fontFamily: 'MeriendaOne',
                          color: Color(0xff4e5ed9),
                          fontSize: 27.0,
                          shadows: [
                            Shadow(
                                blurRadius: 5.0,
                                color: Colors.black,
                                offset: Offset(1.0,1.0)
                            )
                          ]
                      ),
                    )),
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
                              return CommonCirculars();
                            }
                        ));
                  },
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/classroom.png'),fit: BoxFit.cover
                        ),
                      ),
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
                              return CMSCirculars();
                            }
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/cms.png'),
                        ),
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
                ),
                SizedBox(
                  width: 20,
                ),
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
                              return LPCCirculars();
                            }
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/lpc.png'),fit: BoxFit.cover
                        ),
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
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text("Delhi Public School, Jankipuram",
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontFamily: 'MeriendaOne',
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.5,0.5)
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text("St. Fidelis College, Vikas Nagar",
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontFamily: 'MeriendaOne',
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.5,0.5)
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text("Montfort Inter College, Mahanagar",
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontFamily: 'MeriendaOne',
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.5,0.5)
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text("City Montessori School, Mahanagar",
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontFamily: 'MeriendaOne',
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.5,0.5)
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text("St. Antony Inter College, Aliganj",
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontFamily: 'MeriendaOne',
                        shadows: [
                        Shadow(
                        blurRadius: 1.0,
                        color: Colors.black,
                        offset: Offset(0.5,0.5)
                    )
                  ]),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: Text("Mount Carmel College, Mahanagar",
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontFamily: 'MeriendaOne',
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(0.5,0.5)
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}