import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';

const bool DEBUGGING = false;
const bool SHOW_HELPERS = false;

final Paint moverPaint = Paint()
  ..color = Colors.orange[700]!
  ..strokeCap = StrokeCap.round
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5.0;

final Paint bottomPaint = Paint()
  ..color = DEBUGGING ? Colors.cyan[700]! : Colors.black
  ..strokeCap = StrokeCap.round
  ..style = PaintingStyle.stroke
  ..strokeWidth = DEBUGGING ? 3.0 : 2.0;

//
// final Color normalBg = BLOC.nestingLevelcolor();
final Color? showingInsertersBg = Colors.green[50];
final Color? showingMoversBg = Colors.orange[50];
const Color showingTrashModeBg = Colors.white;
final Color? showingCommentIconsBg = Colors.purple[50];

//Paint normalfco.bgPaint() => fco.bgPaint(BLOC.nestingLevelcolor());
Paint get showingInsertersBgPaint => fco.bgPaint(showingInsertersBg!);

Paint get showingMoversBgPaint => fco.bgPaint(showingMoversBg!);

Paint get showingTrashModeBgPaint => fco.bgPaint(showingTrashModeBg);

Paint get showingCommentIconsBgPaint => fco.bgPaint(showingCommentIconsBg!);

Paint get greyBgPaint => fco.bgPaint(Colors.grey[200]!);

Paint get greenBgPaint => fco.bgPaint(Colors.green);

void drawLine(FlowchartM theFlowchart, Offset from, Offset to,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawLine(from, to, fco.linePaint(color));
}

void drawThickLine(FlowchartM theFlowchart, Offset from, Offset to,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawLine(from, to, fco.thickLinePaint(color));
}

void drawVeryThickLine(FlowchartM theFlowchart, Offset from, Offset to,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawLine(from, to, fco.veryThickLinePaint(color));
}

void drawRect(FlowchartM theFlowchart, Rect theRect,
    {required Canvas theCanvas,
    Color? theLineColor,
    Color? theBgColor,
    bool thicker = false}) {
  theCanvas.drawRect(theRect, fco.bgPaint(theBgColor!));
  theCanvas.drawRect(
      theRect,
      thicker
          ? fco.thickLinePaint(theLineColor!)
          : fco.linePaint(theLineColor!));
}

