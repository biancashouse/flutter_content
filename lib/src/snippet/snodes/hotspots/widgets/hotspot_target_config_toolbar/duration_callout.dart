import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/base_target_model.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';

import 'numeric_keypad.dart';

bool isShowingTargetDurationCallout() => fco.anyPresent(["duration"]);

void removeTargetDurationCallout() {
  if (fco.anyPresent(["duration"])) {
    fco.logger.i("removeStartTimeCallout");
    fco.dismiss("duration");
  }
}

Future<void> showTargetDurationCallout({
  required TargetConfigModel tc,
  void Function(QuillTargetModel)? onTargetConfigChange,
}) async {
  fco.showOverlay(
    // targetGK: targetGK,
    calloutContent: NumericKeypad(
      label: 'onscreen duration (ms)',
      initialValue: tc.calloutDurationMs.toString(),
      onClosedF: (s) {
        tc.calloutDurationMs = int.tryParse(s) ?? 0;
        // only used by quill embeds
        onTargetConfigChange?.call(tc as QuillTargetModel);
        fco.dismiss("duration");
      },
    ),
    calloutConfig: CalloutConfig(
      cId: "duration",
      initialTargetAlignment: Alignment.centerRight,
      initialCalloutAlignment: Alignment.centerLeft,
      // finalSeparation: 30,
      barrier: CalloutBarrierConfig(
        opacity: 0.1,
        onTappedF: () async {
          removeTargetDurationCallout();
        },
      ),
      targetPointerType: TargetPointerType.bubble(),
      initialCalloutW: 400,
      initialCalloutH: 450,
      draggable: true,
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      // showCloseButton: true,
      // onTopRightButtonPressF: () {
      //   fco.logger.i("closed");
      // },
      // closeButtonColor: Colors.white,
      scaleTarget: tc.transformScale,
    ),
  );
}
