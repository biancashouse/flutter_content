import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/widgets/painters/dashed_line_helper.dart';

class DashedPaperBorderPainter extends CustomPainter with WidgetHelperMixin {
  final FlowchartM _fbe;

  DashedPaperBorderPainter(this._fbe);

  @override
  void paint(Canvas canvas, Size size) {
    // only show dashed page border in portrait
    double screenPaperW = _fbe.screenPaperW;
    double screenPaperH = _fbe.screenPaperH;
    drawDashedLine(
        from: Offset(PdfPageOffset.dx, PdfPageOffset.dy),
        to: Offset(PdfPageOffset.dx, PdfPageOffset.dy + screenPaperH),
        theDashPc: 1.125,
        theGapPc: 1.375,
        theCanvas: canvas);
    drawDashedLine(
        from: Offset(PdfPageOffset.dx + screenPaperW, PdfPageOffset.dy),
        to: Offset(PdfPageOffset.dx, PdfPageOffset.dy),
        theDashPc: 1.125,
        theGapPc: 1.375,
        theCanvas: canvas);
    drawDashedLine(
        from: Offset(PdfPageOffset.dx + screenPaperW, PdfPageOffset.dy),
        to: Offset(
            PdfPageOffset.dx + screenPaperW, PdfPageOffset.dy + screenPaperH),
        theDashPc: 1.125,
        theGapPc: 1.375,
        theCanvas: canvas);
    drawDashedLine(
        from: Offset(
            PdfPageOffset.dx + screenPaperW, PdfPageOffset.dy + screenPaperH),
        to: Offset(PdfPageOffset.dx, PdfPageOffset.dy + screenPaperH),
        theDashPc: 1.125,
        theGapPc: 1.375,
        theCanvas: canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
