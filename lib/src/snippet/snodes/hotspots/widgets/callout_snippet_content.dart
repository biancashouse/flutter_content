import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/alignment_model.dart';
import 'package:flutter_content/src/model/size_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration_shape.dart';

/// Calculates the alignment of the center of [other] relative to [target].
Alignment _getAlignmentBetweenRects(Rect target, Rect other) {
  // The point for pointToAlignment needs to be relative to the target's top-left corner.
  final Offset relativeCenter = other.center - target.topLeft;
  return target.pointToAlignment(relativeCenter);
}

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
  Rect? targetRect = tc.gk?.globalPaintBounds();
  if (targetRect == null) return;

  Rect targetRectGlobal = wrapperState.translateRectForScroll(targetRect);

  Offset initialCalloutPos = calculateCalloutTopLeft(
    // targetRect: inflateRectByFactor_fromCenter(tc.gk!.globalPaintBounds()!, tc.getScale(wrapperState)),
    targetRect: targetRect,
    calloutRect: Rect.fromLTWH(
      0,
      0,
      tc.calloutSize!.width,
      tc.calloutSize!.height,
    ),
    alignment: tc.tcAlignment!,
  );

  Offset initialCalloutPosSA = wrapperState.translateOffsetForScroll(
    initialCalloutPos,
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
    // targetPointerType: !tc.hasAHotspot() ? TargetPointerType.none(): tc.targetPointerTypeEnum?.targetPointerType,
    targetPointerType: tc.targetPointerTypeEnum?.targetPointerType,
    fromDelta:
        tc.calloutDecorationShapeEnum == DecorationShapeEnum.star &&
            tc.hasAHotspot()
        ? 60
        : null,
    animatePointer: tc.animatePointer,
    // lineLabelBuilder: () => fco.coloredText(
    //   '${tc.tcAlignment?.toStringAsFixed(2)}',
    //   color: Colors.red,
    // ),
    // https://stackoverflow.com/questions/11671100/scale-path-from-center
    // initialCalloutPos: initialPosScrollAware,
    // initialTargetAlignment: Alignment(
    //   tc.tcAlignment?.x ?? 0.0,
    //   tc.tcAlignment?.y ?? 0.0,
    // ),
    // initialCalloutAlignment: -Alignment(
    //   tc.tcAlignment?.x ?? 0.0,
    //   tc.tcAlignment?.y ?? 0.0,
    // ),
    initialCalloutPos: initialCalloutPosSA,
    initialCalloutW: tc.calloutSize?.width,
    initialCalloutH: tc.calloutSize?.height,
    minHeight: minHeight + 4,
    resizeableH: !justPlaying && tc.canResizeH,
    resizeableV: !justPlaying && tc.canResizeV,
    followScroll: tc.followScroll,
    onResizeF: (Size newSize) {
      tc.calloutSize = SizeModel(newSize.width, newSize.height);
    },
    onDragF: (Offset newPos) {
      // tc.tcAlignment = AlignmentModel(cc.targetAlignment!.x, cc.targetAlignment!.y);
    },
    onDragEndedF: (Offset newPos) {
      if ((justPlaying && tc.hasAHotspot()) || !fco.canEditContent()) return;

      // update the targetAlignment
      final Rect calloutRect = Rect.fromLTWH(
        newPos.dx,
        newPos.dy,
        tc.calloutSize!.width,
        tc.calloutSize!.height,
      );

      // calc alignment that positions the callout at its final separation

      var scrollDirection = wrapperState.scrollDirection;
      double scrollOffset = wrapperState.sc?.offset ?? 0.0;

      var targetRectSA = wrapperState.translateRectForScroll(targetRect);

      // var calloutRectSA = wrapperState.translateRectForScroll(calloutRect);

      Alignment newAlignment = _getAlignmentBetweenRects(
        targetRectSA,
        calloutRect,
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
      builder: (context, state) =>
          MouseInfoViewer(child: possiblyEditableContent()),
    ),
    calloutConfig: cc,
    // configurableTarget: (kDebugMode && !justPlaying) ? tc : null,
    removeAfterMs: durationMs ?? 0,
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

/// Calculates the top-left [Offset] for a [calloutRect] to position it
/// relative to a [targetRect] based on a given [alignment].
///
/// The function finds the point on the [targetRect] specified by the [alignment]
/// and then calculates the top-left position for the [calloutRect] so that
/// its center is at that point.
Offset calculateCalloutTopLeft({
  required Rect targetRect,
  required Rect calloutRect,
  required Alignment alignment,
}) {
  // 1. Find the target point on the targetRect based on the alignment.
  final Offset anchorPoint = alignment.withinRect(targetRect);

  // 2. Calculate the top-left for the calloutRect so its center is at the anchorPoint.
  return Offset(
    anchorPoint.dx - calloutRect.width / 2,
    anchorPoint.dy - calloutRect.height / 2,
  );
}

/// Calculates the top-left Offset for a callout, ensuring it remains visible on screen.
///
/// This function determines where the calloutRect should be placed such that its
/// center is aligned with a specific point on the targetRect, as defined by
/// the [alignment] parameter. It then adjusts this position to prevent the
/// callout from appearing off-screen.
///
/// - [targetRect]: The rectangle that serves as the anchor point, in global coordinates.
/// - [calloutRect]: The rectangle that needs to be positioned.
/// - [alignment]: The alignment that describes where the center of the calloutRect
///   should be placed relative to the targetRect. For example, Alignment.topCenter
///   places the callout's center at the top-center point of the targetRect.
///
/// Returns an [Offset] representing the callout's adjusted top-left position in
/// global coordinates.
Offset getRelativeCalloutTopLeft({
  required Rect targetRect,
  required Rect calloutRect,
  required Alignment alignment,
}) {
  // 1. Calculate the true intersection point on the targetRect's border,
  //    respecting alignments outside the [-1, 1] range.
  final Offset targetPoint = _getIntersectionOnBorder(targetRect, alignment);

  // 2. Calculate the ideal top-left corner of the calloutRect based on its center position.
  final double idealX = targetPoint.dx - calloutRect.width / 2;
  final double idealY = targetPoint.dy - calloutRect.height / 2;

  // 3. Get screen dimensions and define a padding.
  final screenWidth = fco.scrW;
  final screenHeight = fco.scrH;
  const screenPadding = 8.0;

  // 4. Adjust the position to keep the callout on screen, applying padding.
  // This ensures the entire callout is visible.
  final double adjustedX = idealX.clamp(
    screenPadding,
    screenWidth - calloutRect.width - screenPadding,
  );
  final double adjustedY = idealY.clamp(
    screenPadding,
    screenHeight - calloutRect.height - screenPadding,
  );

  // 5. Return the calculated and adjusted top-left offset.
  return Offset(adjustedX, adjustedY);
}

/// Calculates the intersection point of a line, defined by the rectangle's
/// center and an alignment, with the rectangle's border. This correctly
/// handles alignments where x or y are outside the [-1, 1] range.
Offset _getIntersectionOnBorder(Rect rect, Alignment alignment) {
  // The line starts at the center of the rectangle.
  final center = rect.center;

  // And it goes towards the point defined by the alignment, which may be outside the rect.
  final targetPoint = alignment.withinRect(rect);

  // If the alignment point is already strictly inside the rect, no intersection calculation is needed.
  // Note: We check abs() < 1.0 to handle cases exactly on the border.
  if (alignment.x.abs() < 1.0 && alignment.y.abs() < 1.0) {
    return targetPoint;
  }

  // Vector from the center to the target point.
  final dx = targetPoint.dx - center.dx;
  final dy = targetPoint.dy - center.dy;

  // If dx or dy is zero, the point is already on a border axis.
  if (dx == 0 || dy == 0) {
    return targetPoint;
  }

  double t = double.maxFinite;

  // Calculate the 't' parameter for the line equation P = center + t * (direction)
  // for each of the four rectangle boundaries. We want the smallest positive t.
  if (dx.abs() > 0) {
    // Check intersection with vertical boundaries (left and right)
    // t = (boundary - origin) / direction
    if (dx > 0) {
      // Right edge
      t = min(t, (rect.right - center.dx) / dx);
    } else {
      // Left edge
      t = min(t, (rect.left - center.dx) / dx);
    }
  }

  if (dy.abs() > 0) {
    // Check intersection with horizontal boundaries (top and bottom)
    if (dy > 0) {
      // Bottom edge
      t = min(t, (rect.bottom - center.dy) / dy);
    } else {
      // Top edge
      t = min(t, (rect.top - center.dy) / dy);
    }
  }

  // The intersection point is the center plus the scaled direction vector.
  return center + Offset(dx, dy) * t;
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
//     // i
