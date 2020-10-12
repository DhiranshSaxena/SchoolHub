import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/Circulars/pdf_page.dart';

class LuckPapers extends StatelessWidget
{

  final String className;
  LuckPapers({this.className});
  PdfPages pdf;


   Widget build(BuildContext context)
   {
     return SafeArea(
       child: Scaffold(
         backgroundColor: Color(0xffcee0e2),
         appBar: AppBar(
           elevation: 10.0,
           backgroundColor: Color(0xff104976),
           title: Text(
               "Previous Years Papers",
           style: TextStyle(
             fontSize: 18,
             fontFamily: 'MeriendaOne'
           ),),
         ),
         body: Container(
           child: Column(
             children: [
               Container(
                  width: MediaQuery.of(context).size.width,
               ),
               StreamBuilder(
                 stream: FirebaseFirestore.instance.collection('LPC_Papers').snapshots(),
                 builder: (context, snapshot){
                   if(snapshot.data == null){
                     return Center(
                         child: CircularProgressIndicator()
                     );
                   }
                   List<PaperTitlePanel> panels = [];
                   final details =snapshot.data.documents;
                   for(var detail in details){
                     final title = detail.data()["Subject"];
                     final link = detail.data()["pdf_link"];
                     final sem = detail.data()["semester"];
                     if(detail.data()["Class"] == className){
                       final paperTitlePanel = PaperTitlePanel(
                         title: title,
                         sem : sem,
                         onTap: (){
                           pdf = PdfPages(
                             url: link,
                           );
                           Navigator.push(context,
                               MaterialPageRoute(
                                   builder:((context)=>pdf)
                               )
                           );

                         },

                       );
                       panels.add(paperTitlePanel);
                     }
                   }
                   return Expanded(
                     child: ListView(
                       children: panels.isEmpty?
                       [
                         SizedBox(
                           height: 10.0,
                         ),
                         Center(
                           child: Text(
                             'Nothing found',
                             style:
                             TextStyle(color: Colors.grey, fontSize: 25.0),
                           ),
                         )
                       ]
                           : panels,
                     ),
                   );
                 },
               ),
             ],
           ),
         ),
       ),
     );
   }
}

class PaperTitlePanel extends StatefulWidget {
  final String title;
  final Function onTap;
  final String sem;
  const PaperTitlePanel({this.title, this.onTap, this.sem});

  @override
  _PaperTitlePanelState createState() => _PaperTitlePanelState();
}

class _PaperTitlePanelState extends State<PaperTitlePanel> {
  bool buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails d) {
        setState(() {
          buttonPressed = true;
        });
      },
      onTapUp: (TapUpDetails d) {
        setState(() {
          buttonPressed = false;
        });
      },
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xff104976),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                color: Color(0xff001a66),
                width: 3.0,
              )),
          child: Center(
            child: Text(
              widget.title + " - " + widget.sem,
              style: TextStyle(color: Color(0xffE69494), fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}