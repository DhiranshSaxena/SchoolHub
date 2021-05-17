import 'package:flutter/material.dart';

class Demo extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: Image(
              image: AssetImage('asset/images/lpc.png'),
            ),
          ),
        ],
      ),
    );
  }
}