import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lpchub/SignUp/Utils/crud.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/Circulars/pdf_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class Confession extends StatefulWidget
{
  @override
  _ConfessionState createState() => _ConfessionState();
}

class _ConfessionState extends State<Confession> {
  int i = 0;
  String confes="";
  crudMethods crudObj = new crudMethods();

  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffcee0e2),
        appBar: AppBar(
          elevation: 15.0,
          title: Text("Confessions", style: TextStyle(fontFamily: 'MeriendaOne',),),
          backgroundColor: Color(0xff104976),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Confession').orderBy('timeStamp', descending: true).snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<GestureDetector> circularList = [];
                    snapshot.data.docs.forEach((document){
                      final title = document.data()['Confession'];
                      i++;
                      final circularLink =
                      GestureDetector(
                        child: CircularLink(
                          colorCode: i%4,
                          titleMessge: title,
                        ),
                        onTap: (){
                        },
                      );
                      circularList.add(circularLink);
                    });
                    return ListView(
                      children: circularList,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Color(0xffE69494),
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      elevation: 12.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Color(0xFF4563DB),
                      title: Text(
                        "Add Your Confession!",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Container(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Your Confession',
                          ),
                          onChanged: (value){
                            confes = value;
                          },
                        ),
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          color: Color(0xFF5036D5),
                          child: Text(
                            "Add Confession",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Map<String,dynamic> suggestions = {'Confession': confes, 'timeStamp': DateTime.now().millisecondsSinceEpoch.toString(),};
                            crudObj.addDataConf(suggestions).then((result){
                              Navigator.of(context).pop();
                            }).catchError((e){
                              print(e);
                            });
                          },
                        ),

                      ],
                    );
                  }

              );
            },
            child: Icon(
                FontAwesomeIcons.plus,
              color: Color(0xff104976),
              size: 30,
            ),
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


class CircularLink extends StatefulWidget {

  final String titleMessge;
  final int colorCode;

  const CircularLink({this.titleMessge,this.colorCode=4});


  @override
  _CircularLinkState createState() => _CircularLinkState();
}

class _CircularLinkState extends State<CircularLink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xff104976)
            ),
            width: MediaQuery.of(context).size.width - 20,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.titleMessge,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
      /*child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(widget.date,
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                color: myColors[widget.colorCode],
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '''${widget.titleMessge}''',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),*/
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