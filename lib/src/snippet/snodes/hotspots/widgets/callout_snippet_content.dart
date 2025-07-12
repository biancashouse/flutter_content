import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

bool isShowingSnippetCallout(TargetModel tc) => fco.anyPresent([tc.contentCId]);

void hideSnippetContentCallout(TargetModel tc) => fco.hide(tc.contentCId);

void unhideSnippetCallout(TargetModel tc) => fco.unhide(tc.contentCId);

void removeSnippetContentCallout(TargetModel tc, {bool skipOnDismiss = false}) {
  // if (fco.anyPresent([tc.contentCId])) {
  fco.dismiss(tc.contentCId, skipOnDismiss: skipOnDismiss);
  // }
}

void refreshSnippetContentCallout(TargetModel tc) {
  fco.rebuild(tc.contentCId);
}

/// returning false means user tapped the x
Future<void> showSnippetContentCallout({
  required TargetModel tc,
  required bool justPlaying,
  required Rect wrapperRect,
  ScrollControllerName? scName,
}) async {
  // possibly transform before showing callout

  Rect? targetRect =
      fco.getTargetGk(tc.uid)!.globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid]!);

  if (targetRect == null) return;

  // CAPIBloc bloc = FCO.capiBloc;
  // GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
  // bool ignoreBarrierTaps = false;
  double minHeight = 0;
  // int maxLines = 5;
  // TargetModel? tc; // = tc; //FCO.capiBloc.state.tcByNameOrUid(tc);
  // GlobalKey? targetGK() => fco.getTargetGk(tc.uid)!;
  // GlobalKey? gk = CAPIState.gk(tc!.uid);
  // GlobalKey? gk = tc.single ? CAPIState.gk(tc.wName.hashCode) : CAPIState.gk(tc.uid);

  // fco.targetSnippetBeingConfigured = fco.currentSnippet(tc.snippetName);
  // if (fco.targetSnippetBeingConfigured == null) {
  // var rootNode = SnippetTemplateEnum.callout_content.clone();
  // SnippetRootNode newSnippet =
  //     SnippetPanel.createSnippetFromTemplateNodes(rootNode, tc.contentCId);
  // fco.possiblyCacheAndSaveANewSnippetVersion(
  //     snippetName: tc.contentCId, rootNode: newSnippet);
  // fco.targetSnippetBeingConfigured = newSnippet;
  // }
  // snippet may not exist yet
  //  by now should definitely have created the target's snippet
  // if (fco.targetSnippetBeingConfigured != null) {

  Widget content() => SnippetPanel.fromSnippet(
    panelName: tc.contentCId,
    // never used
    snippetName: tc.contentCId,
    scName: scName,
    justPlaying: justPlaying,
    tc: tc,
  );

  Widget editableContent() => Container(
    // width: cc.calloutW,
    // height: cc.calloutH,
    decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid)),
    child: content(),
  );

  Widget possiblyEditableContent() => fco.authenticated.isTrue && !justPlaying ? editableContent() : content();

  final snippetBeingEdited = fco.snippetBeingEdited != null;

  fco.showOverlay(
    targetGkF: () => fco.getTargetGk(tc.uid)!,
    calloutContent: PointerInterceptor(
      child: BlocBuilder<CAPIBloC, CAPIState>(
        builder: (context, state) {
          // return const CircularProgressIndicator();
          var contentWidget = possiblyEditableContent();
          return contentWidget;
        },
      ),
    ),
    calloutConfig: CalloutConfigModel(
      cId: tc.contentCId,
      scrollControllerName: scName,
      // finalSeparation: 50,
      fillColor: tc.calloutFillColor,
      decorationShape: tc.calloutDecorationShape.toDecorationShapeEnum(),
      starPoints: tc.starPoints,
      borderColor: tc.calloutBorderColor ?? ColorModel.grey(),
      borderThickness: tc.calloutBorderThickness,
      borderRadius: tc.calloutBorderRadius,
      arrowColor: tc.calloutFillColor,
      arrowType: tc.hasAHotspot() ? tc.getArrowType() : ArrowTypeEnum.NONE,
      fromDelta: tc.calloutDecorationShape == MappableDecorationShapeEnum.star ? 60 : null,
      animate: tc.animateArrow,
      // https://stackoverflow.com/questions/11671100/scale-path-from-center
      initialCalloutPos: OffsetModel.fromOffset(
        tc.getCalloutPos().translate(1 - tc.getScale(), 1 - tc.getScale()),
        // .translate(translateX, translateY),
      ),
      // initialCalloutAlignment: AlignmentEnum.bottomCenter,
      // initialTargetAlignment: AlignmentEnum.topCenter,
      modal: false,
      initialCalloutW: tc.calloutWidth,
      initialCalloutH: tc.calloutHeight,
      minHeight: minHeight + 4,
      resizeableH: !justPlaying && tc.canResizeH,
      resizeableV: !justPlaying && tc.canResizeV,
      // containsTextField: true,
      // alwaysReCalcSize: true,
      followScroll: tc.followScroll,
      onResizeF: (Size newSize) {
        tc
          ..calloutWidth = newSize.width
          ..calloutHeight = newSize.height;
        // fco.capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
      },
      onDragEndedF: (Offset newPos) {
        if (newPos.dy / fco.scrH != tc.calloutTopPc || newPos.dx / fco.scrW != tc.calloutLeftPc) {
          tc.calloutTopPc = newPos.dy / fco.scrH;
          tc.calloutLeftPc = newPos.dx / fco.scrW;
          tc.changed_saveRootSnippet();
          // fco.capiBloc.add(
          //     CAPIEvent.TargetChanged(newTC: tc, keepTargetsHidden: true));
          // bloc.add(CAPIEvent.changedCalloutPosition(tc: tc, newPos: newPos));
          // tc.setTextCalloutPos(newPos);
        }
      },
      draggable: !justPlaying,
      scaleTarget: tc.transformScale,
      // separation: 100,
      // barrierOpacity: .1,
      // onBarrierTappedF: () async {
      //   onBarrierTappedF?.call();
      //   fco.removeOverlay(feature);
      // },
      notUsingHydratedStorage: true,
      // showCloseButton: true,
      // onTopRightButtonPressF: (){
      //     onBarrierTappedF?.call();
      //     fco.removeOverlay(feature);
      // }
      onDismissedF: () {
        // FCO.parentTW(twName)?.zoomer?.resetTransform();
        // fco.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
        fco.dismiss(CalloutConfigToolbar.CID);
      },
      barrier:
          tc.hasAHotspot() && !snippetBeingEdited
              ? CalloutBarrierConfig(
                color: Colors.black,
                opacity: .9,
                excludeTargetFromBarrier: true,
                roundExclusion: true,
                cutoutPadding: 30,
                dismissible: false,
                // onTappedF: () {
                //   // do not allow content callout to be dismissed
                //   return;
                //   fco.dismiss(CalloutConfigToolbar.CID);
                //   if (tc.hasAHotspot()) {
                //     tc.targetsWrapperState()?.refresh(() {
                //       tc
                //           .targetsWrapperState()
                //           ?.zoomer
                //           ?.resetTransform(
                //           afterTransformF: () {
                //             // tc.changed_saveRootSnippet();
                //             SNode.showAllTargetBtns();
                //             SNode.showAllHotspotTargetCovers();
                //             // fco.currentPageState?.unhideFAB();
                //             removeSnippetContentCallout(tc);
                //             fco.afterNextBuildDo(() {
                //               // save hotspot's parent snippet
                //               var rootNode =
                //               tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
                //               if (rootNode != null) {
                //                 fco.cacheAndSaveANewSnippetVersion(
                //                   snippetName: rootNode.name,
                //                   rootNode: rootNode,
                //                 );
                //               }
                //             });
                //           });
                //     });
                //   } else {
                //     tc.targetsWrapperState()?.refresh(() {
                //       // tc.changed_saveRootSnippet();
                //       SNode.showAllTargetBtns();
                //       SNode.showAllHotspotTargetCovers();
                //       removeSnippetContentCallout(tc);
                //       fco.afterNextBuildDo(() {
                //         // save parent snippet
                //         var rootNode =
                //         tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
                //         if (rootNode != null) {
                //           fco.cacheAndSaveANewSnippetVersion(
                //             snippetName: rootNode.name,
                //             rootNode: rootNode,
                //           );
                //         }
                //       });
                //     });
                //   }
                // }
              )
              : null,
      frameTarget: false,
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
//           alignment: AlignmentEnum.topRight,
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
//     // initialCalloutAlignment: AlignmentEnum.bottomCenter,
//     // initialTargetAlignment: AlignmentEnum.topCenter,
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
