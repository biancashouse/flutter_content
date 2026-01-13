import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/target_btn_icon_picker.dart';
import 'enum_target_btn_icon.dart';
import 'hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetPlayBtn extends StatelessWidget {
  final HotspotTargetModel tc;
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
      HotspotTargetConfigToolbar.CID,
    ], includeHidden: true);

    bool isVisible = snippetBeingEdited == null && !toolbarPresent;

    return Visibility(
      visible: isVisible,
      child: _draggableTargetBtn(context, tc, toolbarPresent),
    );
  }

  Widget _draggableTargetBtn(
    BuildContext context,
    HotspotTargetModel tc,
    bool toolbarPresent,
  ) {
    return !fco.canEditContent()
        ? GestureDetector(
            onTap: () {
              wrapperState.widget.parentNode.playList.toList()
                ..clear()
                ..add(tc);
              playTarget(context, tc, wrapperState);
            },
            child: Icon(
              tc.btnIcon?.flutterValue ??
                  TargetButtonIconEnum.question.flutterValue,
              size: HotspotTargetModel.DEFAULT_BTN_RADIUS * 2,
              color: tc.calloutFillColors?.color1?.flutterValue ?? Colors.black,
            ),
            // child: IntegerCircleAvatar(
            //   num: index + 1,
            //   bgColor:
            //       ,
            //   //tc.calloutFillColor!.decorationShapeEnum,
            //   radius: TargetModel.DEFAULT_BTN_RADIUS,
            //   fontSize: 14,
            // ),
          )
        : Draggable<(TargetId, bool)>(
            data: (tc.uid, true),
            childWhenDragging: const Offstage(),
            feedback: toolbarPresent
                ? const Offstage()
                : IntegerCircleAvatar(
                    num: index + 1,
                    bgColor: tc.bgColor(),
                    radius: HotspotTargetModel.DEFAULT_BTN_RADIUS,
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
              onLongPressDown: () {
                if (fco.canEditContent())
                  playIconPicker(context, tc, wrapperState);
              },
              child: IntegerCircleAvatar(
                num: index + 1,
                bgColor: tc.bgColor(),
                radius: HotspotTargetModel.DEFAULT_BTN_RADIUS,
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
    HotspotTargetModel tc,
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

    hideNonHotspotsCallouts(wrapperState);

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
          tc.showContentCallout(
            justPlaying: true,
            wrapperState: wrapperState,
          );
          fco.afterMsDelayDo(tc.calloutDurationMs, () {
            wrapperState.zoomer?.resetTransform(
              afterTransformF: () {
                wrapperState.setPlayingOrEditingTc(null, () {});
                unhideNonHotspotsCallouts(wrapperState);
              },
            );
          });
        },
      );
    });
  }

  static void playIconPicker(
    BuildContext context,
    HotspotTargetModel tc,
    TargetsWrapperState wrapperState,
  ) {
    // cover will now have been rendered with its gk
    var coverGK = tc.gk;
    if (coverGK == null) return;
    fco.showOverlay(
      calloutConfig: CalloutConfig(
        cId: 'icon-picker',
        initialTargetAlignment: Alignment.center,
        initialCalloutAlignment: Alignment.center,
        // initialCalloutW: 180,
        // initialCalloutH: 40,
        targetPointerType: TargetPointerType.none(),
        barrier: CalloutBarrierConfig(),
        onDismissedF: () {},
      ),
      calloutContent: TargetBtnIconPicker(
        originalValue: tc.btnIcon ?? TargetButtonIconEnum.question,
        onChangedF: (TargetButtonIconEnum? newBtnIcon) {
          tc.btnIcon = newBtnIcon;
          tc.saveParentSnippet(
            wrapperState.widget.parentNode.rootNodeOfSnippet(),
          );
        },
      ),
      targetGK: tc.gk,
    );
  }

  static void hideNonHotspotsCallouts(TargetsWrapperState wrapperState) {
    for (HotspotTargetModel tc in wrapperState.widget.parentNode.targets) {
      if (!tc.hasABtn()) {
        fco.hide(tc.contentCId);
      }
    }
  }

  static void unhideNonHotspotsCallouts(TargetsWrapperState wrapperState) {
    for (HotspotTargetModel tc in wrapperState.widget.parentNode.targets) {
      if (!tc.hasABtn()) {
        fco.unhide(tc.contentCId);
      }
    }
  }
}
