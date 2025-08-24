import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

import 'numberic_keypad.dart';


bool isShowingTargetDurationCallout() => fco.anyPresent(["duration"]);

void removeTargetDurationCallout() {
  if (fco.anyPresent(["duration"])) {
    fco.logger.i("removeStartTimeCallout");
    fco.dismiss("duration");
  }
}

Future<void> showTargetDurationCallout(
  final TargetModel tc, {
  final ScrollControllerName? scName,
}) async {
  GlobalKey? targetGK =
  // tc.single
  //     ? FCO.getSingleTargetGk(tc.wName)
  //     :
  fco.getTargetGk(tc.uid);

  fco.showOverlay(
      targetGkF: () => targetGK,
      calloutContent: NumericKeypad(
            label: 'onscreen duration (ms)',
            initialValue: tc.calloutDurationMs.toString(),
            onClosedF: (s) {
              tc.calloutDurationMs = int.tryParse(s)??0;
              SnippetRootNode? rootNode = tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
              if (rootNode == null) return;
              fco.saveNewVersion(snippet: rootNode);
              fco.dismiss("duration");
            },
          ),
      calloutConfig: CalloutConfigModel(
        cId: "duration",
        scrollControllerName: scName,
        initialTargetAlignment: AlignmentEnum.centerRight,
        initialCalloutAlignment: AlignmentEnum.centerLeft,
        finalSeparation: 30,
        barrier: CalloutBarrierConfig(
          opacity: 0.1,
          onTappedF: () async {
            removeTargetDurationCallout();
          },
        ),
        arrowType: ArrowTypeEnum.POINTY,
        initialCalloutW: 400,
        initialCalloutH: 450,
        draggable: true,
        fillColor: ColorModel.purpleAccent(),
        // showCloseButton: true,
        // onTopRightButtonPressF: () {
        //   fco.logger.i("closed");
        // },
        // closeButtonColor: Colors.white,
        scaleTarget: tc.transformScale,
        notUsingHydratedStorage: true,
      ));
}
