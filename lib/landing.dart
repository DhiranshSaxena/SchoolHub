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
      backgroundColor: Color(0xff104976),
      body: (pageInitialised)? Container(
        child: Column(
          children: [
            SizedBox(
              height:70,
            ),
            Center(
              child: Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/images/landing.jpg'),
                        fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xeb000000),
                          blurRadius: 6
                      )
                    ]
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                child: Text(
                  "SCHOOLHUB",
                  style: TextStyle(
                      fontFamily: 'MeriendaOne',
                      color: Color(0xffff9999),
                      fontSize: 30.0
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
                    fontFamily: 'Caveat',
                    fontSize: 23.0,
                    color: Color(0xffff9999)
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 340,
              child: Text(
                "School-Hub is an App made for Students of Class 9th to 12th.\n\nThe App contains all the necessary features that a student requires to score higher grade.",
                style: TextStyle(
                    color: Color(0xffff9999),
                    fontSize: 20.0,
                    fontFamily: 'Roboto'
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
                child: Container(
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'MeriendaOne',
                          color: Color(0xff104976)
                      ),
                    ),
                  ),
                ),
                onPressed: (){

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Input(),));

                },
                color: Color(0xff3d8ecd),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                )
            )
          ],
        ),
      ): Center(
        child: SizedBox(
          height: 36,
          width: 36,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ),
    );
  }
}