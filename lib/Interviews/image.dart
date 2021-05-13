import 'package:flutter/material.dart';

class InterviewImage extends StatelessWidget{
  final String imageLink;

  const InterviewImage({this.imageLink});


  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        height: 600,
        child: Center(
          child: Image(
            width: 600,
            height: 400,
            image: NetworkImage(imageLink),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

}