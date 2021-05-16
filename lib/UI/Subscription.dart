import 'package:flutter/material.dart';

class Subscription extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffdae7e8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Color(0xff4e5ed9),
                      fontSize: 26.0,
                      shadows: [
                        Shadow(
                            blurRadius: 3.0,
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
                elevation: 5.0,
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
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(colors: [
                    Color(0xff4e5ed9),
                    Color(0xff4e5ed9),
                  ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 3.0],
                      tileMode: TileMode.clamp
                  ),
                ),
                width: 350.0,
                height: 1.0,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  child: Text(
                    "Plans or Subscriptions",
                    style: TextStyle(
                        fontFamily: 'MeriendaOne',
                        color: Color(0xff4e5ed9),
                        fontSize: 22.0,
                        shadows: [
                          Shadow(
                              blurRadius: 1.0,
                              color: Colors.black,
                              offset: Offset(1.0,1.0)
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          RichText(
                            text: new TextSpan(
                                style: TextStyle(
                                    fontFamily: 'MeriendaOne'
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: "Primary\n",
                                      style: TextStyle(
                                          color: Color(0xffff9999),
                                        fontSize: 25.0,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 1.0,
                                                color: Colors.black,
                                                offset: Offset(1.0,1.0)
                                            )
                                          ]
                                      )
                                  ),
                                  new TextSpan(text: "1. Access to Confessions Boxes.\n",  style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "2. Access to Hangout Places Ratings.\n", style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "3. Access to Daily News and Resources.\n", style: TextStyle(color: Colors.black))
                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          RichText(
                            text: new TextSpan(
                                style: TextStyle(
                                    fontFamily: 'MeriendaOne'
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: "Junior\n",
                                      style: TextStyle(
                                          color: Color(0xffff9999),
                                          fontSize: 25.0,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 1.0,
                                                color: Colors.black,
                                                offset: Offset(1.0,1.0)
                                            )
                                          ]
                                      )
                                  ),
                                  new TextSpan(text: "1. Access to Confessions Boxes.\n",  style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "2. Access to Hangout Places Ratings.\n", style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "3. Access to Daily News and Resources.\n", style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "4. Access to Both Chatboxes\n", style: TextStyle(color: Colors.black))

                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          RichText(
                            text: new TextSpan(
                                style: TextStyle(
                                    fontFamily: 'MeriendaOne'
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: "Senior\n",
                                      style: TextStyle(
                                          color: Color(0xffff9999),
                                          fontSize: 25.0,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 1.0,
                                                color: Colors.black,
                                                offset: Offset(1.0,1.0)
                                            )
                                          ]
                                      )
                                  ),
                                  new TextSpan(text: "1. Access to Confessions Boxes.\n",  style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "2. Access to Hangout Places Ratings.\n", style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "3. Access to Daily News and Resources.\n", style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "4. Access to Both Chatboxes\n", style: TextStyle(color: Colors.black)),
                                  new TextSpan(text: "5. Access to a Private Guidance Box\n", style: TextStyle(color: Colors.black)),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}