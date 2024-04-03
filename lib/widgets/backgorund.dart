import 'package:flutter/material.dart';

class BottomLeftToRightWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    var firststartPoint = Offset(size.width / 4, size.height);
    var firstendPoint = Offset((size.width / 3) + 60, (size.height / 2) + 60);
    var secondStartPoint = Offset((size.width / 2) + 60, size.height / 3);
    var secondEndPoint = Offset(size.width, (size.height / 2) - 180);

    path.lineTo(0, size.height);
    path.quadraticBezierTo(firststartPoint.dx, firststartPoint.dy,
        firstendPoint.dx, firstendPoint.dy);
    path.quadraticBezierTo(secondStartPoint.dx, secondStartPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
