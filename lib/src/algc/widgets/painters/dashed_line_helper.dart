import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart';

void drawDashedLine({required Offset from, required Offset to, required double theDashPc, required double theGapPc,
Canvas? theCanvas, Paint? thePaint, double offsetX=0.0, double offsetY=0.0}) {
  Offset lineVec = Offset(to.dx-from.dx, to.dy-from.dy);
  Offset dashVec = lineVec.scale(theDashPc/100, theDashPc/100);
  Offset gapVec = lineVec.scale(theGapPc/100, theGapPc/100);
  Offset savedPos = Offset(from.dx, from.dy);
  Offset pos = Offset(savedPos.dx, savedPos.dy);

  Paint purplePaint = Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  for (int i=0; i<100/(theDashPc+theGapPc); i++) {
    pos += dashVec;
    theCanvas!.drawLine(Offset(savedPos.dx,savedPos.dy), Offset(pos.dx,pos.dy), purplePaint);
    pos += gapVec;
    savedPos = Offset(savedPos.dx, savedPos.dy);
  }
}
