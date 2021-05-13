import 'package:flutter/material.dart';
import 'package:lpchub/DashBoard/dashboard.dart';
import 'package:lpchub/SignUp/Login.dart';
import 'package:lpchub/SignUp/Utils/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Landing extends StatefulWidget{
  _LandingState createState() =>  _LandingState();
}

class _LandingState extends State<Landing>
{

  bool pageInitialised = false;

  @override
  void initState() {
    checkIfUserLoggedIn();
    super.initState();
  }

  checkIfUserLoggedIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool userLoggedIn = (sharedPreferences.getString('id')??'').isNotEmpty;
    if(userLoggedIn){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard(),));
    }else{
      setState(() {
        pageInitialised = true;
      });
    }
  }

  AuthService authentication;
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xfffef5f5),
      body: (pageInitialised)? Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:100,
            ),
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/images/landing.png'),
                        fit: BoxFit.fill
                    ),
                    // borderRadius: BorderRadius.circular(30.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: const Color(0xeb000000),
                    //       blurRadius: 6
                    //   )
                    // ]
                ),
              ),

            SizedBox(
              height: 40.0,
            ),
            Center(
              child: Container(
                child: Text(
                  "SCHOOLHUB",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Color(0xffff9999),
                      fontSize: 30.0,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(1.0,1.0)
                      )
                    ]
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.1,
            ),
            Container(
              child: Text(
                "An App For Students, By Students",
                style: TextStyle(
                    fontFamily: 'MeriendaOne',
                    fontSize: 20.0,
                    color: Color(0xffff9999),
                    shadows: [
                      Shadow(
                          blurRadius: 2.0,
                          color: Colors.black,
                          offset: Offset(0.2,0.2)
                      )
                    ]
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 345,
              child: Text(
                "Get to know about all the Do\'s and Don\'ts during your school journey from your school toppers.",
                style: TextStyle(
                    color: Color(0xffff9999),
                    fontSize: 20.0,
                    fontFamily: 'MeriendaOne',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
                child: Container(
                  height: 110,
                  width: 80,
                  child: Center(
                    child: Text(
                      "START",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'MeriendaOne',
                          color: Color(0xffff9999),
                          shadows: [
                            Shadow(
                                blurRadius: 5.0,
                                color: Colors.black,
                                offset: Offset(0.5,0.5)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Input(),));
                },
                color: Color(0xfffef5f5),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffff9999),width: 2.0),
                    borderRadius: BorderRadius.circular(1000.0)
                )
            )
          ],
        ),
      ): Center(
        child: SizedBox(
          height: 36,
          width: 36,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff9999)),
          ),
        ),
      ),
    );
  }
}