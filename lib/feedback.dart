import 'package:flutter/material.dart';
import 'package:lpchub/SignUp/Login.dart';
import 'package:lpchub/SignUp/Utils/crud.dart';

class feedback extends StatelessWidget{
  String suggest = "", _feedback = 'Feedback';

  List feedbackData = List();
  crudMethods crudObj = new crudMethods();

Widget build(BuildContext context)
{
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff104976),
      elevation: 10.0,
      title: Text(
        "Feedback",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'MeriendaOne'
        ),
      ),
    ),
    backgroundColor: Color(0xffcee0e2),
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Any Suggestions?",
              style: TextStyle(
                fontFamily: 'Sora',
                color: Color(0xffe6005c),
                fontSize: 24.0
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width-30,
            height: 200,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              onChanged: (value)
              {
                suggest = value;
              },
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff104976),
                width: 3.0
              )
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: (){
              Map<String,dynamic> suggestions = {'Feedback': suggest};
              crudObj.addData(suggestions).then((result){
                dailogTrigger(context);
              }).catchError((e){
                print(e);
              });
            },
            color: Color(0xff104976),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: 100,
              child: Center(
                child: Text(
                    "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'MeriendaOne',
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

  Future <bool> dailogTrigger(BuildContext context)async{
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Color(0xff104976),
        title: Text("Your Feedback has been Recorded!",
          style: TextStyle(
            fontFamily: 'Sora',
            fontSize: 18.0,
            color: Color(0xffe6005c)
          ),
        ),
        content: Text(
          "Thank You for this lovely Feedback, Our Support team will be looking into the matter and wil be contacting you soon.",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Robot',
              fontSize: 14),),
        actions: <Widget>[
          FlatButton(
            child: Text(
                "Close",
            style: TextStyle(
              fontFamily: 'Sora',
            ),),
            textColor: Color(0xffcee0e2),
            color: Color(0xffe6005c),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  );
  }
}