import 'package:flutter/material.dart';
import 'package:lpchub/PreviousPapers/cms.dart';

import 'lpc.dart';

class Schools extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff104976),
        elevation: 10.0,
        title: Text(
            "Select Your School",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'MeriendaOne'
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                elevation: 10.0,
                color: Color(0xff104976),
                child: Container(
                  height: 200,
                  width: 200,
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LPC(),));
                    },
                    title: Center(
                        child: Text(
                            "Lucknow Public College",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'MeriendaOne',
                            color: Color(0xffE69494),
                            fontSize: 23
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                elevation: 10.0,
                color: Color(0xff104976),
                child: Container(
                  height: 200,
                  width: 200,
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CMS(),));
                    },
                    title: Center(
                        child: Text(
                          "City Montessori School",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'MeriendaOne',
                              color: Color(0xffE69494),
                              fontSize: 23
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}