import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';

import 'numberic_keypad.dart';


bool isShowingTargetDurationCallout() => Callout.anyPresent(["duration"]);

void removeTargetDurationCallout() {
  if (Callout.anyPresent(["duration"])) {
    debugPrint("removeStartTimeCallout");
    Callout.dismiss("duration");
  }
}

Future<void> showTargetDurationCallout(
  final TargetModel tc, {
  final ScrollController? ancestorHScrollController,
  final ScrollController? ancestorVScrollController,
}) async {
  GlobalKey? targetGK =
  // tc.single
  //     ? FC().getSingleTargetGk(tc.wName)
  //     :
  FContent().getTargetGk(tc.uid);

  Callout.showOverlay(
      targetGkF: () => targetGK,
      boxContentF: (_) => NumericKeypad(
            label: 'onscreen duration (ms)',
            initialValue: tc.calloutDurationMs.toString(),
            onClosedF: (s) {
              tc.calloutDurationMs = int.tryParse(s)??0;
              Callout.dismiss("duration");
            },
          ),
      calloutConfig: CalloutConfig(
        feature: "duration",
        hScrollController: ancestorHScrollController,
        vScrollController: ancestorVScrollController,
        initialTargetAlignment: Alignment.centerRight,
        initialCalloutAlignment: Alignment.centerLeft,
        finalSeparation: 30,
        barrier: CalloutBarrier(
          opacity: 0.1,
          onTappedF: () async {
            removeTargetDurationCallout();
          },
        ),
        arrowType: ArrowType.POINTY,
        modal: true,
        suppliedCalloutW: 400,
        suppliedCalloutH: 450,
        draggable: true,
        fillColor: Colors.purpleAccent,
        // showCloseButton: true,
        // onTopRightButtonPressF: () {
        //   debugPrint("closed");
        // },
        // closeButtonColor: Colors.white,
        scaleTarget: tc.transformScale,
        notUsingHydratedStorage: true,
      ));
}
