import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/Interviews/description.dart';
import 'package:lpchub/Interviews/image.dart';
import 'package:lpchub/Interviews/interview_details.dart';
import 'package:lpchub/Interviews/name_job.dart';

class InterviewPage extends StatefulWidget{

  final String docName;
  InterviewPage({Key key,this.docName}): super(key: key);

  @override
  _InterviewPageState createState() => new _InterviewPageState(docName);
}

class _InterviewPageState extends State<InterviewPage>{

  String name,status,description1,description2,description3,date,img_link, secondImageLink;
  final String docName;
  _InterviewPageState(this.docName);

  PersonalDetails details =PersonalDetails();

  void getPersonDetails()async{
    var sn = await FirebaseFirestore.instance.collection('Weekly_Interviews').doc(docName).get().then((value) {
      setState(() {
        details.name=value.data()["Name"];
        details.status=value.data()["Status"];
        details.description1=value.data()["Description1"];
        details.description2=value.data()["Description2"];
        details.description3=value.data()["Description3"];
        details.date=value.data()["Date"];
        details.imageLink=value.data()["img_link"];
        details.secondImageLink=value.data()["SecondImageLink"];
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
       backgroundColor: Color(0xffcee0e2),
       body: SingleChildScrollView(
         child: Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 SizedBox(
                   height: 20,
                 ),
                 Container(
                     child: Text(
                       docName,
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
                 Container(
                     child: Text(
                       details.status,
                       style: TextStyle(
                           fontFamily: 'MeriendaOne',
                           color: Color(0xff4e5ed9),
                           fontSize: 18.0,
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
                   height: 20,
                 ),
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                         ),
                         child: InterviewImage(
                           imageLink: details.imageLink,
                         ),
                       ),
                       SizedBox(
                         height: 30.0,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: 20,
                           ),
                           Container(
                             width: 350,
                               child: Text(
                                 details.description1,
                                 style: TextStyle(
                                     fontFamily: 'MeriendaOne',
                                     color: Color(0xffff9999),
                                     fontSize: 14.0,
                                     shadows: [
                                       Shadow(
                                           blurRadius: 1.0,
                                           color: Colors.black,
                                           offset: Offset(0.3,0.3)
                                       )
                                     ]
                                 ),
                               )),
                           SizedBox(
                             width: 20,
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 20.0,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: 20,
                           ),
                           Container(
                               width: 350,
                               child: Text(
                                 details.description2,
                                 style: TextStyle(
                                     fontFamily: 'MeriendaOne',
                                     color: Color(0xffff9999),
                                     fontSize: 14.0,
                                     shadows: [
                                       Shadow(
                                           blurRadius: 1.0,
                                           color: Colors.black,
                                           offset: Offset(0.3,0.3)
                                       )
                                     ]
                                 ),
                               )),
                           SizedBox(
                             width: 20,
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 20.0,
                       ),
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                         ),
                         child: InterviewImage(
                           imageLink: details.secondImageLink,
                         ),
                       ),
                       SizedBox( height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: 20,
                           ),
                           Container(
                               width: 350,
                               child: Text(
                                 details.description3,
                                 style: TextStyle(
                                     fontFamily: 'MeriendaOne',
                                     color: Color(0xffff9999),
                                     fontSize: 14.0,
                                     shadows: [
                                       Shadow(
                                           blurRadius: 1.0,
                                           color: Colors.black,
                                           offset: Offset(0.3,0.3)
                                       )
                                     ]
                                 ),
                               )),
                           SizedBox(
                             width: 20,
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 20.0,
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