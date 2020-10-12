import 'package:flutter/material.dart';

class NameAndJob extends StatelessWidget
{
  final String Name, Status;

  const NameAndJob({this.Status,this.Name});

  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "Name - " + Name,
                  style: TextStyle(
                    color: Color(0xffE69494),
                    fontFamily: 'Sora',
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: Text(
                    "Job Status - " + Status,
                    style: TextStyle(
                        color: Color(0xffE69494),
                        fontFamily: 'Sora',
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}