// incl M and P around txt
void drawTxtBox(
  StepM model, {
  required Canvas theCanvas,
  bool isSelected = false,
}) {
//  double boxWidth = model.PPP +
//      (model.isFuncCallStep() ? model.PPP : 0) +
//      model.calculatedTxtSize.widthForPdf*model.zoom +
//      model.PPP +
//      (theG != null ? model.PPP : 0.0) +
//      (model.isFuncCallStep() ? model.PPP : 0);

  double extraWidthForFunctionCallOrIcon =
      model.isFuncCallStep() ? model.PPP * 2 : model.PPP;

  if (model.iconIndex > 0) {
    extraWidthForFunctionCallOrIcon += ICON_IMAGE_SIZE + model.PPP;
  }

  double left = model.MMM * 2;
  double top = 0.0;
  // double txtBoxBottom;
  // double txtBoxRight;
  // List<String> lines = model.txt.split('\n');
  // double txtH = (model.TTT) * lines.length;

  bool possibleThicker = isSelected;

  // if (!possibleThicker)
  //   possibleThicker =
  //       App.editorBloc.state is Editor_Showing_StepType_Menu && (App.editorBloc.state as Editor_Showing_StepType_Menu).stepTapped == model;

  // draw txt box

  // fco.logger.i('model.calculatedTxtSize.height is ${model.calculatedTxtSize.height}');

  Rect rect = Rect.fromPoints(
      Offset(left = model.MMM * 2, top = model.MMM),
      //bit wider for pdf
      Offset(
          /* txtBoxRight = */
          left +
              model.PPP +
              (model.calculatedTxtSize.width +
                  extraWidthForFunctionCallOrIcon) +
              model.PPP,
          // txtBoxBottom = theG != null && lines.length > 1
          //     ? top + model.PPP / 2 + txtH + model.PPP / 2
          //     : top + model.PPP / 2 + model.calculatedTxtSize.height + model.PPP / 2,
          /* txtBoxBottom = */
          top +
              model.PPP / 2 +
              model.calculatedTxtSize.height +
              model.PPP / 2));

  drawRect(
    model.parentFlowchart,
    rect,
    theCanvas: theCanvas,
    theLineColor: model.shapeLineColor,
    theBgColor: model.shapeFillColor,
    thicker: possibleThicker,
  );

  // lines
  if (model.iconIndex > 0) {
    // draw icon box
    rect = Rect.fromPoints(
        Offset(left, top),
        //bit wider for pdf
        Offset(
          left + ICON_IMAGE_SIZE + model.PPP,
          top + model.PPP / 2 + model.calculatedTxtSize.height + model.PPP / 2,
        ));
    drawRect(model.parentFlowchart, rect,
        theCanvas: theCanvas,
        theLineColor: model.shapeLineColor,
        theBgColor: model.shapeFillColor);
  }

  if (model.isFuncCallStep()) {
    rect = Rect.fromPoints(
        Offset(left + extraWidthForFunctionCallOrIcon / 2, top),
        //bit wider for pdf
        Offset(
          left +
              model.PPP +
              model.calculatedTxtSize.width +
              extraWidthForFunctionCallOrIcon / 2 +
              model.PPP,
          top + model.PPP / 2 + model.calculatedTxtSize.height + model.PPP / 2,
        ));
    drawRect(
      model.parentFlowchart,
      rect,
      theCanvas: theCanvas,
      theLineColor: /*App.repo.currentUser.showColouredShapes*/
          Colors.grey,
      theBgColor: Colors.white, /* thicker: possibleThicker */
    );
  }

//  paintText(
//    theTxt: model.txt,
//    theTxtSize: model.TTT,
//    theCanvas: theCanvas,
//    theOffset: Offset(
//        model.txtOffset.dx,
//        model.MMM),
//    theLineColor: Colors.red[600],
//    theBgColor: Colors.transparent,
//  );

//  if (theCanvas != null && model.isInAMoveSelection())
//    drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//        theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);

//  if (model.isFuncCallStep()) {
//    drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//        theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);
//
//    //    rect = Rect.fromPoints(
////        Offset(model.MMM * 2 + model.PPP, model.MMM),
////        Offset(
////          model.MMM * 2 + model.PPP + model.calculatedTxtSize.widthForPdf*model.zoom + model.PPP*2
//////              + (theG != null ? model.PPP : 0.0),
////          + model.PPP,
////          model.MMM + model.PPP + model.calculatedTxtSize.height*model.zoom + model.PPP,
////        ));
//////    if (theCanvas != null && model.isInAMoveSelection())
//////      drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//////          theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);
////    drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
////        theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);
////
//  }
}

//drawTxtBox2(StepM model,
//    {Canvas theCanvas, PdfGraphics theG, double canvasX:0.0, double canvasY:0.0}) {
//
////  double boxWidth = model.PPP +
////      (model.isFuncCallStep() ? model.PPP : 0) +
////      model.calculatedTxtSize.widthForPdf*model.zoom +
////      model.PPP +
////      (theG != null ? model.PPP : 0.0) +
////      (model.isFuncCallStep() ? model.PPP : 0);
//
//  Rect rect = Rect.fromPoints(
//      Offset(
//          model.MMM * 2,
//          model.MMM),
//      //bit wider for pdf
//      Offset(
//        model.MMM * 2 + model.boxW,
//        model.MMM + model.PPP + model.calculatedTxtSize.height*model.zoom + model.PPP,
//      ));
//
//  drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//      theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);
//
//  if (model.isFuncCallStep()) {
//    rect = Rect.fromPoints(
//        Offset(model.MMM * 2 + model.PPP, model.MMM),
//        Offset(
//          model.MMM * 2 + model.PPP + model.calculatedTxtSize.width*model.zoom + model.PPP*2
////              + (theG != null ? model.PPP : 0.0),
//              + model.PPP,
//          model.MMM + model.PPP + model.calculatedTxtSize.height*model.zoom + model.PPP,
//        ));
//    drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//        theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);
//
//  }
//}

Color _lineColor(StepM model) {
  if (/*App.repo.currentUser.showColouredShapes && */ (model
              .parentStep?.shape ==
          DECISION ||
      model.parentStep?.shape == ASYNC_FUNC_CALL)) {
    return (model.parentListType == TRUE_STEPS ||
            model.parentListType == SUCCEED_STEPS)
        ? Colors.blue
        : Colors.red;
  }
  return Colors.grey;
}

