import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/BunkZone/image.dart';
import 'package:lpchub/BunkZone/name.dart';
import 'package:lpchub/Interviews/description.dart';
import 'package:lpchub/Interviews/image.dart';
import 'package:lpchub/Interviews/interview_details.dart';
import 'package:lpchub/Interviews/name_job.dart';

import 'bunk_details.dart';
import 'description.dart';

class BunkZonePage extends StatefulWidget{

  final String docName;
  
  BunkZonePage({Key key,this.docName}): super(key: key);

  @override
  _BunkZonePageState createState() => new _BunkZonePageState(docName);
}

class _BunkZonePageState extends State<BunkZonePage>{

  String name,status,description1,description2,description3,date,img_link;
  final String docName;
  _BunkZonePageState(this.docName);

  BunkZoneDetails details = BunkZoneDetails();

  void getPersonDetails()async{
    var sn = await FirebaseFirestore.instance.collection('BunkZone').doc(docName).get().then((value) {
      setState(() {
        details.name=value.data()["Name"];
        details.status=value.data()["Location"];
        details.description1=value.data()["Description1"];
        details.description2=value.data()["Description2"];
        details.description3=value.data()["Description3"];
        details.date=value.data()["Date"];
        details.imageLink=value.data()["img_link"];
      });
      print(details.imageLink);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPersonDetails();
  }

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff104976),
        title: Text(
          docName,
          style: TextStyle(
            fontFamily: 'MeriendaOne',
            fontSize: 20.0,
          ),
        ),
      ),
      backgroundColor: Color(0xffcee0e2),
      body: SingleChildScrollView(
        child: Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width-30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff104976),
                          width: 3.0
                      )
                  ),
                  child: BunkImage(
                    imageLink: details.imageLink,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff104976),
                          width: 3.0
                      )
                  ),
                  child: NameAndLocation(Status: details.status,Name: details.name,),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff104976),
                        width: 3.0,
                      )
                  ),
                  child: BunkDescription(description1: details.description1,description2: details.description2,description3: details.description3,),
                ),
                SizedBox( height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}