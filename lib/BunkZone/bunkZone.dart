import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/Interviews/interview_page.dart';

import 'bunkZonePage.dart';

class BunkZone extends StatefulWidget
{
  _BunkZoneState createState() => new _BunkZoneState();
}

class _BunkZoneState extends State<BunkZone>
{

  String docname = "", status = "";
  int Views = 0;

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff104976),
        title: Text(
          "Bunk-Zone",
          style: TextStyle(
            fontFamily: 'MeriendaOne',
          ),
        ),
      ),
      body: Container(
        color: Color(0xffcee0e2),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [StreamBuilder(
            stream: FirebaseFirestore.instance.collection('BunkZone').orderBy('timeStamp').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<BunkTitlePanel> panels = [];
              final details =snapshot.data.documents;
              for(var detail in details){
                final name = detail.data()["Name"];
                final status = detail.data()["Location"];
                final date = detail.data()["Date"];
                final bunkTitlePanel = BunkTitlePanel(
                  Name: name,
                  Status : status,
                  Date:date,
                  onTap: (){
                    docname = name;
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder:((context) => BunkZonePage(docName: docname,))
                        )
                    );

                  },

                );
                panels.add(bunkTitlePanel);

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
    );
  }
}

class BunkTitlePanel extends StatefulWidget {
  final String Name;
  final Function onTap;
  final String Date;
  final String Status;
  const BunkTitlePanel({this.Name, this.onTap, this.Status,this.Date});

  @override
  _BunkTitlePanelState createState() => _BunkTitlePanelState();
}

class _BunkTitlePanelState extends State<BunkTitlePanel> {
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
        child: SingleChildScrollView(
          child: Container(

            width: MediaQuery.of(context).size.width,
            color: Color(0xff104976),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only( top: 10,bottom:10.0),
                  child: Text(
                    widget.Name,
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Color(0xffE69494),
                        fontSize: 23
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    widget.Status,
                    style: TextStyle(
                        color: Color(0xffcee0e2),
                        fontSize: 18.0,
                        fontFamily: 'Roboto'
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text("Posted On - " +
                      widget.Date,
                    style: TextStyle(
                        color: Color(0xffff6f61),
                        fontFamily: 'Roboto',
                        fontSize: 16.0
                    ),
                  ),
                )
              ],
            ),

            /*padding: EdgeInsets.all(12.0),
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
            ),*/
          ),
        ),
      ),
    );
  }
}