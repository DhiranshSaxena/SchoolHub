import 'package:flutter/material.dart';

class FunkyOverlay extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
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
                color: Color(0xffdae7e8),
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
                      new TextSpan(text: "Welcome to SchoolHub\n\n",  style: TextStyle(fontWeight: FontWeight.bold, color:     Colors.black, fontSize: 18)),
                      new TextSpan(text: "Hey Everyone, We are really happy to bring you all the best utility project for school students which is made by the students by keeping everything in mind which made them struggle in their school days. We are trying to provide solutions to your everyday problem by this app.\n\n", style: TextStyle(color: Colors.black)),
                      new TextSpan(text: "The App is in it\'s Early Access Version therefore it is released for only two schools right now and opened for only the ones who have pre-registered it. The full version of the app will be coming shortly till then if you want your friends to use this app, you can watch the next story to know how you can make them a pre-registered user.", style: TextStyle(color: Colors.black))
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
