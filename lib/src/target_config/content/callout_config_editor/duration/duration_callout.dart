import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/content/callout_config_editor/duration/numberic_keypad.dart';


bool isShowingTargetDurationCallout() => Callout.anyPresent([CAPI.DURATION_CALLOUT.name]);

void removeTargetDurationCallout() {
  if (Callout.anyPresent([CAPI.DURATION_CALLOUT.name])) {
    print("removeStartTimeCallout");
    Callout.dismiss(CAPI.DURATION_CALLOUT.name);
  }
}

Future<void> showTargetDurationCallout(
  final TargetConfig tc, {
  final ScrollController? ancestorHScrollController,
  final ScrollController? ancestorVScrollController,
}) async {
  GlobalKey? targetGK = tc.single
      ? FC().getSingleTargetGk(tc.wName)
      : FC().getMultiTargetGk(tc.uid.toString());

  Callout.showOverlay(
      targetGkF: () => targetGK,
      boxContentF: (_) => NumericKeypad(
            label: 'onscreen duration (ms)',
            initialValue: tc.calloutDurationMs.toString(),
            onClosedF: (s) {
              CAPIBloC bloc = FC().capiBloc;
              bloc.add(CAPIEvent.targetConfigChanged(newTC: tc..calloutDurationMs = int.tryParse(s)!));
              Callout.dismiss(CAPI.DURATION_CALLOUT.name);
            },
          ),
      calloutConfig: CalloutConfig(
        feature: CAPI.DURATION_CALLOUT.name,
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
        color: Colors.purpleAccent,
        // showCloseButton: true,
        // onTopRightButtonPressF: () {
        //   print("closed");
        // },
        // closeButtonColor: Colors.white,
        scaleTarget: tc.transformScale,
        notUsingHydratedStorage: true,
      ));
}
