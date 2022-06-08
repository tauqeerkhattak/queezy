import 'package:flutter/cupertino.dart';

class NotchedClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo((size.width / 2) - 40, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 25,
      (size.width / 2) + 40,
      size.height,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return false;
  }
}
