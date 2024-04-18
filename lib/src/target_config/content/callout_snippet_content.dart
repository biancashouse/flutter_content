import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

bool isShowingSnippetCallout(String snippetName) =>
    Callout.anyPresent([snippetName]);

void hideSnippetCallout(String snippetName) => Callout.hide(snippetName);

void unhideSnippetCallout(String snippetName) => Callout.unhide(snippetName);

void removeSnippetContentCallout(String snippetName) {
  if (Callout.anyPresent([snippetName])) {
    Callout.dismiss(snippetName);
  }
}

/// returning false means user tapped the x
Future<void> showSnippetContentCallout({
  required TargetModel tc,
  required bool justPlaying,
}) async {
  // possibly transform before showing callout
  TargetsWrapperState? parentTW = tc.targetsWrapperState;

  Rect? wrapperRect = (parentTW?.widget.key as GlobalKey)
      .globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
  Rect? targetRect = FC()
      .getMultiTargetGk(tc.uid.toString())!
      .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()]!);

  if (wrapperRect == null || targetRect == null) return;

  // CAPIBloc bloc = FlutterContent().capiBloc;
  // GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
  // bool ignoreBarrierTaps = false;
  double minHeight = 0;
  // int maxLines = 5;
  // TargetModel? tc; // = tc; //FlutterContent().capiBloc.state.tcByNameOrUid(tc);
  GlobalKey? targetGK() => FC().getMultiTargetGk(tc.uid.toString())!;
  // GlobalKey? gk = CAPIState.gk(tc!.uid);
  // GlobalKey? gk = tc.single ? CAPIState.gk(tc.wName.hashCode) : CAPIState.gk(tc.uid);
  Feature feature = tc.snippetName;
  FC().targetSnippetBeingConfigured =
      await FC().rootNodeOfEditingSnippet(tc.snippetName);
  if (FC().targetSnippetBeingConfigured == null) {
    SnippetRootNode newSnippet = SnippetPanel.createSnippetFromTemplate(
        SnippetTemplate.target_content_widget, tc.snippetName);
    VersionId initialVersionId =
        DateTime.now().millisecondsSinceEpoch.toString();
    FC().addToSnippetCache(
      snippetName: tc.snippetName,
      rootNode: newSnippet,
      versionId: initialVersionId,
      // editing: true,
    );
    FC().targetSnippetBeingConfigured = newSnippet;
  }
  // snipper may not exist yet
  //  by now should definitely have created the target's snippet
  if (FC().targetSnippetBeingConfigured != null) {
    Callout.showOverlay(
      // zoomer: zoomer,
      targetGkF: targetGK,
      boxContentF: (boxCtx) => PointerInterceptor(
        child: BlocBuilder<CAPIBloC, CAPIState>(
          builder: (context, state) {
            return FC().targetSnippetBeingConfigured!.toWidget(context, null);
          },
        ),
      ),
      calloutConfig: CalloutConfig(
        feature: feature,
        // hScrollController: ancestorHScrollController,
        // vScrollController: ancestorVScrollController,
        scale: tc.transformScale,
        // barrierOpacity: 0.1,
        fillColor: tc.calloutColor(),
        decorationShape: tc.calloutDecorationShape,
        borderColor: Color(tc.calloutBorderColorValue ?? Colors.grey.value),
        borderThickness: tc.calloutBorderThickness,
        borderRadius: tc.calloutBorderRadius,
        arrowColor: tc.calloutColor(),
        arrowType: tc.getArrowType(),
        fromDelta:
            tc.calloutDecorationShape == DecorationShapeEnum.star ? 60 : null,
        animate: tc.animateArrow,
        initialCalloutPos: tc.getCalloutPos(),
        // initialCalloutAlignment: Alignment.bottomCenter,
        // initialTargetAlignment: Alignment.topCenter,
        modal: false,
        suppliedCalloutW: tc.calloutWidth,
        suppliedCalloutH: tc.calloutHeight,
        minHeight: minHeight + 4,
        resizeableH: !justPlaying && tc.canResizeH,
        resizeableV: !justPlaying && tc.canResizeV,
        // containsTextField: true,
        // alwaysReCalcSize: true,
        onResize: (Size newSize) {
          tc
            ..calloutWidth = newSize.width
            ..calloutHeight = newSize.height;
          // FC().capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
        },
        onDragEndedF: (Offset newPos) {
          if (newPos.dy / Useful.scrH != tc.calloutTopPc ||
              newPos.dx / Useful.scrW != tc.calloutLeftPc) {
            tc.calloutTopPc = newPos.dy / Useful.scrH;
            tc.calloutLeftPc = newPos.dx / Useful.scrW;
            FC().capiBloc.add(
                CAPIEvent.TargetChanged(newTC: tc, keepTargetsHidden: true));
            // bloc.add(CAPIEvent.changedCalloutPosition(tc: tc, newPos: newPos));
            // tc.setTextCalloutPos(newPos);
          }
        },
        draggable: true,
        // frameTarget: true,
        scaleTarget: tc.transformScale,
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
        onDismissedF: () {
          // FC().parentTW(twName)?.zoomer?.resetTransform();
          // FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
        },
      ),
      // configurableTarget: (kDebugMode && !justPlaying) ? tc : null,
      removeAfterMs: justPlaying ? tc.calloutDurationMs : null,
    );

    // explainPopupsAreDraggable();
  }
}

// void showHelpContentPlayCallout(
//   final TargetModel tc,
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
