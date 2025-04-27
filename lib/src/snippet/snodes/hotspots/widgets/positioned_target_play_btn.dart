import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class TargetPlayBtn extends StatelessWidget {
  final TargetModel initialTC;
  final int index;
  final Rect wrapperRect;
  final ScrollControllerName? scName;

  const TargetPlayBtn({
    required this.initialTC,
    required this.index,
    required this.wrapperRect,
    this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TargetModel? tc = initialTC; //bloc.state.tcByUid(initialTC);
    //   bool toolbarPresent = fco.anyPresent([CalloutConfigToolbar.CID]);
    //   if (toolbarPresent) {
    //     hideAllTargetBtns();
    //     hideAllTargetCovers();
    //   }

    var snippetBeingEdited = FlutterContentApp.snippetBeingEdited;
    bool toolbarPresent =
        fco.anyPresent([CalloutConfigToolbar.CID], includeHidden: true);
    bool isVisible = snippetBeingEdited == null && !toolbarPresent;

    return Visibility(
      visible: isVisible,
      child: _draggableSelectTargetBtn(tc),
    );
  }

  Widget _draggableSelectTargetBtn(TargetModel tc) {
    bool preventDrag = fco.anyPresent([CalloutConfigToolbar.CID]);
    return !fco.authenticated.isTrue
        ? GestureDetector(
            onTap: () {
              if (tc.targetsWrapperState() == null) return;
              var list =
                  tc.targetsWrapperState()?.widget.parentNode.playList.toList();
              list?.add(tc);
              playTarget(tc, wrapperRect, scName);
            },
            child: IntegerCircleAvatar(
              tc,
              num: index + 1,
              bgColor: tc.calloutColor(),
              radius: FlutterContentApp.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
              fontSize: 14,
            ),
          )
        : Draggable<(TargetId, bool)>(
            data: (tc.uid, true),
            childWhenDragging: const Offstage(),
            feedback: preventDrag
                ? const Offstage()
                : IntegerCircleAvatar(
                    tc,
                    num: index + 1,
                    bgColor: tc.calloutColor(),
                    radius:
                        FlutterContentApp.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
                    fontSize: 14,
                  ),
            // onDragUpdate: (DragUpdateDetails details) {
            //   fco.logger.i("${details.globalPosition}");
            //   Offset newGlobalPos =
            //       details.globalPosition; //.translate(iwPos.dx, iwPos.dy);
            //   tc.setBtnStackPosPc(
            //     newGlobalPos
            //         // .translate(
            //         //   bloc.state.CAPI_TARGET_BTN_RADIUS,
            //         //   bloc.state.CAPI_TARGET_BTN_RADIUS,
            //         // )
            //         // .translate(
            //         //   parentWrapperState!
            //         //           .zoomer?.widget.ancestorHScrollController?.offset ??
            //         //       0.0,
            //         //   parentWrapperState!
            //         //           .zoomer?.widget.ancestorVScrollController?.offset ??
            //         //       0.0,
            //         // ),
            //   );
            //   fco.logger.i("${tc.btnLocalLeftPc}, ${tc.btnLocalTopPc}");
            // },
            // onDragStarted: () {
            //   fco.logger.i("drag started");
            //   //bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));
            // },
            // onDraggableCanceled: (_, offset) {
            //   fco.logger.i("drag ended");
            //   Offset newGlobalPos = offset; //.translate(iwPos.dx, iwPos.dy);
            //   tc.setBtnStackPosPc(
            //     newGlobalPos
            //         .translate(
            //           bloc.state.CAPI_TARGET_BTN_RADIUS,
            //           bloc.state.CAPI_TARGET_BTN_RADIUS,
            //         )
            //         .translate(
            //           parentWrapperState!
            //                   .zoomer?.widget.ancestorHScrollController?.offset ??
            //               0.0,
            //           parentWrapperState!
            //                   .zoomer?.widget.ancestorVScrollController?.offset ??
            //               0.0,
            //         ),
            //   );
            //   bloc.add(CAPIEvent.TargetChanged(newTC: tc));
            //
            //   // parentTW!.bloc.add(CAPIEvent.btnMoved(tc: tc, newGlobalPos: newGlobalPos));
            // },
            child: GestureDetector(
              onTap: () {
                if (tc.targetsWrapperState() == null ||
                FlutterContentApp.snippetBeingEdited != null
                ) {
                  return;
                }

                final playList = tc
                    .targetsWrapperState()!
                    .widget
                    .parentNode
                    .playList
                    .toList();
                playList.add(tc);
                playTarget(tc, wrapperRect, scName);
              },
              // onLongPress: () {
              //   tc.setTargetStackPosPc(
              //     tc.btnStackPos(),
              //   );
              //   bloc.add(CAPIEvent.TargetChanged(newTC: tc));
              // },
              onDoubleTap: () async {
                if (FlutterContentApp.snippetBeingEdited != null) return;
                TargetsWrapper.configureTarget(
                  tc,
                  wrapperRect,
                  scName,
                );
              },
              child: IntegerCircleAvatar(
                tc,
                num: index + 1,
                bgColor: tc.calloutColor(),
                radius: FlutterContentApp.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
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
    TargetModel tc,
    Rect wrapperRect,
    ScrollControllerName? scName,
  ) {
    if (tc.targetsWrapperState() == null) return;

    // cover will now have been rendered with its gk
    var coverGK = fco.getTargetGk(tc.uid);
    // fco.logger.i('getTargetGK: $coverGK');
    if (coverGK == null) return;
    // var cc = coverGK?.currentContext;
    // bool mounted = cc?.mounted??false;
    Rect? targetRect = coverGK.globalPaintBounds();
    if (targetRect == null) return;

    Alignment? ta =
        fco.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);

    // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
    var zoomer = tc.targetsWrapperState()!.zoomer;
    // var savedKey = tc.targetsWrapperGK;

    tc.targetsWrapperState()!.setPlayingOrEditingTc(tc);

    zoomer?.applyTransform(tc.transformScale, tc.transformScale, ta,
        afterTransformF: () async {
      // if (savedKey != tc.targetsWrapperGK) {
      //   fco.logger.i('doh!');
      // }
      //
      await fco.ensureContentSnippetPresent(tc.contentCId);
      showSnippetContentCallout(
        tc: tc,
        justPlaying: true,
        wrapperRect: wrapperRect,
        scName: scName,
      );
      fco.afterMsDelayDo(tc.calloutDurationMs, () {
        tc.targetsWrapperState()!.zoomer?.resetTransform(afterTransformF: () {
          tc.targetsWrapperState()!.setPlayingOrEditingTc(null);
        });
      });
    });
  }
}
