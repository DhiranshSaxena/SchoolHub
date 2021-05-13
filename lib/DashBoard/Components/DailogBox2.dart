import 'package:flutter/material.dart';

class FunkyOverlay3 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FunkyOverlay3State();
}

class FunkyOverlay3State extends State<FunkyOverlay3>
    with SingleTickerProviderStateMixin {


  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Color(0xfff5f4c4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: RichText(
                text: new TextSpan(
                    style: TextStyle(
                        fontFamily: 'MeriendaOne'
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: "Join Our SchoolHub Team\n\n",  style: TextStyle(fontWeight: FontWeight.bold, color:     Colors.black, fontSize: 18)),
                      new TextSpan(text: "Hey, You think you have a leadership quality or what it takes to represent your school at national level! Our SchoolHub team is the place for you. We are recruiting student from different schools around India to form a community. The people who'll get selected will be representing their school on SchoolHub.  \n\n", style: TextStyle(color: Colors.black)),
                      new TextSpan(text: "Don\'t worry if you didn\'t get a call back. We will be giving you an alternative to join our SchoolHub academy where we will be training you for 15 days for the department you are interested in. \n\nFor filling the recruitment form either go to the settings from top-right button icon and then select the \"Join Our Team\" option or Contact our technical support on WhatsApp at +91 99199 21160 and rest our technical support members will be taking care of further procedure. ", style: TextStyle(color: Colors.black))
                    ]
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
