import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/SignUp.dart';
import 'package:lpchub/SignUp/UI/Curve.dart';
import 'package:lpchub/SignUp/UI/CurveDashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lpchub/SignUp/Utils/auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Input extends StatefulWidget
{
  @override
  _InputState createState() => new _InputState();
}

class _InputState extends State<Input>
{

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
          backgroundColor: Color(0xff3d8ecd),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                  children: [
                      Container(
                        width: 700,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Color(0xff104976)
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                                "SIGN UP - E-MAIL VERIFICATION",
                              style: TextStyle(
                                color: Color(0xffE69494),
                                fontFamily: 'MeriendaOne',
                                fontSize: 21
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                              height: 190,
                              width: 190,
                              image: AssetImage('asset/images/img1.png'),
                            )
                          ],
                        ),
                      ),

                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        width: 300,
                            child: Column(
                              children: [
                                TextFormField(

                                  onChanged: (value){
                                    setState(() {
                                      _email = value;
                                    });
                                  },
                                  obscureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                    ),
                                    labelText: 'ENTER YOUR EMAIL',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(

                                      onChanged: (value){
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
                      height: 15,
                    ),
                    RaisedButton(
                      color: Color(0xff104976),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Container(
                        width: 120,
                        child: Center(
                          child: Text(
                              "LOGIN",
                            style: TextStyle(
                              color: Color(0xff3d8ecd),
                              fontFamily: 'MeriendaOne',
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      onPressed: ()async{
                        if(_formKey.currentState.validate()){
                          print(_email);
                          print(_password);
                          dynamic result = await _auth.loginWithEmailAndPassword(_email, _password);
                          if(result == null){
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                    backgroundColor: Color(0xFF4563DB),
                                    title: Text("SOMETHING WENT WRONG!", style: TextStyle(color: Colors.white),),
                                    content: Text("Either you have entered the wrong E-Mail or Password or the account with this E-Mail do not exist", style: TextStyle(color: Colors.white),),

                                    actions: <Widget>[
                                      RaisedButton(
                                        color: Color(0xFF5036D5),
                                        child: Text("TRY AGAIN", style: TextStyle(color: Colors.white),),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),

                                      RaisedButton(
                                        color: Color(0xFF3594DD),
                                        child: Text("EXIT", style: TextStyle(color: Colors.white),),
                                        onPressed: (){
                                          SystemNavigator.pop();
                                        },
                                      )

                                    ],
                                  );
                                },);
                            });
                          }else{
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
                          }
                        }
                        },
                    ),
                    Container(
                      child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp(),));
                          },
                          child: Text(
                            "New to SchoolHub? Create an Account!",
                            style: TextStyle(
                                color: Color(0xff104976),
                                fontFamily: 'Caveat',
                                fontSize: 20
                            ),
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
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.white10,
                                  Colors.white,
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 1.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: 100.0,
                          height: 1.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text(
                            "Or",
                            style: TextStyle(
                                color: Color(0xff104976),
                                fontSize: 16.0,
                                fontFamily: 'Sora'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white10,
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 1.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
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
                            onTap: ()async{

                              googleAuth.signIn().then((result){
                                result.authentication.then((googleKey){
                                  FirebaseAuth.instance.signInWithCredential(
                                      GoogleAuthProvider.credential(
                                          idToken: googleKey.idToken,
                                          accessToken: googleKey.accessToken
                                      )
                                  ).then((signedInUser){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
                                  }).catchError((e){print(e);});
                                }).catchError((e){print(e);});
                              }).catchError((e){print(e);});



                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Icon(FontAwesomeIcons.google),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE69494)
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              dynamic result = await _auth.signInAnon();
                              if(result == null)
                              {
                                print('Error');
                              }else
                              {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
                              }
                            },

                            child: Container(
                              width: 50,
                              height: 50,
                              child: Icon(FontAwesomeIcons.userSecret, color: Colors.white,),
                              decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                color: Colors.black54
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                    backgroundColor: Color(0xFF4563DB),
                                    title: Text("SOMETHING WENT WRONG!", style: TextStyle(color: Colors.white),),
                                    content: Text("Sorry for the inconvenience  caused! Our team is looking into the matter", style: TextStyle(color: Colors.white),),

                                    actions: <Widget>[
                                      RaisedButton(
                                        color: Color(0xFF5036D5),
                                        child: Text("TRY AGAIN", style: TextStyle(color: Colors.white),),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),

                                      RaisedButton(
                                        color: Color(0xFF3594DD),
                                        child: Text("EXIT", style: TextStyle(color: Colors.white),),
                                        onPressed: (){
                                          SystemNavigator.pop();
                                        },
                                      )

                                    ],
                                  );
                                },);
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
                              child: Icon(FontAwesomeIcons.facebookF, color: Colors.blueAccent,),
                              decoration: BoxDecoration(

                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
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

