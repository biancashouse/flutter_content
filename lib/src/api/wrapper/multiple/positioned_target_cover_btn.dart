import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

import 'config_toolbar/callout_config_toolbar.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTargetPlayBtn extends StatelessWidget {
  final TargetModel initialTC;
  final int index;

  const PositionedTargetPlayBtn({
    required this.initialTC,
    required this.index,
    super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

  TargetsWrapperState? get parentWrapperState {
    var state = initialTC.targetsWrapperGK!.currentState as TargetsWrapperState?;
    return state;
  }

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
    return Draggable(
      childWhenDragging: const Offstage(),
      feedback: IntegerCircleAvatar(
        tc,
        num: index + 1,
        bgColor: tc.calloutColor(),
        radius: bloc.state.CAPI_TARGET_BTN_RADIUS,
        textColor: Color(Colors.white.value),
        fontSize: 14,
      ),
      child: GestureDetector(
        onTap: () {
          if (parentWrapperState == null) return;

          parentWrapperState!.widget.parentNode.playList.add(tc);
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

          if (parentWrapperState == null) return;

          Alignment? ta =
              TargetsWrapper.calcTargetAlignmentWithinTargetsWrapper(tc);
          if (ta == null) return;

          // hideAllSingleTargetBtns();
          bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));

          Useful.afterNextBuildDo(() {
            parentWrapperState?.zoomer?.applyTransform(
                tc.transformScale, tc.transformScale, ta, afterTransformF: () {
              showSnippetContentCallout(
                tc: tc,
                justPlaying: false,
              );
              // show config toolbar in a toast
              showConfigToolbar(tc);
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
      // onDragUpdate: (DragUpdateDetails details) {
      //   Offset newGlobalPos = details.globalPosition.translate(
      //     widget.parent.widget.ancestorHScrollController?.offset ?? 0.0,
      //     widget.parent.widget.ancestorVScrollController?.offset ?? 0.0,
      //   );
      //   // tc.setBtnStackPosPc(newGlobalPos);
      // },
      onDragStarted: () {
        debugPrint("drag started");
        bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));
      },
      onDraggableCanceled: (velocity, offset) {
        debugPrint("drag ended");
        // Offset iwPos = CAPIState.iwPos(name);
        // iwPos = iwPos.translate(
        //   parentTW.widget.ancestorHScrollController?.offset ?? 0.0,
        //   parentTW.widget.ancestorVScrollController?.offset ?? 0.0,
        // );
        // Offset localPos = offset.translate(
        //   iwPos.dx,
        //   iwPos.dy,
        // );
        // double scale = tc.getScale(bloc.state);
        // localPos = localPos * scale;
        Offset newGlobalPos = offset; //.translate(iwPos.dx, iwPos.dy);
        // tc.setBtnStackPosPc(newGlobalPos);
        tc.setBtnStackPosPc(
          newGlobalPos
              .translate(
                bloc.state.CAPI_TARGET_BTN_RADIUS,
                bloc.state.CAPI_TARGET_BTN_RADIUS,
              )
              .translate(
                parentWrapperState!
                        .zoomer?.widget.ancestorHScrollController?.offset ??
                    0.0,
                parentWrapperState!
                        .zoomer?.widget.ancestorVScrollController?.offset ??
                    0.0,
              ),
        );
        bloc.add(CAPIEvent.TargetChanged(newTC: tc));

        // parentTW!.bloc.add(CAPIEvent.btnMoved(tc: tc, newGlobalPos: newGlobalPos));
      },
    );
  }

  void playTarget(TargetModel tc) {
    if (parentWrapperState == null) return;

    Alignment? ta = TargetsWrapper.calcTargetAlignmentWithinTargetsWrapper(tc);
    if (ta == null) return;

    // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
    var zoomer = parentWrapperState!.zoomer;
    var savedKey = tc.targetsWrapperGK;
    zoomer?.applyTransform(
        tc.transformScale, tc.transformScale, ta, afterTransformF: () {
          if (savedKey == tc.targetsWrapperGK) {
            debugPrint('doh!');
          }
      bloc.add(CAPIEvent.hideTargetGroupsExcept(tc: tc));
      bloc.add(const CAPIEvent.hideAllTargetGroupBtns());
      // hideAllSingleTargetBtns();
      showSnippetContentCallout(tc: tc, justPlaying: true);
      Useful.afterMsDelayDo(tc.calloutDurationMs, () {
        parentWrapperState!.zoomer?.resetTransform(
            afterTransformF: () =>
                FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups()));
      });
    });
  }

  static void showConfigToolbar(TargetModel tc) {
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
        tc: tc,
        onCloseF: () {
          Callout.dismiss(tc.snippetName);
          // Callout.dismiss('config-toolbar');
        },
      ),
    );
  }
}
