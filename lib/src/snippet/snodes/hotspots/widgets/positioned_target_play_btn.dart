import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetPlayBtn extends StatelessWidget {
  final TargetModel tc;
  final int index;
  final TargetsWrapperState wrapperState;

  const TargetPlayBtn({
    required this.tc,
    required this.index,
    required this.wrapperState,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var snippetBeingEdited = fco.snippetBeingEdited;

    bool toolbarPresent = fco.anyPresent([
      CalloutConfigToolbar.CID,
    ], includeHidden: true);

    bool isVisible = snippetBeingEdited == null && !toolbarPresent;

    return Visibility(
      visible: isVisible,
      child: _draggableTargetBtn(context, tc, toolbarPresent),
    );
  }

  Widget _draggableTargetBtn(BuildContext context, TargetModel tc, bool toolbarPresent) {
    return !fco.canEditContent()
        ? GestureDetector(
            onTap: () {
              wrapperState.widget.parentNode.playList.toList()
                ..clear()
                ..add(tc);
              playTarget(context, tc, wrapperState);
            },
            child: IntegerCircleAvatar(
              tc,
              num: index + 1,
              bgColor:
                  tc.calloutFillColors?.color1?.flutterValue ?? Colors.black,
              //tc.calloutFillColor!.decorationShapeEnum,
              radius: TargetModel.DEFAULT_BTN_RADIUS,
              fontSize: 14,
            ),
          )
        : Draggable<(TargetId, bool)>(
            data: (tc.uid, true),
            childWhenDragging: const Offstage(),
            feedback: toolbarPresent
                ? const Offstage()
                : IntegerCircleAvatar(
                    tc,
                    num: index + 1,
                    bgColor: tc.bgColor(),
                    radius: TargetModel.DEFAULT_BTN_RADIUS,
                    fontSize: 14,
                  ),
             child: DoubleTappable(
              onTap: () {
                if (fco.snippetBeingEdited != null) {
                  return;
                }

                final playList = wrapperState.widget.parentNode.playList
                    .toList();
                playList.add(tc);
                playTarget(context, tc, wrapperState);
              },
              onDoubleTap: () {
                if (fco.snippetBeingEdited != null) return;
                wrapperState.setPlayingOrEditingTc(
                  tc,
                  () =>
                      TargetsWrapper.configureTarget(context, tc, wrapperState),
                );
              },
              child: IntegerCircleAvatar(
                tc,
                num: index + 1,
                bgColor: tc.bgColor(),
                radius: TargetModel.DEFAULT_BTN_RADIUS,
                fontSize: 14,
              ),
            ),
          );
  }

  // static void configureTarget(
  //     TargetModel tc,
  //     Rect wrapperRect,
  //     ScrollController? ancestorHScrollController,
  //     ScrollController? ancestorVScrollController,
  //     {bool quickly = false}) {
  //   if (!fco.canEditContent) return;
  //
  //   if (tc.targetsWrapperState() == null) return;
  //
  //   var coverGK = fco.getTargetGk(tc.uid);
  //   Rect? targetRect = coverGK!.globalPaintBounds();
  //   if (targetRect == null) return;
  //
  //   Alignment? ta =
  //       fco.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
  //
  //   tc.targetsWrapperState()?.zoomer?.applyTransform(
  //       tc.transformScale, tc.transformScale, ta, afterTransformF: () {
  //     showSnippetContentCallout(
  //       tc: tc,
  //       justPlaying: false,
  //       wrapperRect: wrapperRect,
  //       ancestorHScrollController: ancestorHScrollController,
  //       ancestorVScrollController: ancestorVScrollController,
  //     );
  //     // show config toolbar in a toast
  //     tc.targetsWrapperState()!.setPlayingOrEditingTc(tc);
  //     showConfigToolbar(tc, wrapperRect);
  //
  //      fco.currentPageState?.hideFAB();
  //
  //   }, quickly: quickly);
  // }

  static void playTarget(
    BuildContext context,
    TargetModel tc,
    TargetsWrapperState wrapperState,
  ) {
    // cover will now have been rendered with its gk
    var coverGK = tc.gk;
    // fco.logger.i('getTargetGK: $coverGK');
    if (coverGK == null) return;
    // var cc = coverGK?.currentContext;
    // bool mounted = cc?.mounted??false;
    Rect? targetRect = coverGK.globalPaintBounds();
    if (targetRect == null) return;

    // NOTE - this alignment is only for scaling the wrapper (image)
    // as opposed to tc.calloutAlignment, which is for positioning
    // the callout relative to the target.
    Alignment? transformAlignment = fco.calcTargetAlignmentWithinWrapper(
      wrapperRect: wrapperState.wrapperRect,
      targetRect: targetRect,
    );

    // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
    var zoomer = wrapperState.zoomer;
    // var savedKey = tc.targetsWrapperGK;

    wrapperState.setPlayingOrEditingTc(tc, () {
      zoomer?.applyTransform(
        tc.transformScale,
        tc.transformScale,
        transformAlignment,
        afterTransformF: () async {
          // SnippetInfoModel.ensureSnippetInfoPresent(
          //   snippetName: tc.contentCId,
          //   firstSnippetVersion: SnippetRootNode(
          //     name: tc.contentCId,
          //     child: PlaceholderNode(),
          //   ),
          // );
          showHotspotSnippetContentCallout(
            tc: tc,
            justPlaying: true,
            wrapperState: wrapperState,
          );
          fco.afterMsDelayDo(tc.calloutDurationMs, () {
            wrapperState.zoomer?.resetTransform(
              afterTransformF: () {
                wrapperState.setPlayingOrEditingTc(null, () {});
              },
            );
          });
        },
      );
    });
  }
}
