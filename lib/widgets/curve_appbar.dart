import 'package:flutter/material.dart';

class CurveAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    var firstControlPoint = Offset(size.width / 4, size.height / 2);
    var firstEndPoint = Offset(size.width / 2, size.height / 2);

    var secondControlPoint = Offset(size.width / 4 * 3, size.height / 2);
    var secondEndPoint = Offset(size.width, size.height);

    path.lineTo(0, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
