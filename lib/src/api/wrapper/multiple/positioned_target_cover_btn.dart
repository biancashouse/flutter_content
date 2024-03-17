import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:flutter_content/src/target_config/config_toolbar/callout_config_toolbar.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTargetPlayBtn extends StatelessWidget {
  final TargetsWrapperName twName;
  final TargetConfig initialTC;

  const PositionedTargetPlayBtn({
    required this.twName,
    required this.initialTC,
    super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

  @override
  Widget build(BuildContext context) {
    TargetConfig? tc = bloc.state.tcByUid(initialTC);
    return tc != null
        ? Positioned(
            top: tc.btnStackPos().dy - bloc.state.CAPI_TARGET_BTN_RADIUS,
            left: tc.btnStackPos().dx - bloc.state.CAPI_TARGET_BTN_RADIUS,
            child: _draggableSelectTargetBtn(context, tc),
          )
        : const Icon(
            Icons.warning,
            color: Colors.red,
          );
  }

  Widget _draggableSelectTargetBtn(BuildContext context, TargetConfig tc) {
    return Draggable(
      childWhenDragging: const Offstage(),
      feedback: IntegerCircleAvatar(
        tc,
        num: bloc.state.targetIndex(tc) + 1,
        bgColor: tc.calloutColor(),
        radius: bloc.state.CAPI_TARGET_BTN_RADIUS,
        textColor: Color(Colors.white.value),
        fontSize: 14,
      ),
      child: GestureDetector(
        onTap: () {
          playTarget(context, tc);
        },
        onDoubleTap: () async {
          Alignment? ta =
              TargetsWrapper.calcTargetAlignmentWithinTargetsWrapper(
                  twName, tc);
          if (ta == null) return;

          // hideAllSingleTargetBtns();
          bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));

          // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
          FC().parentTW(twName)?.zoomer?.applyTransform(
              tc.transformScale, tc.transformScale, ta, afterTransformF: () {
            showSnippetContentCallout(
              tc: tc,
              twName: twName,
              justPlaying: false,
            );
            // show config toolbar in a toast
            showConfigToolbar(tc, twName, context);
          });
        },
        child: IntegerCircleAvatar(
          tc,
          num: bloc.state.targetIndex(tc) + 1,
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
        tc.setBtnStackPosPc(newGlobalPos
            .translate(
              bloc.state.CAPI_TARGET_BTN_RADIUS,
              bloc.state.CAPI_TARGET_BTN_RADIUS,
            )
            .translate(
              FC()
                      .parentTW(twName)
                      ?.zoomer
                      ?.widget
                      .ancestorHScrollController
                      ?.offset ??
                  0.0,
              FC()
                      .parentTW(twName)
                      ?.zoomer
                      ?.widget
                      .ancestorVScrollController
                      ?.offset ??
                  0.0,
            ));
        bloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
        // parentTW!.bloc.add(CAPIEvent.btnMoved(tc: tc, newGlobalPos: newGlobalPos));
      },
    );
  }

  void playTarget(context, TargetConfig tc) {
    Alignment? ta =
        TargetsWrapper.calcTargetAlignmentWithinTargetsWrapper(twName, tc);
    if (ta == null) return;

    // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
    FC().parentTW(twName)?.zoomer?.applyTransform(
        tc.transformScale, tc.transformScale, ta, afterTransformF: () {
      bloc.add(CAPIEvent.hideTargetGroupsExcept(tc: tc));
      bloc.add(const CAPIEvent.hideAllTargetGroupBtns());
      // hideAllSingleTargetBtns();
      Useful.afterMsDelayDo(tc.calloutDurationMs, () {
        FC().parentTW(twName)?.zoomer?.resetTransform();
        FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
      });

      showSnippetContentCallout(twName: twName, tc: tc, justPlaying: true);
    });
  }

  static void showConfigToolbar(
    TargetConfig tc,
    TargetsWrapperName twName,
      BuildContext context,
  ) {
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
        initialCalloutPos: FC().calloutConfigToolbarPos(context),
        onDragEndedF: (newPos) {
          FC().setCalloutConfigToolbarPos(newPos);
        }
      ),
      boxContentF: (ctx) => CalloutConfigToolbar(
        twName: twName,
        tc: tc,
        onCloseF: () {
          Callout.dismiss(tc.snippetName);
          // Callout.dismiss('config-toolbar');
        },
      ),
    );
  }
}