void drawAwaitTxtBox(StepM model, double radius, {required Canvas theCanvas}) {
  Rect rect = Rect.fromPoints(
      Offset(model.MMM * 2, model.MMM),
      //bit wider for pdf
      Offset(
        model.PPP +
            model.MMM * 2 +
            model.PPP +
            model.calculatedTxtSize.width +
            model.PPP * 2 +
            model.PPP * 2,
        model.MMM + model.PPP + model.calculatedTxtSize.height + model.PPP,
      ));

//  if (theCanvas != null && model.isInAMoveSelection())
//    drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//    theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);

  drawRect(model.parentFlowchart, rect,
      theCanvas: theCanvas,
      theLineColor: model.shapeLineColor,
      theBgColor: model.shapeFillColor);
  rect = Rect.fromPoints(
      Offset(model.MMM * 2 + model.PPP + radius * 2 + model.PPP, model.MMM),
      Offset(
        model.MMM * 2 +
            model.PPP +
            model.calculatedTxtSize.width +
            model.PPP * 3 +
            radius * 2 +
            model.PPP,
        model.MMM + model.PPP + model.calculatedTxtSize.height + model.PPP,
      ));
//  if (theCanvas != null && model.isInAMoveSelection())
//    drawRect(model.parentFlowchart, rect, theCanvas: theCanvas, theG: theG, canvasX: canvasX, canvasY: canvasY,
//        theLineColor: model.shapeLineColor, theBgColor: model.shapeFillColor);
  drawRect(model.parentFlowchart, rect,
      theCanvas: theCanvas,
      theLineColor: model.shapeLineColor,
      theBgColor: model.shapeFillColor);
}

void possiblyDrawTopStepConnector(StepM model,
    {required Canvas theCanvas, double canvasX = 0.0, double canvasY = 0.0}) {
  //fco.logger.i('possiblyDrawTopStepConnector - ${_step.stepType} - isFirstStep: ${_step.isFirstStep()} - parentListType: ${_step.parentListType}');
  if (model.isFirstStep() && model.parentListType != ROOT_STEPS) return;

  double y = (model.MMM + model.PPP + model.TTT + model.PPP + model.MMM) / 2;
  drawLine(model.parentFlowchart, Offset(model.MMM, 0.0), Offset(model.MMM, y),
      theCanvas: theCanvas, color: _lineColor(model));
}

void possiblyDrawLeftStepConnector(StepM model,
    {required Canvas theCanvas,
    Paint? thePaint,
    double canvasX = 0.0,
    double canvasY = 0.0}) {
  if (!model.isFirstStep() || model.parentListType == ROOT_STEPS) return;

  double y = (model.MMM + model.PPP + model.TTT + model.PPP + model.MMM) / 2;

  if (model.parentListType == SUCCEED_STEPS && model.isFirstStep()) {
    drawLine(model.parentFlowchart, Offset(0.0, y), Offset(model.MMM * 2, y),
        theCanvas: theCanvas, color: _lineColor(model));
  } else {
    drawLine(model.parentFlowchart, Offset(0.0, y), Offset(model.MMM, y),
        theCanvas: theCanvas, color: _lineColor(model));
  }
}

void drawRightStepConnector(StepM model, {required Canvas theCanvas}) {
  double y = (model.MMM + model.PPP + model.TTT + model.PPP + model.MMM) / 2;
  // colour if parent is a decision or an async func call
  drawLine(
      model.parentFlowchart, Offset(model.MMM, y), Offset(model.MMM * 2, y),
      theCanvas: theCanvas, color: _lineColor(model));
}

void possiblyDrawChildlessStepBottomConnector(StepM model,
    {required Canvas theCanvas}) {
  if (model.parentListType == ROOT_STEPS ||
      (!model.isLastStep() && model.numSiblings() > 0)) {
    double y = (model.MMM + model.PPP + model.TTT + model.PPP + model.MMM) / 2;
    drawLine(model.parentFlowchart, Offset(model.MMM, y),
        Offset(model.MMM, model.boxH),
        theCanvas: theCanvas, color: _lineColor(model));
  }
}

void possiblyDrawLoopOrAsyncActionOrDecisionBottomStepConnector(StepM model,
    {required Canvas theCanvas, double canvasX = 0.0, double canvasY = 0.0}) {
  double y = (model.MMM + model.PPP + model.TTT + model.PPP + model.MMM) / 2;
  //if ((_step.numSiblings() > 0 || _step.parentListType == FUNC_STEPS))
  if (model.parentListType == ROOT_STEPS || !model.isLastStep()) {
    drawLine(model.parentFlowchart, Offset(model.MMM, y),
        Offset(model.MMM, model.height()),
        theCanvas: theCanvas, color: _lineColor(model));
  }
}

