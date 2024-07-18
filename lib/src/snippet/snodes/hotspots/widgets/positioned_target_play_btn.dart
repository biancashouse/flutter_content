import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/callout_snippet_content.dart';

import 'config_toolbar/callout_config_toolbar.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTargetPlayBtn extends StatelessWidget {
  final TargetModel initialTC;
  final int index;
  final Rect wrapperRect;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const PositionedTargetPlayBtn({
    required this.initialTC,
    required this.index,
    required this.wrapperRect,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    super.key,
  });

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

  @override
  Widget build(BuildContext context) {
    TargetModel? tc = initialTC; //bloc.state.tcByUid(initialTC);
    return Positioned(
      top: tc.btnStackPos().dy - bloc.state.CAPI_TARGET_BTN_RADIUS,
      left: tc.btnStackPos().dx - bloc.state.CAPI_TARGET_BTN_RADIUS,
      child: _draggableSelectTargetBtn(tc),
    );
  }

  Widget _draggableSelectTargetBtn(TargetModel tc) {
    return !fco.canEditContent
        ? GestureDetector(
            onTap: () {
              if (tc.targetsWrapperState() == null) return;
              var list = tc.targetsWrapperState()?.widget.parentNode.playList;
              list?.add(tc);
              playTarget(tc);
            },
            child: IntegerCircleAvatar(
              tc,
              num: index + 1,
              bgColor: tc.calloutColor(),
              radius: bloc.state.CAPI_TARGET_BTN_RADIUS,
              textColor: Colors.white,
              fontSize: 14,
            ),
          )
        : Draggable<(TargetId, bool)>(
            data: (tc.uid, true),
            childWhenDragging: const Offstage(),
            feedback: IntegerCircleAvatar(
              tc,
              num: index + 1,
              bgColor: tc.calloutColor(),
              radius: bloc.state.CAPI_TARGET_BTN_RADIUS,
              textColor: Color(Colors.white.value),
              fontSize: 14,
            ),
            // onDragUpdate: (DragUpdateDetails details) {
            //   debugPrint("${details.globalPosition}");
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
            //   debugPrint("${tc.btnLocalLeftPc}, ${tc.btnLocalTopPc}");
            // },
            // onDragStarted: () {
            //   debugPrint("drag started");
            //   //bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));
            // },
            // onDraggableCanceled: (_, offset) {
            //   debugPrint("drag ended");
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
                if (tc.targetsWrapperState() == null) return;

                tc.targetsWrapperState()!.widget.parentNode.playList.add(tc);
                playTarget(tc);
              },
              // onLongPress: () {
              //   tc.setTargetStackPosPc(
              //     tc.btnStackPos(),
              //   );
              //   bloc.add(CAPIEvent.TargetChanged(newTC: tc));
              // },
              onDoubleTap: () async {
                playBtnDblTappedBtn(
                  tc,
                  wrapperRect,
                  ancestorHScrollController,
                  ancestorVScrollController,
                );
              },
              child: IntegerCircleAvatar(
                tc,
                num: index + 1,
                bgColor: tc.calloutColor(),
                radius: bloc.state.CAPI_TARGET_BTN_RADIUS,
                textColor: Colors.white,
                fontSize: 14,
              ),
            ),
          );
  }

  static void playBtnDblTappedBtn(
    TargetModel tc,
    Rect wrapperRect,
    ScrollController? ancestorHScrollController,
    ScrollController? ancestorVScrollController,
  ) {
    if (!fco.canEditContent) return;

    if (tc.targetsWrapperState() == null) return;

    var coverGK = fco.getTargetGk(tc.uid);
    Rect? targetRect = coverGK!.globalPaintBounds();
    if (targetRect == null) return;

    Alignment? ta =
        fco.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);

    tc.targetsWrapperState()?.zoomer?.applyTransform(
        tc.transformScale, tc.transformScale, ta, afterTransformF: () {
      showSnippetContentCallout(
        tc: tc,
        justPlaying: false,
        wrapperRect: wrapperRect,
        ancestorHScrollController: ancestorHScrollController,
        ancestorVScrollController: ancestorVScrollController,
      );
      // show config toolbar in a toast
      tc.targetsWrapperState()!.setPlayingOrEditingTc(tc);
      showConfigToolbar(tc, wrapperRect);
    });
  }

  void playTarget(TargetModel tc) {
    if (tc.targetsWrapperState() == null) return;

    // cover will now have been rendered with its gk
    var coverGK = fco.getTargetGk(tc.uid);
    // debugPrint('getTargetGK: $coverGK');
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
        afterTransformF: () {
      // if (savedKey != tc.targetsWrapperGK) {
      //   debugPrint('doh!');
      // }
      //
      showSnippetContentCallout(
        tc: tc,
        justPlaying: true,
        wrapperRect: wrapperRect,
        ancestorHScrollController: ancestorHScrollController,
        ancestorVScrollController: ancestorVScrollController,
      );
      fco.afterMsDelayDo(tc.calloutDurationMs, () {
        tc.targetsWrapperState()!.zoomer?.resetTransform(afterTransformF: () {
          tc.targetsWrapperState()!.setPlayingOrEditingTc(null);
        });
      });
    });
    // });
    // });
  }

  static void showConfigToolbar(TargetModel tc, Rect wrapperRect) {
    Callout.dismiss('config-toolbar');
    Callout.showOverlay(
      calloutConfig: CalloutConfig(
        cId: 'config-toolbar',
        fillColor: Colors.purpleAccent,
        initialCalloutW: 800,
        initialCalloutH: 80,
        decorationShape: DecorationShapeEnum.rounded_rectangle,
        borderRadius: 16,
        animate: false,
        arrowType: ArrowType.NONE,
        initialCalloutPos: fco.calloutConfigToolbarPos(),
        onDragEndedF: (newPos) {
          fco.setCalloutConfigToolbarPos(newPos);
        },
        dragHandleHeight: 30,
      ),
      calloutContent: CalloutConfigToolbar(
        tc: tc,
        wrapperRect: wrapperRect,
        onCloseF: () {
          tc.targetsWrapperState()!.setPlayingOrEditingTc(null);
          Callout.dismiss(tc.snippetName);
          // Callout.dismiss('config-toolbar');
        },
      ),
    );
  }
}
