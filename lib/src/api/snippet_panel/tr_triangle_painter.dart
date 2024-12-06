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
    path.lineTo(40,0);
    path.lineTo(40,40);
    path.lineTo(00,0);
    path.close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

