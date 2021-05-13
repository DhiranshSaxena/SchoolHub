import 'package:flutter/material.dart';

class BunkDescription extends StatelessWidget
{
  final String description1,description2,description3;

  const BunkDescription({this.description1,this.description2,this.description3});

  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Flexible(
                  child: Text(
                    description1,
                    style: TextStyle(
                        color: Color(0xffE69494),
                        fontFamily: 'Sora',
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Flexible(
                  child: Text(
                    description2,
                    style: TextStyle(
                        color: Color(0xffE69494),
                        fontFamily: 'Sora',
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Flexible(
                  child: Text(
                    description3,
                    style: TextStyle(
                        color: Color(0xffE69494),
                        fontFamily: 'Sora',
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}