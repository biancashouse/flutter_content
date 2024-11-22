import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/algc/model/m/flowchart_m.dart';
import 'package:flutter_content/src/algc/model/m/step_m.dart';
import 'package:flutter_content/src/algc/widgets/painters/flowchart_bg_painter.dart';
import 'package:flutter_content/src/algc/widgets/painters/screen_flowchart_painter.dart';
import 'package:flutter_content/src/algc/widgets/pkg_step_widget.dart';
import 'package:flutter_content/src/algc/widgets/pkg_tappable_comment_btn.dart';

class FlowchartWidget extends StatelessWidget {
  final String jsonString;

  const FlowchartWidget(this.jsonString, {super.key});

  @override
  Widget build(BuildContext context) {
    try {
      FlowchartM f = FlowchartM.fromJsonString(jsonString);

      f.extractComments();

      f.zeroNumStepComments();
      f.isACommentIconPresent = false;

      return FlowchartWidgetStack(f);
    } catch (e) {
      print(e);
      return Error("FlowchartWidget", color: Colors.red, size: 32, errorMsg: e.toString(), key:GlobalKey());
    }
  }
}

class FlowchartWidgetStack extends StatelessWidget {
  final FlowchartM f;

  const FlowchartWidgetStack(this.f, {super.key});

  @override
  Widget build(BuildContext context) {
    fco.logi('FlowchartWidgetStack build');
    double w = FlowchartM.PAGE_VISIBLE_OVERFLOW + f.screenPaperW;
    double h =
        FlowchartM.PAGE_VISIBLE_OVERFLOW * 2 + max(f.height, f.screenPaperH);

    return SizedBox(
      width: w,
      height: h + 8,
      child: Stack(
        children: <Widget>[
          _positionedPageBgPaint(),
          positionedFlowchartPaint(),
          positionedFlowchartBeginText(-1.0),
          // _positionedBeginStepMenuButton(-1.0),
          positionedFlowchartBeginComment(f),
          _positionedFlowchartSteps(f),
          positionedFlowchartEndText(-1.0),
          // _positionedEndStepMenuButton(f, -1.0),
          FutureBuilder(
            future: Future.delayed(Duration.zero),
            builder: (context, snapshot) {
              return positionedFlowchartEndComment(f);
            },
          ),
        ],
      ),
    );
  }

  Widget _positionedPageBgPaint() {
    return Positioned(
      top: 10.0,
      left: 10.0,
      child: CustomPaint(foregroundPainter: FlowchartBgPainter(f)),
    );
  }

  Widget positionedFlowchartPaint() {
    double sumOfFuncStepHeights = f.sumOfHeightsOf(f.steps);
    FlowchartSkeletonPainter funcPainter = FlowchartSkeletonPainter(
      f,
      skipDashedBorder: false,
      higlightBeginStep: false,
      higlightEndStep: false,
    );
    double w = funcPainter.canvasW;
    double h = funcPainter.canvasH(sumOfFuncStepHeights);
    return Positioned(
      top: 0,
      left: 0,
      child: CustomPaint(
        foregroundPainter: funcPainter,
        size: Size(w, h),
      ),
    );
  }

  Widget positionedFlowchartBeginText(double vOffset) {
    double left = f.flowchartOffset.dx + f.beginTxtOverlayL;
    final double padding = f.MMM;

    Widget childW = Text(
      f.beginTxt,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: f.TTT),
    );

    return Positioned(
      top: f.flowchartOffset.dy + f.beginTxtOverlayT - padding,
      left: left - padding,
      width: f.beginTxtW + 20.0 + padding * 2,
      child: Padding(padding: EdgeInsets.all(padding), child: childW),
    );
  }

  Widget positionedFlowchartEndText(double vOffset) {
    final double padding = f.MMM;

    Widget childW = Text(
      f.endTxt,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: f.TTT),
    );

    return Positioned(
        top: vOffset + f.flowchartOffset.dy + f.endTxtOverlayT,
        left: f.flowchartOffset.dx + f.endTxtOverlayL - padding,
        width: f.endTxtW + 10 + padding * 2 /*shit!*/,
        child: childW);
  }

  // Widget _positionedBeginStepMenuButton(double vOffset) {
  //   final double padding = f.MMM;
  //   return Positioned(
  //       top: vOffset + f.flowchartOffset.dy + f.beginTxtOverlayT,
  //       left: f.beginTxtOverlayL + padding,
  //       child: Hotspot(
  //         childKey: f.beginStepGK = GlobalKey(debugLabel: 'begin step'),
  //         cursor: SystemMouseCursors.contextMenu,
  //         containerWidth: f.beginTxtW + padding * 3,
  //         containerHeight: f.beginTxtH,
  //       ));
  // }
  //
  // Widget _positionedEndStepMenuButton(FlowchartM f, double vOffset) {
  //   final double padding = f.MMM;
  //   return Positioned(
  //     top: vOffset + f.flowchartOffset.dy + f.endTxtOverlayT,
  //     left: f.flowchartOffset.dx + f.endTxtOverlayL,
  //     child: Hotspot(
  //       childKey: f.endStepGK = GlobalKey(debugLabel: 'end step'),
  //       cursor: SystemMouseCursors.contextMenu,
  //       containerWidth: f.endTxtW + padding,
  //       containerHeight: f.endTxtH,
  //     ),
  //   );
  // }

  Widget positionedFlowchartBeginComment(FlowchartM f) {
    if (f.beginComment != null) {
      f.isACommentIconPresent = true;
      return Positioned(
        top: f.flowchartOffset.dy + f.beginTxtOverlayT - f.PPP,
        left: f.flowchartOffset.dx +
            f.beginTxtOverlayL +
            f.beginTxtW +
            f.PPP * 2 +
            f.radius +
            40,
        child: Tooltip(
          message: 'tap to scroll comment into view',
          child: TappableCommentBtn(
            flowchart: f,
            isBeginStep: true,
            isEndStep: false,
          ),
        ),
      );
    } else {
      return const Offstage();
    }
  }

  Widget positionedFlowchartEndComment(FlowchartM f) {
    f.isACommentIconPresent = true;
    if (f.endComment != null) {
      return Positioned(
        top: -1 + f.flowchartOffset.dy + f.endTxtOverlayT - f.PPP,
        left: f.flowchartOffset.dx + f.endTxtOverlayL + f.endTxtW + 50,
        child: Tooltip(
          message: 'tap to scroll comment into view',
          child: TappableCommentBtn(
            flowchart: f,
            isBeginStep: false,
            isEndStep: true,
          ),
        ),
      );
    } else {
      return const Offstage();
    }
  }

  Widget _positionedFlowchartSteps(FlowchartM f) {
    //fco.logi('starting _positionedFlowchartSteps');
    // create the child step widgets
    List<PkgStepWidget> columnChildren =
        f.stepsShowingChanges.map((step) => PkgStepWidget(f, step)).toList();

    Widget rootSteps = Positioned(
      left: f.flowchartOffset.dx + f.stepListOffsetLeft(ROOT_STEPS),
      top: f.flowchartOffset.dy + f.stepListOffsetTop(ROOT_STEPS),
      width: f.width,
      height: f.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );
    return rootSteps;
  }
}
