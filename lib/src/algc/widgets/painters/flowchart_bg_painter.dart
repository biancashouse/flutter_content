import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/widgets/painters/paint_helper.dart';

class FlowchartBgPainter extends CustomPainter {
  final FlowchartM fbe;

  FlowchartBgPainter(this.fbe);

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint;

    bgPaint = fbe.isVersionLatest ? fco.whiteBgPaint : greyBgPaint;

    Rect innerRect = Rect.fromPoints(
      Offset(0.0, 0.0),
      Offset(
        fbe.screenPaperW,
        fbe.screenPaperH,
      ),
    );

    canvas.drawRect(innerRect, bgPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