double drawDiamondConnector(StepM model, {required Canvas theCanvas}) {
  double x = model.MMM * 2 + model.PPP + model.TTT / 2;
  double y = model.boxH - model.MMM;
  //only show thick line when in colour
  double extra = 0;//*App.repo.currentUser.showColouredShapes*/ false ? 1.0 : 0;
  drawLine(model.parentFlowchart, Offset(x - extra, y),
      Offset(x - extra, y + model.MMM),
      theCanvas: theCanvas, color: Colors.black);
  drawLine(model.parentFlowchart, Offset(x, y), Offset(x, y + model.MMM),
      theCanvas: theCanvas, color: Colors.black);
  drawLine(model.parentFlowchart, Offset(x + extra, y),
      Offset(x + extra, y + model.MMM),
      theCanvas: theCanvas, color: Colors.black);
  return y + model.MMM;
}

void drawElseConector(double from, double to, StepM model,
    {required Canvas theCanvas}) {
  Color color = Colors.grey;
  if (/*App.repo.currentUser.showColouredShapes && */ (model.shape ==
          DECISION ||
      model.shape == ASYNC_FUNC_CALL)) {
    color = Colors.red;
  }

  double x = model.MMM * 2 + model.PPP + model.TTT / 2;
  drawLine(model.parentFlowchart, Offset(x, from), Offset(x, to),
      theCanvas: theCanvas, color: color);
  drawLine(model.parentFlowchart, Offset(x, to),
      Offset(x + model.TTT / 2 + model.PPP, to),
      theCanvas: theCanvas, color: color);
}

// returns bottom of diamond
double drawDecisionDiamond(StepM model,
    {required Canvas theCanvas, double canvasX = 0.0, double canvasY = 0.0}) {
  double x = model.MMM * 2 + model.PPP + model.TTT / 2;
  double y = model.boxH;
  double diamondBottom;

  Path path = Path();
  var points = [
    Offset(x, y),
    Offset(x + model.TTT / 2 + model.PPP, y + model.TTT / 2 + model.PPP),
    Offset(x, diamondBottom = y + model.TTT + model.PPP * 2),
    Offset(x - model.TTT / 2 - model.PPP, y + model.TTT / 2 + model.PPP),
    Offset(x, y),
  ];
  path.addPolygon(points, true);

  theCanvas.drawPath(path, fco.bgPaint(model.shapeFillColor));
  theCanvas.drawPath(path, fco.linePaint(model.shapeLineColor));

  return diamondBottom;
}

double drawCasePolygon(
    double theCaseNameW, double x, double y, String theKey, StepM model,
    {required Canvas theCanvas, String? caseName}) {
  double bottom = y + model.PPP * 2 + model.TTT;

  //polygon
  Path path = Path();
  var points = [
    Offset(x, y),
    Offset(x + theCaseNameW + model.MMM, y),
    Offset(x + theCaseNameW + model.MMM * 2, y + model.PPP + model.TTT / 2),
    Offset(x + theCaseNameW + model.MMM, y + model.PPP * 2 + model.TTT),
    Offset(x + theCaseNameW + model.MMM, bottom),
    Offset(x, bottom),
    Offset(x, y + model.PPP * 2 + model.TTT),
    Offset(x - model.MMM, y + model.PPP + model.TTT / 2),
    Offset(x, y)
  ];
  path.addPolygon(points, true);

  theCanvas.drawPath(path, fco.bgPaint(model.shapeFillColor));
  theCanvas.drawPath(path, fco.linePaint(model.shapeLineColor));
//    if (model.isInAMoveSelection())
//      theCanvas.drawPath(path, highlightPaint);

  return bottom;
}

//double cycleZoomValue(FlowcharterBloc theBloc) {
//  Z -= .1;
//  if (Z < .4) Z = 1.5;
//  return Z;
//}

//double resetZoom() {
//  Z = 1.0;
//  return Z;
//}

//double stepTxtRectH(StepM theStep) {
//  double txtH = theStep?.txtH ?? T;
//  return M + P + txtH + P + M;
//}

// drawPolygon(StepM model, {
//   List<PdfPoint>? pdfPoints,
//   List<Offset>? thePoints,
//   required Canvas theCanvas,
//   PdfGraphics? theG,
//   double canvasX: 0.0,
//   double canvasY: 0.0,
// }) {
//   if (theCanvas != null) {
//     Path path = Path();
//     path.addPolygon(thePoints!, true);
//     theCanvas.drawPath(path, fco.bgPaint(model.shapeFillColor));
//     theCanvas.drawPath(path, fco.linePaint(model.shapeLineColor));
//   } else if (theG != null) {
//     theG.saveContext();
//     // theG.drawPolygon(PdfPolygon(pdfPoints
//     //     .map((PdfPoint p) => PdfPoint(canvasX + p.x, model.parentFlowchart.paperH - (canvasY + p.y)))));
//     theG.restoreContext();
//   } else
//     throw ('drawPolygon - must specify Canvas or PdfGraphics');
// }

