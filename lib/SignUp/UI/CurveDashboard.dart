import 'package:flutter/material.dart';

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 50);
    var controlPoint = Offset(30, size.height);
    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    var controlPoint2 = Offset(size.width-30, size.height);
    var endPoint2 = Offset(size.width, size.height-50);
    path.quadraticBezierTo(controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}