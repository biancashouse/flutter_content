import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

bool isShowingSnippetCallout(TargetModel tc) =>
    Callout.anyPresent([tc.uid.toString()]);

void hideSnippetCallout(TargetModel tc) => Callout.hide(tc.uid.toString());

void unhideSnippetCallout(TargetModel tc) => Callout.unhide(tc.uid.toString());

void removeSnippetContentCallout(TargetModel tc) {
  // if (Callout.anyPresent([tc.uid.toString()])) {
  Callout.dismiss(tc.uid.toString());
  // }
}

void refreshSnippetContentCallout(TargetModel tc) {
  Callout.rebuild(tc.uid.toString());
}

/// returning false means user tapped the x
Future<void> showSnippetContentCallout({
  required TargetModel tc,
  required bool justPlaying,
  required Rect wrapperRect,
  ScrollController? ancestorHScrollController,
  ScrollController? ancestorVScrollController,
}) async {
  // possibly transform before showing callout

  Rect? targetRect = fco
      .getTargetGk(tc.uid)!
      .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid]!);

  if (targetRect == null) return;

  // CAPIBloc bloc = FCO.capiBloc;
  // GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
  // bool ignoreBarrierTaps = false;
  double minHeight = 0;
  // int maxLines = 5;
  // TargetModel? tc; // = tc; //FCO.capiBloc.state.tcByNameOrUid(tc);
  GlobalKey? targetGK() => fco.getTargetGk(tc.uid)!;
  // GlobalKey? gk = CAPIState.gk(tc!.uid);
  // GlobalKey? gk = tc.single ? CAPIState.gk(tc.wName.hashCode) : CAPIState.gk(tc.uid);
  Feature feature = tc.uid.toString();
  String snippetName = feature;

  // var snippet = fco.snippetInfoCache[tc.snippetName];
  // fco.targetSnippetBeingConfigured = fco.currentSnippet(tc.snippetName);
  // if (fco.targetSnippetBeingConfigured == null) {
  // var rootNode = SnippetTemplateEnum.callout_content.clone();
  // SnippetRootNode newSnippet =
  //     SnippetPanel.createSnippetFromTemplateNodes(rootNode, tc.uid.toString());
  // fco.possiblyCacheAndSaveANewSnippetVersion(
  //     snippetName: tc.uid.toString(), rootNode: newSnippet);
  // fco.targetSnippetBeingConfigured = newSnippet;
  // }
  // snippet may not exist yet
  //  by now should definitely have created the target's snippet
  // if (fco.targetSnippetBeingConfigured != null) {

  Widget content() => SnippetPanel.fromSnippet(
      panelName: tc.uid.toString(), // never used
      snippetName: tc.uid.toString());

  Callout.showOverlay(
    // zoomer: zoomer,
    targetGkF: targetGK,
    calloutContent: PointerInterceptor(
      child: BlocBuilder<CAPIBloC, CAPIState>(
        builder: (context, state) {
          // return const CircularProgressIndicator();
          var contentWidget = content();
          return contentWidget;
        },
      ),
    ),
    calloutConfig: CalloutConfig(
      cId: feature,
      // hScrollController: ancestorHScrollController,
      // vScrollController: ancestorVScrollController,
      // scale: tc.transformScale,
      // barrierOpacity: 0.1,
      fillColor: tc.calloutColor(),
      decorationShape: tc.calloutDecorationShape.toDecorationShapeEnum(),
      borderColor: Color(tc.calloutBorderColorValue ?? Colors.grey.value),
      borderThickness: tc.calloutBorderThickness,
      borderRadius: tc.calloutBorderRadius,
      arrowColor: tc.calloutColor(),
      arrowType: tc.getArrowType(),
      fromDelta: tc.calloutDecorationShape == MappableDecorationShapeEnum.star
          ? 60
          : null,
      animate: tc.animateArrow,
      initialCalloutPos: tc.getCalloutPos(),
      // initialCalloutAlignment: Alignment.bottomCenter,
      // initialTargetAlignment: Alignment.topCenter,
      modal: false,
      initialCalloutW: tc.calloutWidth,
      initialCalloutH: tc.calloutHeight,
      minHeight: minHeight + 4,
      resizeableH: !justPlaying && tc.canResizeH,
      resizeableV: !justPlaying && tc.canResizeV,
      // containsTextField: true,
      // alwaysReCalcSize: true,
      onResizeF: (Size newSize) {
        tc
          ..calloutWidth = newSize.width
          ..calloutHeight = newSize.height;
        // FlutterContentApp.capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
      },
      onDragEndedF: (Offset newPos) {
        if (newPos.dy / fco.scrH != tc.calloutTopPc ||
            newPos.dx / fco.scrW != tc.calloutLeftPc) {
          tc.calloutTopPc = newPos.dy / fco.scrH;
          tc.calloutLeftPc = newPos.dx / fco.scrW;
          tc.changed_saveRootSnippet();
          // FlutterContentApp.capiBloc.add(
          //     CAPIEvent.TargetChanged(newTC: tc, keepTargetsHidden: true));
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
        // FCO.parentTW(twName)?.zoomer?.resetTransform();
        // FlutterContentApp.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
      },
    ),
    // configurableTarget: (kDebugMode && !justPlaying) ? tc : null,
    removeAfterMs: justPlaying ? tc.calloutDurationMs : null,
  );

  // explainPopupsAreDraggable();
  // }
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
//     cId: feature,
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
//       fco.afterMsDelayDo(500, tc.textFocusNode().requestFocus);
//     },
//   );
//
//   explainPopupsAreDraggable();
// }
