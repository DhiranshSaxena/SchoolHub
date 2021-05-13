import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:lottie/lottie.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/SignUp.dart';
import 'package:lpchub/SignUp/UI/Curve.dart';
import 'package:lpchub/SignUp/UI/CurveDashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lpchub/SignUp/Utils/auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lpchub/helper.dart';

import '../DashBoard/dashboard.dart';
import 'Utils/wrapper.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => new _InputState();
}

class _InputState extends State<Input> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  String error = "";

  bool codeSent = false;

  final AuthService _auth = AuthService();
  FacebookLogin fblogin = new FacebookLogin();

  GoogleSignIn googleAuth = new GoogleSignIn();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffef5f5),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 700,
                height: 350,
                decoration: BoxDecoration(color: Color(0xffE69494)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "SIGN UP - E-MAIL VERIFICATION",
                      style: TextStyle(
                          color: Color(0xfffef5f5),
                          fontFamily: 'MeriendaOne',
                          fontSize: 21,
                        shadows: [
                          Shadow(
                              blurRadius: 5.0,
                              color: Colors.black,
                              offset: Offset(1.0,1.0)
                          )
                        ]
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Image(
                    //   height: 190,
                    //   width: 190,
                    //   image: AssetImage('asset/human.json'),
                    // )
                    Container(
                      width: 200,
                      height: 200,
                      child: Lottie.asset('asset/human.json'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ENTER YOUR EMAIL',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ENTER A PASSWORD',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 200,
                child: RaisedButton(
                  color: Color(0xfffef5f5),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffff9999),width: 2.0),
                    borderRadius: BorderRadius.circular(1000.0),),
                  child: Container(
                    width: 120,
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Color(0xffE69494),
                            fontFamily: 'MeriendaOne',
                            fontSize: 20),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print(_email);
                      print(_password);
                      dynamic result = await _auth.loginWithEmailAndPassword(
                          _email, _password);
                      if (result == null) {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Color(0xFFe1bfbf),
                                title: Text(
                                  "SOMETHING WENT WRONG!",
                                  style: TextStyle(
                                      color: Color(0xffff9999),
                                      shadows: [
                                        Shadow(
                                            blurRadius: 5.0,
                                            color: Colors.black,
                                            offset: Offset(0.5,0.5)
                                        )
                                      ]
                                  ),
                                ),
                                content: Text(
                                  "Either you have entered the wrong E-Mail or Password or the account with this E-Mail do not exist",
                                  style: TextStyle(
                                      color: Color(0xffff9999),
                                      shadows: [
                                          Shadow(
                                              blurRadius: 1.0,
                                              color: Colors.black,
                                              offset: Offset(0.1,0.1)
                                  )]
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    color: Color(0xFFe1bfbf),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Color(0xffff9999),width: 2.0),
                                     ),
                                    child: Text(
                                      "TRY AGAIN",
                                      style: TextStyle(
                                          color: Color(0xffff9999),
                                          shadows: [
                                              Shadow(
                                                 blurRadius: 1.0,
                                                 color: Colors.black,
                                                 offset: Offset(0.1,0.1)
                                        )]
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  RaisedButton(
                                    color: Color(0xffff9999),
                                    child: Text(
                                      "EXIT",
                                      style: TextStyle(
                                          color: Color(0xFFe1bfbf),
                                          shadows: [
                                            Shadow(
                                                blurRadius: 1.0,
                                                color: Colors.black,
                                                offset: Offset(0.1,0.1)
                                            )]
                                      ),
                                    ),
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        });
                      } else {

                        HelperFunc.saveUserloggedIn(true);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Dashboard(),));
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => SignUp(),
                      // ));
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              elevation: 12.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Color(0xFFe1bfbf),
                              title: Text(
                                "Coming Shortly!",
                                style: TextStyle(
                                    color: Color(0xffE69494),
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                          blurRadius: 5.0,
                                          color: Colors.black,
                                          offset: Offset(0.5,0.5)
                                      )]
                                ),
                              ),
                              content: Text(
                                "This is the Early Access of SchoolHub App and is only available for pre-registered users or SchoolHub members.\n\nAlthough, Our App is coming shortly but If you want to get access of early access of this app contact our technical Support on WhatsApp at +91 99199 21160.",
                                style: TextStyle(
                                    color: Color(0xffE69494),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              actions: <Widget>[
                                RaisedButton(
                                  color: Color(0xFFe1bfbf),
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xffff9999),width: 2.0),
                                  ),
                                  child: Text(
                                    "Come Back Later",
                                    style: TextStyle(
                                        color: Color(0xffE69494),
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 5.0,
                                              color: Colors.black,
                                              offset: Offset(0.5,0.5)
                                          )]
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            );
                          }

                      );
                    },
                    child: Text(
                      "New to SchoolHub? Create an Account!",
                      style: TextStyle(
                          color: Color(0xffE69494),
                          fontFamily: 'MeriendaOne',
                          fontSize: 16,
                          shadows: [
                             Shadow(
                             blurRadius: 2.0,
                             color: Colors.black,
                             offset: Offset(0.2,0.2)
                      )
                      ])
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(colors: [
                        Color(0xffE69494),
                        Colors.white,
                      ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp
                         ),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: Color(0xffE69494),
                          fontSize: 16.0,
                          fontFamily: 'Sora',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(colors: [
                        Colors.white,
                        Color(0xffE69494),
                      ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp
                          ),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                elevation: 12.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Color(0xFFe1bfbf),
                                title: Text(
                                  "Coming Shortly!",
                                  style: TextStyle(
                                    color: Color(0xffE69494),
                                    fontWeight: FontWeight.bold,
                                      shadows: [
                                         Shadow(
                                         blurRadius: 5.0,
                                         color: Colors.black,
                                         offset: Offset(0.5,0.5)
                                  )]
                                  ),
                                ),
                                content: Text(
                                  "We are always there for you to bring all the features for your help in Daily School life. Therefore, Coming Shortly, a ChatBox filled with plenty of Students to Chat and ask queries.",
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                    fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 1.0,
                                            color: Colors.black,
                                            offset: Offset(0.1,0.1)
                                        )]
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    color: Color(0xFFe1bfbf),
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xffff9999),width: 2.0),
                                  ),
                                    child: Text(
                                      "Come Back Later",
                                      style: TextStyle(
                                          color: Color(0xffE69494),
                                        fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 5.0,
                                                color: Colors.black,
                                                offset: Offset(0.5,0.5)
                                            )]
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                ],
                              );
                            }

                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(FontAwesomeIcons.google),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffE69494)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                elevation: 12.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Color(0xFFe1bfbf),
                                title: Text(
                                  "Coming Shortly!",
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 5.0,
                                            color: Colors.black,
                                            offset: Offset(0.5,0.5)
                                        )]
                                  ),
                                ),
                                content: Text(
                                  "We are always there for you to bring all the features for your help in Daily School life. Therefore, Coming Shortly, a ChatBox filled with plenty of Students to Chat and ask queries.",
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 1.0,
                                            color: Colors.black,
                                            offset: Offset(0.1,0.1)
                                        )]
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    color: Color(0xFFe1bfbf),
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Color(0xffff9999),width: 2.0),
                                    ),
                                    child: Text(
                                      "Come Back Later",
                                      style: TextStyle(
                                          color: Color(0xffE69494),
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 5.0,
                                                color: Colors.black,
                                                offset: Offset(0.5,0.5)
                                            )]
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                ],
                              );
                            }

                        );
                      },
                      /*() async {
                        dynamic result = await _auth.signInAnon();
                        if (result == null) {
                          print('Error');
                        } else {
                          
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ));
                        }
                      },*/
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          FontAwesomeIcons.userSecret,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black54),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                elevation: 12.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Color(0xFFe1bfbf),
                                title: Text(
                                  "Coming Shortly!",
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 5.0,
                                            color: Colors.black,
                                            offset: Offset(0.5,0.5)
                                        )]
                                  ),
                                ),
                                content: Text(
                                  "We are always there for you to bring all the features for your help in Daily School life. Therefore, Coming Shortly, a ChatBox filled with plenty of Students to Chat and ask queries.",
                                  style: TextStyle(
                                      color: Color(0xffE69494),
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 1.0,
                                            color: Colors.black,
                                            offset: Offset(0.1,0.1)
                                        )]
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    color: Color(0xFFe1bfbf),
                                    elevation: 10.0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Color(0xffff9999),width: 2.0),
                                    ),
                                    child: Text(
                                      "Come Back Later",
                                      style: TextStyle(
                                          color: Color(0xffE69494),
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 5.0,
                                                color: Colors.black,
                                                offset: Offset(0.5,0.5)
                                            )]
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                ],
                              );
                            }

                        );
                        /*fblogin.logIn(['email']).then((user){
                                switch(user.status){
                                  case FacebookLoginStatus.loggedIn:
                                    FirebaseAuth.instance.signInWithCredential(
                                        FacebookAuthProvider.credential(
                                            user.accessToken.token
                                        )
                                    ).then((signedInUser){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
                                    });
                                    break;

                                  case FacebookLoginStatus.error:
                                    final snackbar = SnackBar(
                                      content: Text('Something Went Wrong! Try Another Method'),
                                      action: SnackBarAction(
                                        label: 'Try Again',
                                        onPressed: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Input(),));
                                        },
                                      ),
                                    );
                                    break;

                                  case FacebookLoginStatus.cancelledByUser:
                                    final snackbar = SnackBar(
                                      content: Text('Something Went Wrong! Try Another Method'),
                                      action: SnackBarAction(
                                        label: 'Try Again',
                                        onPressed: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Input(),));
                                        },
                                      ),
                                    );
                                    break;
                                }
                              }).catchError((e){
                                SnackBar(
                                  content: Text('Something Went Wrong! Try Another Method'),
                                  action: SnackBarAction(
                                    label: 'Try Again',
                                    onPressed: (){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Input(),));
                                    },
                                  ),
                                );
                              });*/
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.blueAccent,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
