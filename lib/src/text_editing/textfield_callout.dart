import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

/// returning false means user tapped the x
void editText2({
  required final String prompt,
  required final Feature feature,
  required final double minHeight,
  required final String originalS,
  required final ValueChanged<String> onTextChangedF,
  final ValueChanged<Size>? onSizeChangeF,
  final ValueChanged<Offset>? onMovedF,
  required final BuildContext context,
  required final TargetKeyFunc targetGK,
  final Widget? dragHandle,
  final Alignment? initialCalloutAlignment = Alignment.topCenter,
  final Alignment? initialTargetAlignment = Alignment.bottomCenter,
  final Offset? initialCalloutOffset,
  final Widget? prefixIcon,
  required final VoidCallback? onDiscardedF,
  required final VoidCallback? onAcceptedF,
  final double? separation,
  final double? width = 400,
  final double? height,
  final bool notUsingHydratedStorage = false,
  final bool noBarrier = false,
  final bool ignoreCalloutResult = false,
  final double targetTranslateX = 0.0,
  final double targetTranslateY = 0.0,
  final bool dontAutoFocus = false,
  final Color? bgColor,
  final TextStyleF? textStyleF,
  final TextAlignF? textAlignF,
}) {
  GlobalKey<FC_TextEditorState> calloutChildGK = GlobalKey<FC_TextEditorState>();

  final FocusNode focusNode = FocusNode();

  // if (Useful.isIOS) {
  //   Useful.afterMsDelayDo(1000, () => CalloutHelper.showCallout(callout: toggleKeyboardSizeCallout2()));
  // }

  // Callout.removeAllOverlays();
  Callout.showOverlay(
      targetGkF: targetGK,
      boxContentF: (ctx) => FC_TextField(
            inputType: String,
            key: calloutChildGK,
            prompt: () => prompt,
            parentFeature: feature,
            originalS: originalS,
            onTextChangedF: onTextChangedF,
            onEditingCompleteF: onTextChangedF,
            prefixIcon: prefixIcon,
            // minHeight: minHeight,
            dontAutoFocus: dontAutoFocus,
            bgColor: bgColor,
            textStyleF: textStyleF,
            textAlignF: textAlignF,
          ),
      calloutConfig: CalloutConfig(
        feature: feature,
        containsTextField: true,
        // focusNode: focusNode,
        barrier: CalloutBarrier(
          opacity: noBarrier ? 0.0 : .25,
          onTappedF: noBarrier
              ? null
              : () async {
                  Callout.removeParentCallout(context);
                  // Callout? parentCallout = feature:Callout.findCallout(feature);
                  // if (parentCallout != null) Callout.removeOverlay(parentCallout.feature, true);
                },
        ),
        // arrowThickness: ArrowThickness.THIN,
        fillColor: Colors.white,
        arrowColor: Colors.red,
        finalSeparation: separation ?? 0.0,
        //developer.log('barrier tapped'),
        // dragHandle: dragHandle,
        initialCalloutAlignment: initialCalloutOffset != null ? null : initialCalloutAlignment,
        initialTargetAlignment: initialCalloutOffset != null ? null : initialTargetAlignment,
        initialCalloutPos: initialCalloutOffset,
        // barrierHasCircularHole: true,
        modal: false,
        suppliedCalloutW: width!,
        suppliedCalloutH: height ?? minHeight + 4,
        minHeight: minHeight + 4,
        resizeableH: true,
        resizeableV: true,
        onDismissedF: () {
          onTextChangedF.call(originalS);
          focusNode.dispose();
        },
        onAcceptedF: () {
          focusNode.dispose();
          onAcceptedF?.call();
        },
        // containsTextField: true,
        onResize: (Size newSize) {
          // calloutChildGK.currentState?.setState(() {});
          onSizeChangeF?.call(newSize);
        },
        onDragF: (Offset newOffset) {
          onMovedF?.call(newOffset);
        },
        targetTranslateX: targetTranslateX,
        targetTranslateY: targetTranslateY,
        draggable: true,
        // color: bgColor,
        notUsingHydratedStorage: notUsingHydratedStorage,
      ));

  // if callout completed with false, revert to original string
  if (!ignoreCalloutResult) {
    if (!dontAutoFocus) {
      Useful.afterMsDelayDo(500, focusNode.requestFocus);
    }
    Callout.showTextToast(
      //context: context,
      feature: "tap-outside-editor-name-toaccept",
      msgText: "tap outside the editor to close it ${Useful.isWeb ? '\nor press <Shift-Return>' : ''}",
      backgroundColor: Colors.purpleAccent,
      textColor: Colors.white,
      gravity: Alignment.topCenter,
      width: 450,
      height: 140,
      onlyOnce: true,
      removeAfterMs: SECS(8),
    );
  }
}