//void preservePdfContext(PdfGraphics theG, Function f) {
//  theG.saveContext();
//  f();
//  theG.restoreContext();
//}

void drawCircle(double x, double y, double r,
    {StepM? model,
    required Canvas theCanvas,
    Color? fillColor,
    Color? lineColor}) {
  theCanvas.drawCircle(
      Offset(x, y),
      r,
      fillColor != null
          ? fco.bgPaint(fillColor)
          : fco.bgPaint(model?.shapeFillColor ?? Colors.white));
  theCanvas.drawCircle(
      Offset(x, y),
      r,
      lineColor != null
          ? fco.linePaint(lineColor)
          : fco.linePaint(model?.shapeLineColor ?? Colors.grey));
}

void drawSausage(FlowchartM? theFlowchart, Offset theCentreLeft,
    Offset theCentreRight, double r,
    {required Canvas theCanvas, Paint? thePaint}) {
  Path path = Path();
  if (thePaint!.style == PaintingStyle.fill) {
    // b/g first
    drawArc30To00(theFlowchart, theCentreLeft.dx, theCentreLeft.dy, r,
        thePath: path, theCanvas: theCanvas);
    path.addRect(Rect.fromPoints(
      Offset(theCentreLeft.dx, theCentreRight.dy - r),
      Offset(theCentreRight.dx, theCentreRight.dy + r),
    ));
    drawArc0To30(theFlowchart, theCentreRight.dx, theCentreRight.dy, r,
        thePath: path, theCanvas: theCanvas);
    theCanvas.drawPath(path, thePaint);
  } else {
    // then draw line
    drawArc30To00(theFlowchart, theCentreLeft.dx, theCentreLeft.dy, r,
        thePath: path, theCanvas: theCanvas);
    drawArc0To30(theFlowchart, theCentreRight.dx, theCentreRight.dy, r,
        thePath: path, theCanvas: theCanvas);
    theCanvas.drawLine(Offset(theCentreLeft.dx, theCentreLeft.dy - r),
        Offset(theCentreRight.dx, theCentreLeft.dy - r), thePaint);
    theCanvas.drawLine(Offset(theCentreLeft.dx, theCentreLeft.dy + r),
        Offset(theCentreRight.dx, theCentreRight.dy + r), thePaint);
    theCanvas.drawPath(path, thePaint);
  }
}

void drawArc0To15(FlowchartM? theFlowchart, double x, double y, double r,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawArc(Rect.fromCircle(center: Offset(x, y), radius: r),
      3 * pi / 2, pi / 2, false, fco.linePaint(color));
}

void drawArc15To30(FlowchartM? theFlowchart, double x, double y, double r,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawArc(Rect.fromCircle(center: Offset(x, y), radius: r), 0.0,
      pi / 2, false, fco.linePaint(color));
}

void drawArc30To45(FlowchartM? theFlowchart, double x, double y, double r,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawArc(Rect.fromCircle(center: Offset(x, y), radius: r), pi / 2,
      pi / 2, false, fco.linePaint(color));
}

void drawArc45To00(FlowchartM? theFlowchart, double x, double y, double r,
    {required Canvas theCanvas, Color color = Colors.grey}) {
  theCanvas.drawArc(Rect.fromCircle(center: Offset(x, y), radius: r), pi,
      pi / 2, false, fco.linePaint(color));
}

void drawArc30To00(FlowchartM? theFlowchart, double x, double y, double r,
    {Path? thePath, required Canvas theCanvas, Color color = Colors.grey}) {
  thePath!.addArc(Rect.fromCircle(center: Offset(x, y), radius: r), pi / 2, pi);
}

void drawArc0To30(FlowchartM? theFlowchart, double x, double y, double r,
    {Path? thePath, required Canvas theCanvas, Color color = Colors.grey}) {
  thePath!
      .addArc(Rect.fromCircle(center: Offset(x, y), radius: r), 3 * pi / 2, pi);
}

void drawArc15To45(FlowchartM? theFlowchart, double x, double y, double r,
    {Paint? theLinePaint,
    required Canvas theCanvas,
    Color color = Colors.grey}) {
  theCanvas.drawArc(
    Rect.fromCircle(center: Offset(x, y), radius: r),
    0.0,
    pi,
    false,
    theLinePaint!,
  );
}

const bool SKIP_PDF_COLORS = true;
