import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

void drawDashedLine({required Offset from, required Offset to, required double theDashPc, required double theGapPc,
Canvas? theCanvas, Paint? thePaint, double offsetX=0.0, double offsetY=0.0}) {
  Vector2 lineVec = Vector2(to.dx-from.dx, to.dy-from.dy);
  Vector2 dashVec = lineVec.scaled(theDashPc/100);
  Vector2 gapVec = lineVec.scaled(theGapPc/100);
  Vector2 savedPos = Vector2(from.dx, from.dy);
  Vector2 pos = savedPos.clone();

  Paint purplePaint = Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  for (int i=0; i<100/(theDashPc+theGapPc); i++) {
    pos += dashVec;
    theCanvas!.drawLine(Offset(savedPos.x,savedPos.y), Offset(pos.x,pos.y), purplePaint);
    pos += gapVec;
    savedPos = pos.clone();
    //fco.logger.i('pos.length: ${pos.length.round()}, pos: ${pos.toString()}, lineVec.length: ${lineVec.length.round()}');
  }
}
