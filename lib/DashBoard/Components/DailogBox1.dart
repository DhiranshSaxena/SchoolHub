import 'package:flutter/material.dart';

class FunkyOverlay2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FunkyOverlay2State();
}

class FunkyOverlay2State extends State<FunkyOverlay2>
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
                color: Color(0xffcbf5cc),
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
                      new TextSpan(text: "Rules and Regulations\n\n",  style: TextStyle(fontWeight: FontWeight.bold, color:     Colors.black, fontSize: 18)),
                      new TextSpan(text: "Welcome to SchoolHub adn thank you for choosing our app! At SchoolHub, we take the safety of our users very seriously. Out technical team constantly moderates all profiles, photos and language use on the platform and we try to keep our app to the highest of standards in order to safeguard your privacy and security.\n\n", style: TextStyle(color: Colors.black)),
                      new TextSpan(text: "SchoolHub is an open and enriching platform, there\'s no place for Harassment and Spam here.\n\n 1.  Don\'t publish or send messages, videos or photos with damaging, threatening, misleading, defamatory, rancorous, aggressive, racist, vulgar, denigrating, indecent, insulting, violent, obscene or pornographic content.\n\n 2. Don\'t spam, don\'t try to recruit votes, don\'t send unsolicited commercials or chain letters and don\'t flood or write excessively long texts.", style: TextStyle(color: Colors.black))
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
