import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';
import 'package:flutter_content/src/algc/widgets/painters/paint_helper.dart';

class StepPainter extends CustomPainter with WidgetHelperMixin {
  final StepM model;
  final bool isSelected;

  StepPainter(this.model, {this.isSelected = false});

  @override
  void paint(Canvas canvas, Size size) {
    double x;
    double y;
    double radius;

    //fco.logger.i('*** PAINT ${_step.stepType} - ${_step.key} ***');

    if (model.parentListType == SUCCEED_STEPS) {
//      List<StepM> parentSteps = _step.getParentList();
      //fco.logger.i('parent steps: ${parentSteps.length}');
    }

    switch (model.shape) {
      case ACTION:
        drawTxtBox(model, theCanvas: canvas, isSelected: isSelected);
        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        possiblyDrawChildlessStepBottomConnector(model, theCanvas: canvas);
        break;
      case DECISION:
        drawTxtBox(model, theCanvas: canvas, isSelected: isSelected);
        drawDiamondConnector(model, theCanvas: canvas);
        double diamondBottom = drawDecisionDiamond(model, theCanvas: canvas);

        // else
        List<StepM>? fSteps = model.stepListOf(FALSE_STEPS);
        if (fSteps.isNotEmpty) {
//          double colH = BLOC.sumOfHeightsOf(_step.stepListOf(TRUE_STEPS));
          double endsAt = model.parentFlowchart
                  .stepListOffsetTop(FALSE_STEPS, theStep: model) +
              model.MMM +
              model.PPP +
              model.TTT / 2;
          drawElseConector(diamondBottom, endsAt, model, theCanvas: canvas);
        }

        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        possiblyDrawLoopOrAsyncActionOrDecisionBottomStepConnector(model,
            theCanvas: canvas);
        break;
      case LOOP:
        drawTxtBox(model, theCanvas: canvas, isSelected: isSelected);

        // loop
        x = model.MMM * 2 + model.PPP;
        y = model.boxH - model.MMM;
        radius = model.PPP + model.TTT / 2;
        // shorten loop depth if no children
        bool noLoopChildren = model.childStepList(LOOP_STEPS).isEmpty;
          drawLine(model.parentFlowchart, Offset(x, y),
              Offset(x, noLoopChildren ? y + 10 : y + model.boxMinH - radius),
              theCanvas: canvas,
              color: Colors.grey);
          drawLine(
              model.parentFlowchart,
              Offset(x + model.PPP + model.TTT + model.PPP, y),
              Offset(x + model.PPP + model.TTT + model.PPP,
                  noLoopChildren ? y + 10 : y + model.boxMinH - radius),
              theCanvas: canvas,
              color: Colors.grey);
          drawArc15To45(model.parentFlowchart, x + radius,
              noLoopChildren ? y + 10 : y + model.boxMinH - radius, radius,
              theCanvas: canvas,
              theLinePaint: linePaint(
                  Colors.grey));
        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        possiblyDrawLoopOrAsyncActionOrDecisionBottomStepConnector(model,
            theCanvas: canvas);
        break;
      case FUNC_RETURN:
        x = model.MMM * 2;
        y = model.MMM + model.PPP + model.TTT / 2;
        radius = model.PPP + model.TTT / 2;

        double w = model.calculatedTxtSize.width;
        double txtW = w;

        Offset sausageLeftCentre = Offset(x + radius, y);
        Offset sausageRightCentre =
            Offset(x + radius + model.PPP + txtW + model.PPP, y);

        drawSausage(model.parentFlowchart, sausageLeftCentre,
            sausageRightCentre, radius,
            theCanvas: canvas, thePaint: bgPaint(model.shapeFillColor));
        drawSausage(model.parentFlowchart, sausageLeftCentre,
            sausageRightCentre, radius,
            theCanvas: canvas, thePaint: linePaint(model.shapeLineColor));
//
//        Path path = new Path();
//
//        drawArc30To45(
//            x + radius, y,
//            radius,
//            thePath:path, theCanvas: canvas);
//        drawArc45To00(
//            x + radius, model.MMM + model.PPP + model.TTT / 2,
//            radius,
//            thePath:path, theCanvas: canvas);
//        drawArc0To15(x + radius + model.PPP + model.calculatedTxtSize.widthForScreen +
//            model.PPP,
//            model.MMM + model.PPP + model.TTT / 2, radius,
//            thePath:path, theCanvas: canvas);
//        drawArc15To30(x + radius + model.PPP + model.calculatedTxtSize.widthForScreen +
//            model.PPP,
//            model.MMM + model.PPP + model.TTT / 2, radius,
//            thePath:path, theCanvas: canvas);
//
//        drawLine(Offset(x + model.MMM, model.MMM),
//            Offset(x + radius + model.PPP + model.calculatedTxtSize.widthForScreen +
//                model.PPP, model.MMM),
//            model:model, theCanvas: canvas);
//        drawLine(
//            Offset(x + model.MMM,
//                model.MMM + model.PPP + model.TTT +
//                    model.PPP),
//            Offset(x + radius + model.PPP + model.calculatedTxtSize.widthForScreen +
//                model.PPP,
//                model.MMM + model.PPP + model.TTT +
//                    model.PPP),
//            model:model, theCanvas: canvas);
//
//        path.close();
//        canvas.drawPath(path, bgPaint(model.shapeFillColor));

        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);

        break;
      case FUNC_CALL:
        drawTxtBox(model, theCanvas: canvas, isSelected: isSelected);

        // icon will be rendered where the decision diamond would appear

        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        double x = model.MMM * 2 + model.PPP + model.TTT / 2;
        double y = model.boxH - model.MMM;
//        if ((model.parentListType == ROOT_STEPS && !model.isLastStep())
//            || (model.parentFlowchart.showingAdders
//                || model.childStepListShowingChanges(FUNC_CALL_STEPS).length > 0))
        if (model.childStepListShowingChanges(FUNC_CALL_STEPS).isNotEmpty) {
          drawLine(
            model.parentFlowchart,
            Offset(x, y),
            Offset(x, y + model.MMM * 2),
            theCanvas: canvas,
          );
        }
        possiblyDrawLoopOrAsyncActionOrDecisionBottomStepConnector(model,
            theCanvas: canvas);
        break;
      case ASYNC_FUNC_CALL:
//        List<StepM> parentSteps = _step.getParentList();

        drawTxtBox(model, theCanvas: canvas, isSelected: isSelected);

        x = model.MMM * 2 + model.PPP + model.TTT / 2;
        double y = model.boxH - model.MMM;
        double iconTop = y + model.MMM;
        drawLine(model.parentFlowchart, Offset(x, y + 1), Offset(x, iconTop),
            theCanvas: canvas, color: Colors.grey);

        //draw clock icon
        double radius = model.PPP + model.TTT / 2;
        y = iconTop + radius;
        drawCircle(x, y, radius, theCanvas: canvas, model: model);

        drawLine(model.parentFlowchart, Offset(x, y),
            Offset(x, y - model.TTT / 2 - model.PPP / 3),
            theCanvas: canvas, color: Colors.grey);
        drawLine(model.parentFlowchart, Offset(x, y),
            Offset(x + model.TTT / 3 + model.PPP / 3, y + model.TTT / 5),
            theCanvas: canvas, color: Colors.grey);

        // else
        List<StepM>? fSteps = model.stepListOf(FAIL_STEPS);
        if (fSteps.isNotEmpty) {
//          double colH = BLOC.sumOfHeightsOf(_step.stepListOf(SUCCEED_STEPS));
          double endsAt = model.parentFlowchart
                  .stepListOffsetTop(FAIL_STEPS, theStep: model) +
              model.MMM +
              model.PPP +
              model.TTT / 2;
          drawElseConector(y + radius, endsAt, model, theCanvas: canvas);
        }

        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        possiblyDrawLoopOrAsyncActionOrDecisionBottomStepConnector(model,
            theCanvas: canvas);
        break;
      case AWAIT_FUNC_CALL:
        double radius = (model.PPP + model.TTT / 2) * .6;
        drawAwaitTxtBox(model, radius, theCanvas: canvas);

        //draw clock icon
        x = model.MMM * 2 + model.PPP + radius;
        y = model.MMM +
            (model.PPP + model.calculatedTxtSize.height + model.PPP) / 2;
        drawCircle(x, y, radius, theCanvas: canvas, model: model);

        drawLine(
            model.parentFlowchart, Offset(x, y), Offset(x, y - radius * 2 / 3),
            theCanvas: canvas, color: Colors.grey);
        drawLine(model.parentFlowchart, Offset(x, y),
            Offset(x + radius * 2 / 3, y + model.TTT / 5),
            theCanvas: canvas, color: Colors.grey);

        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        possiblyDrawChildlessStepBottomConnector(model, theCanvas: canvas);
        break;
      case STEP_ADDER:
      case STEP_MOVER:
        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
//        if (!isAStepSelected()) {
//          if (model.parentListType == NEW_CASE_STEPS)
//            ;//drawRightNewCaseInserterConnector(canvas);
//          else
//            drawRightMover(canvas);
//        }
        possiblyDrawChildlessStepBottomConnector(model, theCanvas: canvas);
        break;
      case SWITCH:
        drawTxtBox(model, theCanvas: canvas, isSelected: isSelected);

        // one case diamond for each child list
        y = model.boxH - model.MMM;
        double x = model.MMM * 2 + model.PPP + model.TTT / 2;

        model.childStepLists.forEach((String key, List<StepM>? steps) {
          double? corrCaseW = model.getCaseNameW(key);
          double caseH = max(model.boxH,
              model.parentFlowchart.sumOfHeightsOf(model.childStepList(key)));

          drawLine(
              model.parentFlowchart, Offset(x, y), Offset(x, y + model.MMM),
              theCanvas: canvas);

          double diamondBottom;

          if (key == NEW_CASE_STEPS) {
            // new case filled in green
            diamondBottom =
                _drawNewCasePolygon(canvas, corrCaseW, x, y + model.MMM, key);
          } else {
            diamondBottom = drawCasePolygon(
                corrCaseW, x, y + model.MMM, key, model,
                theCanvas: canvas);
          }

          double listHeight = caseH;

          if (model.childStepLists.keys.last !=
              key /* && _step.childStepLists.keys.first != key */) {
            drawLine(
                model.parentFlowchart,
                Offset(x, diamondBottom),
                Offset(
                    x,
                    listHeight +
                        diamondBottom +
                        model.MMM +
                        model.PPP -
                        model.boxMinH),
                theCanvas: canvas);
          }
          y += (caseH);
        });

        possiblyDrawTopStepConnector(model, theCanvas: canvas);
        possiblyDrawLeftStepConnector(model, theCanvas: canvas);
        drawRightStepConnector(model, theCanvas: canvas);
        possiblyDrawLoopOrAsyncActionOrDecisionBottomStepConnector(model,
            theCanvas: canvas);
        break;
      default:
        break;
    }
  }

