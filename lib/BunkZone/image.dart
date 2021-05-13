import 'package:flutter/material.dart';

class BunkImage extends StatelessWidget{
  final String imageLink;

  const BunkImage({this.imageLink});


  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width-30,
        height: 400,
        child: Center(
          child: Image(
            width: 400,
            height: 200,
            image: NetworkImage(imageLink),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

}