import 'package:flutter/material.dart';
import 'package:lpchub/PreviousPapers/previous_years_papers.dart';

class LPC extends StatefulWidget
{
  _LPCState createState() => new _LPCState();
}

class _LPCState extends State<LPC>
{

  String nine = "nine", ten ="ten", eleven = "eleven", twelve = "twelve";

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff104976),
        elevation: 10.0,
        title: Text("Select Your Class",
        style: TextStyle(
          fontFamily: 'MeriendaOne',
          color: Colors.white,
        ),),
      ),
      body: Container(
         height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: Color(0xff104976),
                    elevation: 10.0,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LuckPapers(className:nine),));
                        },
                        title: Center(
                          child: Text(
                              "Standaed 9th",
                          style: TextStyle(
                            color: Color(0xffE69494),
                            fontFamily: 'MeriendaOne',
                          ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Card(
                    color: Color(0xff104976),
                    elevation: 10.0,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LuckPapers(className:ten),));
                        },
                        title: Center(
                          child: Text(
                            "Standaed 10th",
                            style: TextStyle(
                              color: Color(0xffE69494),
                              fontFamily: 'MeriendaOne',
                            ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),

            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    color: Color(0xff104976),
                    elevation: 10.0,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LuckPapers(className:eleven),));
                        },
                        title: Center(
                          child: Text(
                            "Standaed 11th",
                            style: TextStyle(
                              color: Color(0xffE69494),
                              fontFamily: 'MeriendaOne',
                            ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Card(
                    color: Color(0xff104976),
                    elevation: 10.0,
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LuckPapers(className:twelve),));
                        },
                        title: Center(
                          child: Text(
                            "Standaed 12th",
                            style: TextStyle(
                              color: Color(0xffE69494),
                              fontFamily: 'MeriendaOne',
                            ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}