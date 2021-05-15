import 'package:flutter/material.dart';

class Subscription extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffdae7e8),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
              child: Center(
                child: Text(
                  "YOUR SUBSCRIPTION",
                  style: TextStyle(
                      fontFamily: 'MeriendaOne',
                      color: Color(0xffff9999),
                      fontSize: 26.0,
                      shadows: [
                        Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(1.0,1.0)
                        )
                      ]
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Card(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "Current Subscription",
                        style: TextStyle(
                          fontSize: 18.0
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "Senior",
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}