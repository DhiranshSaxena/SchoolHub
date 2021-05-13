import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/Login.dart';
import 'package:lpchub/SignUp/Utils/auth.dart';
import 'package:lpchub/helper.dart';

import 'Utils/usermanagement.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSuccess;
  String _name;
  String _userEmail;
  String _password;
  String error = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff104976),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Sign-Up to School-Hub",
                    style: TextStyle(
                        color: Color(0xffE69494),
                        fontFamily: 'MeriendaOne',
                        fontSize: 26),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: 360,
                child: Center(
                  child: Text(
                    "WELCOME TO THE FAMILY OF SCHOOL-HUB. HERE AT SCHOOL-HUB YOU WILL BE GETTING ALL THE NECESSARY ITEMS REQUIRED TO GET HIGHER GRADES",
                    style: TextStyle(
                      color: Color(0xffE69494),
                      fontFamily: 'Sora',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: 15.0,
                color: Color(0xff3d8ecd),
                child: Container(
                  width: 390,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 350,
                          child: TextFormField(
                            onChanged: (value) {
                              _name = value;
                            },
                            controller: _displayName,
                            decoration:
                                const InputDecoration(labelText: 'Full Name'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            onChanged: (value) {
                              _userEmail = value;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            onChanged: (value) {
                              _password = value;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 350,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Your Password',
                              // border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        _userEmail, _password);
                    if (result == null) {
                      setState(() {
                        error = 'Something Went Wrong';
                      });
                    } else {
                      
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                    }
                  }
                },
                elevation: 15.0,
                color: Color(0xff3d8ecd),
                child: Text("CREATE ACCOUNT"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Input(),
                    ));
                  },
                  child: Text(
                    "Already a User? Login Now!",
                    style: TextStyle(
                        color: Color(0xffE69494),
                        fontFamily: 'Caveat',
                        fontSize: 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
