import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:lpchub/Circulars/pdf_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class LPCCirculars extends StatefulWidget
{
  @override
  _LPCCircularsState createState() => _LPCCircularsState();
}

class _LPCCircularsState extends State<LPCCirculars> {
  int i = 0;
  PdfPages pdf;

  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffdae7e8),
        // appBar: AppBar(
        //   elevation: 15.0,
        //   title: Text("Common Circulars", style: TextStyle(fontFamily: 'MeriendaOne',),),
        //   backgroundColor: Color(0xff104976),
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                  child: Text(
                    "LPC Circulars",
                    style: TextStyle(
                        fontFamily: 'MeriendaOne',
                        color: Color(0xff4e5ed9),
                        fontSize: 30.0,
                        shadows: [
                          Shadow(
                              blurRadius: 3.0,
                              color: Colors.black,
                              offset: Offset(1.0,1.0)
                          )
                        ]
                    ),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('LPC_Circulars').orderBy('timeStamp').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<GestureDetector> circularList = [];
                    snapshot.data.docs.forEach((document){
                      final date = document.data()['Date'];
                      final title = document.data()['Title'];
                      final school = document.data()['School'];
                      final link = document.data()['pdf_link'];
                      i++;
                      final circularLink =
                      GestureDetector(
                        child: CircularLink(
                          colorCode: i%4,
                          titleMessge: title,
                          date: date,
                          school: school,
                        ),
                        onTap: (){
                          print('pdf');
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: ((context){
                                    pdf = PdfPages(
                                      url: link,
                                    );
                                    return pdf;
                                  })
                              )
                          );
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
      ),
    );
  }
}
class CircularLink extends StatefulWidget {

  final String date,titleMessge,link,school;
  final int colorCode;

  const CircularLink({this.date,this.titleMessge,this.colorCode=4,this.link,this.school});


  @override
  _CircularLinkState createState() => _CircularLinkState();
}

class _CircularLinkState extends State<CircularLink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.school,
                    style: TextStyle(
                        color: Color(0xff4e5ed9),
                        fontSize: 20.0,
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.titleMessge,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffff9999),
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date Posted - " + widget.date,
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6ede64),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
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
}