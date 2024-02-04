import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/overlays/callouts/callout_config.dart';
import 'package:flutter_content/src/overlays/callouts/callout_config_toolbar.dart';
import 'package:get_it/get_it.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

bool isShowingSnippetCallout(String snippetName) => Callout.anyPresent([snippetName]);

void hideSnippetCallout(String snippetName) => Callout.hide(snippetName);

void unhideSnippetCallout(String snippetName) => Callout.unhide(snippetName);

void removeSnippetContentCallout(String snippetName) {
  if (Callout.anyPresent([snippetName])) {
    Callout.dismiss(snippetName);
  }
}

void reshowSnippetContentCallout(TargetConfig selectedTC, allowButtonCallouts, justPlaying, onDiscardedF) {
  removeSnippetContentCallout(selectedTC.snippetName);
  Useful.afterMsDelayDo(500, () {
    showSnippetContentCallout(
      initialTC: selectedTC,
      snippetName: selectedTC.snippetName,
      allowButtonCallouts: allowButtonCallouts,
      justPlaying: justPlaying,
      onDiscardedF: onDiscardedF,
    );
  });
}

/// returning false means user tapped the x
void showSnippetContentCallout({
  required TargetConfig initialTC,
  required String snippetName,
  required bool justPlaying,
  required bool allowButtonCallouts,
  required VoidCallback onDiscardedF,
}
    // final ScrollController? ancestorHScrollController,
    // final ScrollController? ancestorVScrollController,
    ) {
  // CAPIBloc bloc = CAPIBloc.I;
  // GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
  // bool ignoreBarrierTaps = false;
  double minHeight = 0;
  // int maxLines = 5;
  // TargetConfig? initialTC; // = initialTC; //CAPIBloc.I.state.tcByNameOrUid(initialTC);
  GlobalKey? targetGK() => initialTC.single
      ? GetIt.I.get<GKMap>(instanceName: getIt_singleTargets)[initialTC.wName]
      : GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[initialTC.uid.toString()];
  // GlobalKey? gk = CAPIState.gk(tc!.uid);
  // GlobalKey? gk = tc.single ? CAPIState.gk(tc.wName.hashCode) : CAPIState.gk(tc.uid);
  Feature feature = snippetName;
  print("single target callout feature: $feature");
  Callout.showOverlay(
    targetGkF: targetGK,
    boxContentF: (_) => PointerInterceptor(
      child: BlocBuilder<CAPIBloC, CAPIState>(
        builder: (context, state) {
          return SnippetPanel(
            panelName: feature,
            snippetName: snippetName,
            allowButtonCallouts: allowButtonCallouts,
          );
        },
      ),
    ),
    calloutConfig: CalloutConfig(
      feature: feature,
      // hScrollController: ancestorHScrollController,
      // vScrollController: ancestorVScrollController,
      scale: initialTC.transformScale,
      // barrierOpacity: 0.1,
      color: initialTC.calloutColor(),
      arrowColor: initialTC.calloutColor(),
      arrowType: initialTC.getArrowType(),
      animate: initialTC.animateArrow,
      initialCalloutPos: initialTC.getCalloutPos(),
      // initialCalloutAlignment: Alignment.bottomCenter,
      // initialTargetAlignment: Alignment.topCenter,
      modal: false,
      suppliedCalloutW: initialTC.calloutWidth,
      suppliedCalloutH: initialTC.calloutHeight + CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(initialTC),
      minHeight: minHeight + 4,
      resizeableH: true,
      resizeableV: true,
      // containsTextField: true,
      // alwaysReCalcSize: true,
      onResize: (Size newSize) {
        initialTC
          ..calloutWidth = newSize.width
          ..calloutHeight = newSize.height - CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(initialTC);
        CAPIBloC.I.add(CAPIEvent.targetConfigChanged(newTC: initialTC));
      },
      onDragEndedF: (Offset newPos) {
        if (newPos.dy / Useful.scrH != initialTC.calloutTopPc || newPos.dx / Useful.scrW != initialTC.calloutLeftPc) {
          initialTC.calloutTopPc = newPos.dy / Useful.scrH;
          initialTC.calloutLeftPc = newPos.dx / Useful.scrW;
          CAPIBloC.I.add(CAPIEvent.targetConfigChanged(newTC: initialTC, keepTargetsHidden: true));
          // bloc.add(CAPIEvent.changedCalloutPosition(tc: tc, newPos: newPos));
          // tc.setTextCalloutPos(newPos);
        }
      },
      draggable: true,
      // frameTarget: true,
      scaleTarget: initialTC.transformScale,
      roundedCorners: 16,
      // separation: 100,
      // barrierOpacity: .1,
      // onBarrierTappedF: () async {
      //   onBarrierTappedF?.call();
      //   Callout.removeOverlay(feature);
      // },
      notUsingHydratedStorage: true,
      // showCloseButton: true,
      // onTopRightButtonPressF: (){
      //     onBarrierTappedF?.call();
      //     Callout.removeOverlay(feature);
      // }
      onDismissedF: onDiscardedF,
    ),
    configurableTarget: (kDebugMode && !justPlaying) ? initialTC : null,
    removeAfterMs: initialTC.calloutDurationMs,
  );
  // explainPopupsAreDraggable();
}

// void showHelpContentPlayCallout(
//   final TargetConfig tc,
//   final ScrollController? ancestorHScrollController,
//   final ScrollController? ancestorVScrollController,
// ) {
//   GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
//   int feature = CAPI.HELP_CONTENT_CALLOUT.name;
//   double minHeight = 0;
//   int maxLines = 5;
//
//   // calc most suitable alignment
//
//   Callout txtEditorCallout = Callout(
//     feature: feature,
//     containsTextField: true,
//     hScrollController: ancestorHScrollController,
//     vScrollController: ancestorVScrollController,
//     focusNode: tc.textFocusNode(),
//     targetGKF: () => tc.gk(),
//     scale: tc.transformScale,
//     contents: () => Stack(
//       children: [
//         Center(child: Text('abc')),
//         Align(
//           alignment: Alignment.topRight,
//           child: IconButton(icon: Icon(Icons.edit), iconSize: 40, onPressed: () {}),
//         ),
//       ],
//     ),
//     barrierOpacity: 0.0,
//     color: tc.calloutColor(),
//     arrowColor: tc.calloutColor(),
//     arrowType: tc.getArrowType(),
//     animate: tc.animateArrow,
//     initialCalloutPos: tc.getTextCalloutPos(),
//     // initialCalloutAlignment: Alignment.bottomCenter,
//     // initialTargetAlignment: Alignment.topCenter,
//     modal: false,
//     width: tc.calloutWidth,
//     height: tc.calloutHeight,
//     minHeight: minHeight + 4,
//     resizeableH: true,
//     resizeableV: true,
//     draggable: true,
//     scaleTarget: tc.transformScale,
//     roundedCorners: 16,
//     // separation: 50,
//   );
//
//   txtEditorCallout.show(
//     notUsingHydratedStorage: true,
//     onReadyF: () {
//       Useful.afterMsDelayDo(500, tc.textFocusNode().requestFocus);
//     },
//   );
//
//   explainPopupsAreDraggable();
// }
