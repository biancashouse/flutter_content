import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/alignment_model.dart';
import 'package:flutter_content/src/model/size_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration_shape.dart';

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
void showHotspotSnippetContentCallout({
  required TargetModel tc,
  required bool justPlaying,
  required TargetsWrapperState wrapperState,
}) {
  // possibly transform before showing callout

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

  Widget content() => SnippetBuilder(
    snippetName: tc.contentCId,
    templateSnippet: SnippetRootNode(
      name: tc.contentCId,
      child: PlaceholderNode(),
    ),
    justPlaying: justPlaying,
    tc: tc,
  );

  Widget editableContent() => Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: Colors.purpleAccent,
        style: BorderStyle.solid,
      ),
    ),
    child: content(),
  );

  Widget possiblyEditableContent() =>
      fco.canEditContent() && !justPlaying ? editableContent() : content();

  final snippetBeingEdited = fco.snippetBeingEdited != null;

  // globalPaintBounds() returns the correctly scaled topLeft, but the
  // rect width and height are the unscaled values!
  Rect? targetRectGlobal = tc.gk?.globalPaintBounds();
  if (targetRectGlobal == null) return;

  // scale the dimensions
  Rect scaledTargetRect = Rect.fromLTWH(
    targetRectGlobal.left,
    targetRectGlobal.top,
    (targetRectGlobal.width) * tc.getScale(wrapperState),
    (targetRectGlobal.height) * tc.getScale(wrapperState),
  );

  late CalloutConfig cc;
  cc = CalloutConfig(
    cId: tc.contentCId,

    decorationFillColors: tc.calloutFillColors?.getColorOrGradient(),
    decorationShape: tc.calloutDecorationShapeEnum?.decorationShape,
    decorationStarPoints: tc.starPoints,
    decorationBorderColors: tc.calloutBorderColors?.getColorOrGradient(),
    decorationBorderThickness: tc.calloutBorderThickness,
    decorationBorderRadius: tc.calloutBorderRadius,
    bubbleOrTargetPointerColor: tc.bgColor(),
    targetPointerType: tc.targetPointerTypeEnum?.targetPointerType,
    fromDelta: tc.calloutDecorationShapeEnum == DecorationShapeEnum.star
        ? 60
        : null,
    animatePointer: tc.animatePointer,
    // lineLabelBuilder: () => fco.coloredText(
    //   '${tc.tcAlignment?.toStringAsFixed(2)}',
    //   color: Colors.red,
    // ),
    // https://stackoverflow.com/questions/11671100/scale-path-from-center
    // initialCalloutPos: initialPosScrollAware,
    initialTargetAlignment: Alignment(
      tc.tcAlignment?.x ?? 0.0,
      tc.tcAlignment?.y ?? 0.0,
    ),
    initialCalloutAlignment: -Alignment(
      tc.tcAlignment?.x ?? 0.0,
      tc.tcAlignment?.y ?? 0.0,
    ),
    initialCalloutPos: wrapperState.translateForScroll(
      getRelativeCalloutTopLeft(
        // targetRect: inflateRectByFactor_fromCenter(tc.gk!.globalPaintBounds()!, tc.getScale(wrapperState)),
        targetRect: scaledTargetRect,
        calloutRect: Rect.fromLTWH(
          0,
          0,
          tc.calloutSize!.width,
          tc.calloutSize!.height,
        ),
        alignment: tc.tcAlignment!,
      ),
    ),
    initialCalloutW: tc.calloutSize?.width,
    initialCalloutH: tc.calloutSize?.height,
    minHeight: minHeight + 4,
    resizeableH: !justPlaying && tc.canResizeH,
    resizeableV: !justPlaying && tc.canResizeV,
    followScroll: tc.followScroll,
    onResizeF: (Size newSize) {
      tc.calloutSize = SizeModel(newSize.width, newSize.height);
      tc.changed_saveRootSnippet(
        wrapperState.widget.parentNode.rootNodeOfSnippet(),
      );
    },
    onDragF: (Offset newPos) {
      // tc.tcAlignment = AlignmentModel(cc.targetAlignment!.x, cc.targetAlignment!.y);
    },
    onDragEndedF: (Offset newPos) {
      if (justPlaying) return;
      // update the targetAlignment
      final Rect calloutRectGlobal = Rect.fromLTWH(
        newPos.dx,
        newPos.dy,
        tc.calloutSize!.width,
        tc.calloutSize!.height,
      );

      // calc alignment that positions the callout at its final separation
      var targetRect = cc.tR();
      Alignment newAlignment = targetRect.pointToAlignment(
        calloutRectGlobal.center.translate(-targetRect.left, -targetRect.top),
      );
      tc.setAlignment(AlignmentModel(newAlignment.x, newAlignment.y));
      CalloutConfigToolbar.closeThenReopenContentCallout(tc, wrapperState);
    },
    draggable: true || !justPlaying,
    scaleTarget: tc.transformScale,
    // separation: 100,
    // barrierOpacity: .1,
    // onBarrierTappedF: () async {
    //   onBarrierTappedF?.call();
    //   fco.removeOverlay(feature);
    // },
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
    barrier: tc.hasAHotspot() && !snippetBeingEdited
        ? CalloutBarrierConfig(
            color: Colors.black,
            opacity: .8,
            excludeTargetFromBarrier: true,
            roundExclusion: true,
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
  );

  // show callout for configured duration, unless:
  // no hotspot: show forever (until a signed-in editor taps)
  int? durationMs;
  if (tc.hasAHotspot() && justPlaying) {
    durationMs = tc.calloutDurationMs;
  }

  //)
  fco.showOverlay(
    // isHotspotCallout: true,
    // skipOnScreenCheck: justPlaying,
    targetGK: tc.gk,
    calloutContent: BlocBuilder<CAPIBloC, CAPIState>(
      builder: (context, state) => possiblyEditableContent(),
    ),
    calloutConfig: cc,
    // configurableTarget: (kDebugMode && !justPlaying) ? tc : null,
    removeAfterMs: durationMs,
    onReadyF: () {},
  );

  // explainPopupsAreDraggable();
  // }
}

