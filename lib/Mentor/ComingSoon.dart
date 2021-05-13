import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget{
  Widget build(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Color(0xFF4563DB),
      title: Text(
        "Coming Shortly!",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "We are always there for you to bring all the features for your help in Daily School life. Therefore, Coming Shortly, a ChatBox filled with plenty of Students to Chat and ask queries.",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        RaisedButton(
          color: Color(0xFF5036D5),
          child: Text(
            "Come Back Later",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ],
    );
  }
}