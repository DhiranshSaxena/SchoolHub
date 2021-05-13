import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Memes extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff104976),
          title: Text("Memes"),
          elevation: 10.0,
        ),
        backgroundColor: Color(0xffcee0e2),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Memes').orderBy('timeStamp').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator())
                          ],
                        ),
                      );
                    }
                    List<MemePanel> panels = [];
                    final details =snapshot.data.documents;
                    for(var detail in details){
                      final memeLink = detail.data()['meme_link'];
                      final memePanel = MemePanel(
                        memeLink: memeLink,
                      );
                      panels.add(memePanel);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MemePanel extends StatefulWidget {

  final String memeLink;
  const MemePanel({this.memeLink});

  @override
  _MemePanelState createState() => _MemePanelState();
}

class _MemePanelState extends State<MemePanel> {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(

            width: MediaQuery.of(context).size.width,
            color: Color(0xff104976),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: NetworkImage(
                        widget.memeLink
                      ),
                    ),
                  )
                ],
              ),
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