// /// Inflates a [Rect] from its center by a given percentage factor.
// /// (Alternative and clearer implementation)
// Rect inflateRectByFactor_fromCenter(Rect rect, double factor) {
//   return Rect.fromCenter(
//     center: rect.center,
//     width: rect.width * factor,
//     height: rect.height * factor,
//   );
// }

/// Calculates the top-left Offset of a calloutRect relative to the targetRect's origin.
///
/// This function determines where the calloutRect should be placed such that its
/// center is aligned with a specific point on the targetRect, as defined by
/// the [alignment] parameter.
///
/// - [targetRect]: The rectangle that serves as the anchor point.
/// - [calloutRect]: The rectangle that needs to be positioned.
/// - [alignment]: The alignment that describes where the center of the calloutRect
///   should be placed relative to the targetRect. For example, Alignment.topCenter
///   places the callout's center at the top-center point of the targetRect.
///
/// Returns an [Offset] representing the `calloutRect.topLeft` in the `targetRect`'s
/// local coordinate system.
Offset getRelativeCalloutTopLeft({
  required Rect targetRect,
  required Rect calloutRect,
  required Alignment alignment,
}) {
  // 1. Find the target point on the targetRect based on the alignment.
  // This point is where the calloutRect's center should be.
  // The 'withinRect' method calculates this point in the targetRect's local coordinates.
  final Offset targetPoint = alignment.withinRect(targetRect);

  // 2. Calculate the position of the callout's center to align it with the target point.
  // This is simply the targetPoint itself.
  final Offset calloutCenter = targetPoint;

  // 3. Determine the top-left corner of the calloutRect based on its center position.
  // We subtract half of the callout's width and height from its center point.
  final double calloutTopLeftX = calloutCenter.dx - calloutRect.width / 2;
  final double calloutTopLeftY = calloutCenter.dy - calloutRect.height / 2;

  // 4. Return the calculated top-left offset.
  print('getRelativeCalloutTopLeft: $calloutTopLeftX, $calloutTopLeftY');
  return Offset(calloutTopLeftX, calloutTopLeftY);
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
//           alignment: AlignmentEnumModel.topRight,
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
