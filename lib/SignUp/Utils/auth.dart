import 'package:firebase_auth/firebase_auth.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/Login.dart';
import 'package:lpchub/SignUp/Utils/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on Firebase User
  MyUser _userFromFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid):null;
  }

  //signIn as Anonymous
  Future signInAnon() async
  {
    try{
     UserCredential userCredential = await _auth.signInAnonymously();
     User user = userCredential.user;
     return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signIn with Email and Password
  Future loginWithEmailAndPassword(String Email, String Password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: Email, password: Password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //Register with Email and Password
 Future registerWithEmailAndPassword(String Email, String Password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
 }

 //FB LOGIN Trial
  Future checkLoggedIn(BuildContext context){
    _auth.authStateChanges().listen((User user) {
      if(user == null)
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Input(),));
      }
    });
  }

  //Sign Out

}
