import 'package:flutter/material.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/Utils/crud.dart';

class feedback extends StatelessWidget{
  String suggest = "", _feedback = 'Feedback';

  List feedbackData = List();
  crudMethods crudObj = new crudMethods();

Widget build(BuildContext context)
{
  return Scaffold(
    backgroundColor: Color(0xffdae7e8),
    body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Center(
                child: Text(
                  "Let\'s Make it Better",
                  style: TextStyle(
                      fontFamily: 'MeriendaOne',
                      color: Color(0xff4e5ed9),
                      fontSize: 27.0,
                      shadows: [
                        Shadow(
                            blurRadius: 1.5,
                            color: Colors.black,
                            offset: Offset(1.0,1.0)
                        )
                      ]
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 180.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8.0),
              child: Card(
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4e5ed9))
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "What do you think we can do to improve your SchoolHub experience?",
                              style: TextStyle(
                                  color: Color(0xff4e5ed9),
                                  fontSize: 16,
                                  fontFamily: 'MeriendaOne',
                                  shadows: [
                                    Shadow(
                                        blurRadius: 1.0,
                                        color: Colors.black,
                                        offset: Offset(0.5,0.5)
                                    ),
                                  ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Feedback'
                              ),
                              onChanged: (value)
                              {
                                suggest = value;
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff4e5ed9),
                              width: 1.0
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        onPressed: (){
                          Map<String,dynamic> suggestions = {'Feedback': suggest};
                          crudObj.addData(suggestions).then((result) async{
                            // showDialog(
                          //       context: context,
                          //       builder: (BuildContext context){
                          //         return AlertDialog(
                          //           backgroundColor: Color(0xff4e5ed9),
                          //           title: Text("Your Feedback has been Recorded!",
                          //             style: TextStyle(
                          //                 fontFamily: 'Sora',
                          //                 fontSize: 18.0,
                          //                 color: Color(0xffe6005c)
                          //             ),
                          //           ),
                          //           content: Text(
                          //             "Thank You for this lovely Feedback, Our Support team will be looking into the matter and wil be contacting you soon.",
                          //             style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontFamily: 'Robot',
                          //                 fontSize: 14),),
                          //           actions: <Widget>[
                          //             FlatButton(
                          //               child: Text(
                          //                 "Close",
                          //                 style: TextStyle(
                          //                   fontFamily: 'Sora',
                          //                 ),),
                          //               textColor: Color(0xffcee0e2),
                          //               color: Color(0xffe6005c),
                          //               onPressed: (){
                          //                 Navigator.of(context).pop();
                          //               },
                          //             )
                          //           ],
                          //         );
                          //       }
                          //   );
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
                          }).catchError((e){
                            print(e);
                          });

                        },
                        color: Color(0xff4e5ed9),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
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
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
        backgroundColor: Color(0xff4e5ed9),
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