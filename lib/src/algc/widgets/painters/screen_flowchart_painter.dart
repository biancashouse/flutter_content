import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';
import 'package:flutter_content/src/algc/widgets/painters/dashed_line_helper.dart';
import 'package:flutter_content/src/algc/widgets/painters/paint_helper.dart';

class FlowchartSkeletonPainter extends CustomPainter with WidgetHelperMixin {
  final bool skipDashedBorder;
  final FlowchartM _fbe;
  final bool higlightBeginStep;
  final bool higlightEndStep;

  FlowchartSkeletonPainter(this._fbe,
      {this.skipDashedBorder = false,
      this.higlightBeginStep = false,
      this.higlightEndStep = false});

  double get canvasW => max(_fbe.screenPaperW,
      _fbe.MMM + _fbe.PPP + _fbe.beginTxtW + _fbe.PPP + _fbe.MMM);

  double canvasH(double theSumOfFuncStepHeights) => max(
      _fbe.screenPaperH,
      _fbe.MMM +
          _fbe.PPP +
          _fbe.beginTxtH +
          _fbe.PPP +
          theSumOfFuncStepHeights +
          _fbe.MMM +
          _fbe.endTxtH +
          _fbe.PPP);

  @override
  void paint(Canvas canvas, Size size) {
    // only show dashed page border in portrait
    double screenPaperW = _fbe.screenPaperW;
    double screenPaperH = _fbe.screenPaperH;
    // page border - red outside boundary - ONLY when not a selection present
    //fco.logger.i('showing adders: ${_flowchart.showAdders}');
    if (!skipDashedBorder) {
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

    paintBeginShape(canvas);

    paintEndShape(canvas);
  }

  void paintBeginShape(Canvas canvas) {
    double x, y, r;

    x = _fbe.flowchartOffset.dx + _fbe.MMM * 2;
    y = _fbe.flowchartOffset.dy + _fbe.MMM + _fbe.PPP + _fbe.TTT / 2;
    r = _fbe.PPP + _fbe.TTT / 2;

    bool possibleThicker = higlightBeginStep;

    // if (!possibleThicker)
    //   possibleThicker = App.editorBloc.state is Editor_Showing_StepType_Menu && (App.editorBloc.state as Editor_Showing_StepType_Menu)?.beginStepTapped ?? false;

    // fco.logger.i('y = $y');

    double beginTxtW = _fbe.beginTxtW;

    Offset sausageLeftCentre = Offset(x, y);
    Offset sausageRightCentre = Offset(x + beginTxtW + r + _fbe.PPP, y);

    drawSausage(_fbe, sausageLeftCentre, sausageRightCentre, r,
        theCanvas: canvas, thePaint: bgPaint(_fbe.beginShapeFillColor));
    drawSausage(_fbe, sausageLeftCentre, sausageRightCentre, r,
        theCanvas: canvas,
        thePaint: possibleThicker
            ? thickLinePaint(
                Colors.grey,
              )
            : linePaint(Colors.grey));

    if (_fbe.stepsShowingChanges.isEmpty) {
      canvas.drawLine(
          Offset(x + _fbe.PPP, y + r),
          Offset(
              x + _fbe.PPP, y + _fbe.stepListOffsetTop(ROOT_STEPS) + _fbe.MMM),
          linePaint(Colors.grey));
    }
  }

  void paintEndShape(Canvas canvas) {
    double x, y, r;

    // end section
    x = _fbe.flowchartOffset.dx + _fbe.MMM;
    y = _fbe.flowchartOffset.dy +
        _fbe.stepListOffsetTop(ROOT_STEPS) +
        _fbe.sumOfHeightsOf(_fbe.steps);
    r = _fbe.PPP + _fbe.TTT / 2;

    double endTxtW = _fbe.endTxtW;

    bool possibleThicker = higlightEndStep;
    // if (!possibleThicker)
    //   possibleThicker = App.editorBloc.state is Editor_Showing_StepType_Menu && (App.editorBloc.state as Editor_Showing_StepType_Menu)?.endStepTapped ?? false;

    Offset sausageLeftCentre = Offset(x + r, y + _fbe.MMM + r);
    Offset sausageRightCentre =
        Offset(x + endTxtW + r + _fbe.PPP, y + _fbe.MMM + r);

    drawSausage(_fbe, sausageLeftCentre, sausageRightCentre, r,
        theCanvas: canvas, thePaint: bgPaint(_fbe.endShapeFillColor));
    drawSausage(_fbe, sausageLeftCentre, sausageRightCentre, r,
        theCanvas: canvas,
        thePaint: possibleThicker
            ? thickLinePaint(
                Colors.grey,
              )
            : linePaint(Colors.grey));

    canvas.drawLine(Offset(x + _fbe.MMM + _fbe.PPP, y),
        Offset(x + _fbe.MMM + _fbe.PPP, y + _fbe.MMM), linePaint(Colors.grey));

//    drawLine(_fbe, Offset(x + _fbe.MMM + _fbe.PPP, y),
//        Offset(x + _fbe.MMM + _fbe.PPP, y + _fbe.MMM),
//        theCanvas: canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
