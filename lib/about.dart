//ToDo: Share
//ToDO: RateMyApp
//ToDo: PrivacyPolicy
//ToDo: Feedback
//ToDO: SignOut
//ToDo: Join Our Discord Server
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/SignUp/Login.dart';
import 'package:lpchub/SignUp/Utils/auth.dart';
import 'package:lpchub/feedback.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'helper.dart';
import 'package:lpchub/SignUp/Utils/wrapper.dart';

class About extends StatelessWidget {
  final AuthService _auth = AuthService();
  String link = "www.schaffensofts.com";
  String url =
      "https://www.privacypolicygenerator.info/live.php?token=iQwlfE67zc0HkMZQXa3fjwfTTFhu3XTL";
  String discordURL = "https://discord.gg/34TkJRN";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff104976),
        elevation: 10.0,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontFamily: 'MeriendaOne'),
        ),
      ),
      backgroundColor: Color(0xffcee0e2),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xffe6005c),
                child: Center(
                  child: Text(
                    "Rate Our App",
                    style: TextStyle(
                        fontFamily: 'Sora',
                        color: Colors.white,
                        fontSize: 25.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 20,
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  share(context, link);
                },
                child: Container(
                  color: Color(0xffe6b800),
                  child: Center(
                    child: Text(
                      "Share With Friends",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  _launchUrl(url);
                },
                child: Container(
                  color: Color(0xff009933),
                  child: Center(
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => feedback(),
                  ));
                },
                child: Container(
                  color: Color(0xffe600e6),
                  child: Center(
                    child: Text(
                      "Feedback",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  _launchUrl(discordURL);
                },
                child: Container(
                  color: Color(0xff6666ff),
                  child: Center(
                    child: Text(
                      "Join Our Discord Server",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  //SystemNavigator.pop();
                  HelperFunc.saveUserloggedIn(false);
                  print("Logged out");
                  Navigator.popAndPushNamed(context, '/wrapper');
                },
                child: Container(
                  color: Color(0xff00cc66),
                  child: Center(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  share(BuildContext context, link) {
    final RenderBox box = context.findRenderObject();

    Share.share(link,
        subject: "Download the SchoolHub App now",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
