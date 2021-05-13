import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MyBottomSheet extends StatelessWidget{

  String appURL = "https://play.google.com/store/apps/details?id=com.schaffen.lpchub";
  String link = "www.schaffensofts.in";
  String discordURL = "https://discord.gg/34TkJRN";
  String url = "https://www.privacypolicygenerator.info/live.php?token=iQwlfE67zc0HkMZQXa3fjwfTTFhu3XTL";

  Widget build(BuildContext context){
    return IconButton(
      icon: Icon(FontAwesomeIcons.layerGroup, color: Color(0xff4e5ed9),),
      onPressed: (){
        showModalBottomSheet(
          backgroundColor: Color(0xffdae7e8),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            context: context,
            builder: (context){
            return ListView(
              children: [
                ListTile(
                  title: Center(
                    child: Text(
                        "Profile and Account",
                      style: TextStyle(
                          color: Color(0xffff9999),
                        fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Your Subcription",
                      style: TextStyle(
                          color: Color(0xffff9999),
                          fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                // ListTile(
                //   title: Center(
                //     child: Text(
                //       "Help Center",
                //       style: TextStyle(
                //           color: Color(0xffff9999),
                //           fontFamily: 'MeriendaOne',
                //           shadows: [
                //             Shadow(
                //                 blurRadius: 1.0,
                //                 color: Colors.black,
                //                 offset: Offset(0.5,0.5)
                //             )
                //           ]
                //       ),
                //     ),
                //   ),
                // ),
                ListTile(
                  onTap: (){
                    _launchUrl(appURL);
                  },
                  title: Center(
                    child: Text(
                      "Rate Us",
                      style: TextStyle(
                          color: Color(0xffff9999),
                          fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Give Your Feedback",
                      style: TextStyle(
                          color: Color(0xffff9999),
                          fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){
                    share(context, appURL);
                  },
                  title: Center(
                    child: Text(
                      "Share SchoolHub",
                      style: TextStyle(
                          color: Color(0xffff9999),
                          fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _launchUrl(discordURL);
                  },
                  title: Center(
                    child: Text(
                      "Join Our Discord Server",
                      style: TextStyle(
                          color: Color(0xffff9999),
                          fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Community Guidelines",
                      style: TextStyle(
                          fontFamily: 'MeriendaOne',
                          color: Color(0xffff9999),
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    _launchUrl(url);
                  },
                  title: Center(
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Color(0xffff9999),
                          fontFamily: 'MeriendaOne',
                          shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            );
            }
        );
      },
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