// void pdfPaintStepIconImage(PdfGraphics theG, PdfDocument thePdfDoc) {
//   if (model.iconIndex < 1) return;
//
//   // List<AdderMenuEnum> enums = AdderMenuEnum.values;
//   // String iconImagePath = stepIcons[enums[11+model.iconIndex]];
//   // ByteData imageData = iconImages[iconImagePath];
//   // Uint8List uintList = imageData.buffer.asUint8List();
//
//   // final PdfImage assetImage = await pdfImageFromImageProvider(
//   //   pdf: pdf.document,
//   //   image: const AssetImage('images/devices.jpg'),
//   // );
//
//   // final image = PdfImage(
//   //   thePdfDoc,
//   //   image: freezeFrame,
//   //   width: 32,
//   //   height: 32,
//   // );
//
//   double top = model.txtOffset.dy + model.MMM - model.PPP / 2;
//   if (model.shape == AWAIT_FUNC_CALL) top += model.PPP / 2;
//   double left = model.txtOffset.dx;
//
//   theG.drawImage(image, left, top);
// }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

//  drawRightMover(Canvas theCanvas) {
//      theCanvas.drawLine(Offset(model.clipboard.MMM * 3, model.boxH / 2), Offset(model.clipboard.MMM * 4, model.clipboard.MMM * 1.25), moverPaint);
//      theCanvas.drawLine(Offset(model.clipboard.MMM * 3, model.boxH / 2), Offset(model.clipboard.MMM * 6, model.clipboard.MMM * 1.75), moverPaint);
//      theCanvas.drawLine(Offset(model.clipboard.MMM * 3, model.boxH / 2), Offset(model.clipboard.MMM * 4, model.clipboard.MMM * 2.5), moverPaint);
//  }

