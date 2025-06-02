import 'package:flutter/material.dart';

class TRTriangle extends CustomPainter {
  final Color color;

  TRTriangle(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(size.width,0);
    path.lineTo(size.width,size.height);
    path.lineTo(0,0);
    path.close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

