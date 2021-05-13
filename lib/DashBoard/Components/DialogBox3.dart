import 'package:flutter/material.dart';

class FunkyOverlay4 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FunkyOverlay4State();
}

class FunkyOverlay4State extends State<FunkyOverlay4>
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
                color: Color(0xffe1bfbf),
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
                      new TextSpan(text: "Share the App with Friends\n\n",  style: TextStyle(fontWeight: FontWeight.bold, color:     Colors.black, fontSize: 18)),
                      new TextSpan(text: "As you know, SchoolHub is a newest App project of Schaffen Softwares. Therefore, we are happy to announce that we will be distributing our premium subscription to first 500 users of this app. So Hurry! and try to share it with your friends as soon as possible before the offer get ended.\n\n", style: TextStyle(color: Colors.black)),
                      new TextSpan(text: "For sharing the app go to the settings from top-right button icon and then select the \"Share SchoolHub\" option \n\n", style: TextStyle(color: Colors.black)),
                      new TextSpan(text: "Pro Tip :- ",  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,)),
                      new TextSpan(text: "Join our SchoolHub Club and then share the app for 20 times and get advantages and offers like free vouchers and gifts, free registration to workshops or events and many more. For getting more info contact contact us on our WhatsApp at +91 99199 21160. Our Technical members will be trying their best to reply you as soon as possible", style: TextStyle(color: Colors.black)),
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
