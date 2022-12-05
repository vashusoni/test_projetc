import 'package:flutter/cupertino.dart';

class LoginCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

     path.lineTo(0, size.height/1.2);
    path.cubicTo(size.height-60,size.width-180, size.height/3, size.width/6, size.height/1.4, size.height/6);
     path.lineTo(size.width/1.3, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
