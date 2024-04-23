import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

import 'config_toolbar/callout_config_toolbar.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTargetPlayBtn extends StatelessWidget {
  final TargetModel initialTC;
  final int index;
  final Rect wrapperRect;

  const PositionedTargetPlayBtn({
    required this.initialTC,
    required this.index,
    required this.wrapperRect,
    super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

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
    return !FC().canEditContent
    ? GestureDetector(
      onTap: () {
        if (tc.targetsWrapperState() == null) return;

        tc.targetsWrapperState()!.widget.parentNode.playList.add(tc);
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
          if (!FC().canEditContent) return;

          if (tc.targetsWrapperState() == null) return;

          FC.forceRefresh();

          Useful.afterNextBuildDo(() {
            // save for use after the refresh
            // var wrapperPos = parentWrapperState?.wrapperPos;
            // var wrapperSize = parentWrapperState?.wrapperSize;
            // Rect? wrapperRect = tc.targetsWrapperGK?.globalPaintBounds();

            // if (wrapperRect == null) return;

            var coverGK = FC().getTargetGk(tc.uid);
            Rect? targetRect = coverGK!.globalPaintBounds();
            if (targetRect == null) return;

            // STreeNode.hideAllTargetCovers(except: tc);
            // STreeNode.hideAllTargetBtns(except: tc);
            // FC.forceRefresh();
            //
            // Useful.afterNextBuildDo(() {
            Alignment? ta = Useful.calcTargetAlignmentWithinWrapper(
                wrapperRect, targetRect);

            tc.targetsWrapperState()?.zoomer?.applyTransform(
                tc.transformScale, tc.transformScale, ta, afterTransformF: () {
              showSnippetContentCallout(
                tc: tc,
                justPlaying: false,
                wrapperRect: wrapperRect,
              );
              // show config toolbar in a toast
              showConfigToolbar(tc, wrapperRect);
            });
          });

          // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
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

  void playTarget(TargetModel tc) {
    if (tc.targetsWrapperState() == null) return;

    // save for use after the refresh
    // var wrapperPos = parentWrapperState?.wrapperPos;
    // var wrapperSize = parentWrapperState?.wrapperSize;
    // Rect? wrapperRect = tc.targetsWrapperGK?.globalPaintBounds();
    // if (wrapperRect == null) return;

    // STreeNode.hideAllTargetBtns();
    // STreeNode.hideAllTargetCovers(except: tc);
    // debugPrint('forcing refresh...');
    // FC.forceRefresh();
    //
    // Useful.afterNextBuildDo(() {

    // cover will now have been rendered with its gk
    var coverGK = FC().getTargetGk(tc.uid);
    // debugPrint('getTargetGK: $coverGK');
    if (coverGK == null) return;
    // var cc = coverGK?.currentContext;
    // bool mounted = cc?.mounted??false;
    Rect? targetRect = coverGK.globalPaintBounds();
    if (targetRect == null) return;

    Alignment? ta =
        Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);

    // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
    var zoomer = tc.targetsWrapperState()!.zoomer;
    // var savedKey = tc.targetsWrapperGK;

    tc.targetsWrapperState()!.playingTc = tc;

    // TEST
    tc.transformScale = 2.0;
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
      );
      Useful.afterMsDelayDo(tc.calloutDurationMs, () {
        tc.targetsWrapperState()!.zoomer?.resetTransform(afterTransformF: () {
          tc.targetsWrapperState()!.playingTc = null;
          // if (FC().canEditContent) {
          //   STreeNode.showAllTargetCovers();
          //   STreeNode.showAllTargetBtns();
          // } else {
          //   STreeNode.hideAllTargetCovers();
          //   STreeNode.showAllTargetBtns();
          // }
          //FC.forceRefresh();
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
          feature: 'config-toolbar',
          fillColor: Colors.purpleAccent,
          suppliedCalloutW: 800,
          suppliedCalloutH: 60,
          decorationShape: DecorationShapeEnum.rounded_rectangle,
          borderRadius: 20,
          animate: false,
          arrowType: ArrowType.NO_CONNECTOR,
          initialCalloutPos: FC().calloutConfigToolbarPos(),
          onDragEndedF: (newPos) {
            FC().setCalloutConfigToolbarPos(newPos);
          }),
      boxContentF: (ctx) => CalloutConfigToolbar(
        tc: tc, wrapperRect: wrapperRect,
        onCloseF: () {
          Callout.dismiss(tc.snippetName);
          // Callout.dismiss('config-toolbar');
        },
      ),
    );
  }
}
