import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';
import 'package:flutter_content/src/algc/widgets/painters/step_painter.dart';
import 'package:flutter_content/src/algc/widgets/pkg_tappable_comment_btn.dart';

import 'step_text.dart';

class PkgStepWidget extends StatelessWidget {
  final FlowchartM flowchart;
  final StepM step;

  const PkgStepWidget(this.flowchart, this.step);

  double get extraWidthForFunctionCall =>
      step.isFuncCallStep() ? step.PPP * 2 : 0.0;

  double get awaitOffset => (step.shape == AWAIT_FUNC_CALL ? step.MMM * 2 : 0);

  // needs theStep for calc pos of false and fail child lists
  Positioned positionedColumnOfSteps(
      BuildContext context, String theListType, StepM theStep) {
    FlowchartM parentFlowchart = theStep.parentFlowchart;
    var widestStepW =
        parentFlowchart.widestStep(theStep.childStepList(theListType));
    var columnChildren = createChildStepWidgetsOf(theListType, theStep);

    return Positioned(
      left: parentFlowchart.stepListOffsetLeft(theListType, theStep: step),
      top: parentFlowchart.stepListOffsetTop(theListType, theStep: theStep),
      child: Stack(
        children: [
          SizedBox(
            width: widestStepW,
            height: parentFlowchart
                .sumOfHeightsOf(theStep.childStepList(theListType)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnChildren),
          ),
          if (theListType == TRUE_STEPS)
            Positioned(
                top: 10,
                left: widestStepW - 20,
                child: Text(
                  'T',
                  style: TextStyle(color: Colors.grey),
                )),
          if (theListType == FALSE_STEPS)
            Positioned(
                top: 10,
                left: widestStepW - 20,
                child: Text('F', style: TextStyle(color: Colors.grey))),
          if (theListType == SUCCEED_STEPS)
            Positioned(
                top: 10,
                left: widestStepW - 20,
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.grey,
                )),
          if (theListType == FAIL_STEPS)
            Positioned(
                top: 10,
                left: widestStepW - 20,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.grey,
                )),
        ],
      ),
    );
  }

  Positioned positionedEmptySpace(String theType, StepM theStep) {
    FlowchartM parentFlowchart = theStep.parentFlowchart;
    return Positioned(
      left: parentFlowchart.stepListOffsetLeft(theType, theStep: step),
      top: parentFlowchart.stepListOffsetTop(theType, theStep: theStep),
      child: fco.boxedStep(
          theColor: Colors.blue,
          width: 10.0,
          height: step.MMM * 2 + step.PPP * 2 + step.TTT,
          theChild: SizedBox(
            width: 10.0,
            height: step.MMM * 2 + step.PPP * 2 + step.TTT,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    widgets.add(CustomPaint(
      painter: StepPainter(step),
    ));

    // txt display only - allow for padding in pos
    if (step.shape != STEP_ADDER &&
        step.shape != CASE_ADDER &&
        step.shape != STEP_MOVER) {
      final double padding = step.PPP;

      double posTop = step.txtOffset.dy - step.PPP;
      if (step.shape == AWAIT_FUNC_CALL) posTop += step.PPP / 2;
      double posLeft = step.txtOffset.dx - padding;

      double iconOffset = step.iconIndex > 0 ? ICON_IMAGE_SIZE : 0;

      widgets.add(
        Positioned(
          top: posTop - step.PPP / 2,
          left: posLeft + iconOffset + (iconOffset > 0 ? step.PPP : 0),
          child: Padding(
            padding: EdgeInsets.only(
              left: step.PPP,
              top: step.PPP,
              bottom: step.PPP,
              right: step.MMM,
            ),
            // only use a PMB when not showing movers or adders
            child: StepText(step),
          ),
        ),
      );

      if (step.comment != null) {
        double commentTop = step.txtOffset.dy - step.MMM + step.PPP / 2;
        double extraWidthForFunctionCall =
            step.isFuncCallStep() ? step.PPP * 2 : 0.0;
        double commentLeft = step.MMM * 3 +
            step.PPP * 2 +
            (step.calculatedTxtSize.width + extraWidthForFunctionCall) +
            20;
        if (step.shape == AWAIT_FUNC_CALL || step.shape == FUNC_RETURN) {
          commentLeft += step.MMM * 2;
        }
        flowchart.isACommentIconPresent = true;
        if (step.iconIndex > 0) commentLeft += ICON_IMAGE_SIZE + 20;
        widgets.add(
          Positioned(
            top: commentTop,
            left: commentLeft,
            child: Tooltip(
              message: 'tap to scroll comment into view',
              child: TappableCommentBtn(
                flowchart: flowchart,
                isBeginStep: false,
                isEndStep: false,
                step: step,
              ),
            ),
          ),
        );
      }
    }

    switch (step.shape) {
      case DECISION:
        if (step.childStepListShowingChanges(TRUE_STEPS).isNotEmpty) {
          widgets.add(positionedColumnOfSteps(context, TRUE_STEPS, step));
        } else {
          widgets.add(positionedEmptySpace(TRUE_STEPS, step));
        }
        if (step.childStepListShowingChanges(FALSE_STEPS).isNotEmpty) {
          widgets.add(positionedColumnOfSteps(context, FALSE_STEPS, step));
        } else {
          widgets.add(positionedEmptySpace(FALSE_STEPS, step));
        }
        break;
      case FUNC_CALL:
        if (step.childStepListShowingChanges(FUNC_CALL_STEPS).isNotEmpty) {
          widgets.add(positionedColumnOfSteps(context, FUNC_CALL_STEPS, step));
        }
        break;
      case LOOP:
        //fco.logi('loop with key: ${model.key} with ${loopStepListOf(model).length} children');
        if (step.childStepListShowingChanges(LOOP_STEPS).isNotEmpty) {
          widgets.add(positionedColumnOfSteps(context, LOOP_STEPS, step));
        }
        break;
      case ASYNC_FUNC_CALL:
        if (step.childStepListShowingChanges(SUCCEED_STEPS).isNotEmpty) {
          widgets.add(positionedColumnOfSteps(context, SUCCEED_STEPS, step));
        } else {
          widgets.add(positionedEmptySpace(TRUE_STEPS, step));
        }

        if (step.childStepListShowingChanges(FAIL_STEPS).isNotEmpty) {
          widgets.add(positionedColumnOfSteps(context, FAIL_STEPS, step));
        } else {
          widgets.add(positionedEmptySpace(FAIL_STEPS, step));
        }
        break;
      case SWITCH:
        for (var theKey in step.caseNames) {
          if (step.childStepListShowingChanges(theKey).isNotEmpty) {
            widgets.add(positionedColumnOfSteps(context, theKey, step));
          }
        }
        break;
      case ACTION:
      case AWAIT_FUNC_CALL:
      default:
      //no children
    }

    return SizedBox(
      width: step.width(),
      height: step.height(),
      child: Stack(
        children: widgets,
      ),
    );
  }

  List<PkgStepWidget> createChildStepWidgetsOf(
      final String theChildListType, final StepM theStep) {
    List<StepM>? stepList =
        theStep.childStepListShowingChanges(theChildListType);
    if (stepList.isEmpty) fco.logi('empty childList! *******');
    if (stepList.isNotEmpty) {
      List<PkgStepWidget> stepWidgets = stepList
          .map((step) => PkgStepWidget(
                step.parentFlowchart,
                step,
              ))
          .toList();
//    fco.logi(stepWidgets[0].runtimeType.toString());
      return stepWidgets;
    }
    return [];
  }

  static Widget commentNumberWidget(int index, {bool bigger = false}) {
    return Container(
      padding: EdgeInsets.all(bigger
          ? 10
          : index < 10
              ? 6.0
              : 4.0),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: CircleBorder(
          side: BorderSide(color: Colors.grey),
        ),
      ),
      child: Text('${index > -1 ? index : ""}',
          style: TextStyle(color: Colors.white, fontSize: bigger ? 12 : 10.0)),
    );
  }

  static bool stepFound = false;
  static double savedScrollOffset = 0.0;
  static const double PREVIEW_CANVAS_LEFT_OFFSET = 30.0;
}