//  _drawRightNewCaseInserterConnector(Canvas theCanvas) {
//    theCanvas.drawLine(
//        Offset(0.0, model.boxH / 2), Offset(model.clipboard.MMM * 6, model.clipboard.MMM * 1.75), greenPaint);
//  }

  double _drawNewCasePolygon(Canvas theCanvas, double theCaseNameW, double x,
      double y, String theKey) {
    double bottom = y + model.PPP * 2 + model.TTT;

    //polygon
    Path path = Path();
    var points = [
      Offset(x, y),
      Offset(x + theCaseNameW + model.MMM, y),
      Offset(x + theCaseNameW + model.MMM, y),
      Offset(x + theCaseNameW + model.MMM * 2, y + model.PPP + model.TTT / 2),
      Offset(x + theCaseNameW + model.MMM * 2, y + model.PPP + model.TTT / 2),
      Offset(x + theCaseNameW + model.MMM, y + model.PPP * 2 + model.TTT),
      Offset(x + theCaseNameW + model.MMM, bottom),
      Offset(x, bottom),
      Offset(x, y + model.PPP * 2 + model.TTT),
      Offset(x - model.MMM, y + model.PPP + model.TTT / 2),
      Offset(x - model.MMM, y + model.PPP + model.TTT / 2),
      Offset(x, y)
    ];
    path.addPolygon(points, true);
    theCanvas.drawPath(path, linePaint(model.shapeLineColor));
    theCanvas.drawPath(path, greenBgPaint);

    // new case filled in green

    //cross midpoint
    x = x + (theCaseNameW + model.MMM) / 2;
    y = y + model.PPP + model.TTT / 2;
    theCanvas.drawLine(
        Offset(x - 10, y), Offset(x + 10, y), linePaint(Colors.white));
    theCanvas.drawLine(
        Offset(x, y - 10), Offset(x, y + 10), linePaint(Colors.white));

    return bottom;
  }
}
