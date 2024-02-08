import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/wrapper/transformable_scaffold.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';


// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTargetCoverBtn extends StatelessWidget {
  final TransformableScaffoldState transformableScaffoldState;
  final String name;
  final TargetConfig initialTC;

  const PositionedTargetCoverBtn({
    required this.transformableScaffoldState,
    required this.name,
    required this.initialTC,
    super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

  @override
  Widget build(BuildContext context) {
    TransformableScaffoldState? parentTW = TransformableScaffold.of(context);
    TargetConfig? tc = bloc.state.tcByNameOrUid(initialTC);
    return tc != null
        ? Positioned(
            top: tc.btnStackPos().dy - bloc.state.CAPI_TARGET_BTN_RADIUS,
            left: tc.btnStackPos().dx - bloc.state.CAPI_TARGET_BTN_RADIUS,
            child: _draggableSelectTargetBtn(context, bloc, tc, parentTW),
          )
        : const Icon(
            Icons.warning,
            color: Colors.red,
          );
  }

  Widget _draggableSelectTargetBtn(context, bloc, TargetConfig tc, parentTW) {
    TargetGroupWrapperState? parentIW = TargetGroupWrapper.of(context);
    CAPIBloC bloc = FC().capiBloc;
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
          playTargetGroup(context, tc, parentIW);
        },
        onDoubleTap: () async {
          if (parentTW != null) {
            Rect? wrapperRect = (parentIW?.widget.key as GlobalKey).globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
            Rect? targetRect = FC().getMultiTargetGk(tc.uid.toString())!.globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()]!);
            if (wrapperRect != null && targetRect != null) {
              hideAllSingleTargetBtns();
              bloc.add(CAPIEvent.showOnlyOneTargetGroup(tc: tc));
              Alignment ta = Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
              // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
              parentTW.applyTransform(tc.transformScale, tc.transformScale, ta, afterTransformF: () {
                // showTargetConfigToolbarCallout(
                //   tc,
                //   parentTW.widget.ancestorHScrollController,
                //   parentTW.widget.ancestorVScrollController,
                //   onCloseF: () async {
                //     removeTargetConfigToolbarCallout();
                //     transformableWidgetWrapperState.resetTransform();
                //     bloc.add(const CAPIEvent.unhideAllTargetGroups());
                //     unhideAllSingleTargetBtns();
                //   },
                // );
                showSnippetContentCallout(
                    initialTC: tc,
                    snippetName: tc.snippetName,
                    justPlaying: false,
                    allowButtonCallouts: false,
                    onDiscardedF: () async {
                      parentTW.resetTransform();
                      bloc.add(const CAPIEvent.unhideAllTargetGroups());
                      unhideAllSingleTargetBtns();
                    });
              });
            }
          }
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
        print("drag started");
        bloc.add(CAPIEvent.showOnlyOneTargetGroup(tc: tc));
      },
      onDraggableCanceled: (velocity, offset) {
        print("drag ended");
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
              parentTW.widget.ancestorHScrollController?.offset ?? 0.0,
              parentTW.widget.ancestorVScrollController?.offset ?? 0.0,
            ));
        bloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
        // parentTW!.bloc.add(CAPIEvent.btnMoved(tc: tc, newGlobalPos: newGlobalPos));
      },
    );
  }

  void playTargetGroup(context, TargetConfig tc, parentIW) {
    // var cw = tc.gk().currentWidget;
    // tapped helper icon - transform scaffold corr to target widget, then show content callout
    CAPIBloC bloc = FC().capiBloc;
    Rect? wrapperRect = (parentIW?.widget.key as GlobalKey).globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
    Rect? targetRect = FC().getMultiTargetGk(tc.uid.toString())!.globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()]!);
    if (wrapperRect != null && targetRect != null) {
      TransformableScaffoldState? parentTW = TransformableScaffold.of(context);
      if (parentTW != null) {
        Alignment ta = Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
        bloc.add(CAPIEvent.hideTargetGroupsExcept(tc: tc));
        bloc.add(const CAPIEvent.hideAllTargetGroupBtns());
        hideAllSingleTargetBtns();
        parentTW.applyTransform(tc.transformScale, tc.transformScale, ta, afterTransformF: () {
          showSnippetContentCallout(
            initialTC: tc,
            snippetName: tc.snippetName,
            // parentTW.widget.ancestorHScrollController,
            // parentTW.widget.ancestorVScrollController,
            justPlaying: true,
            allowButtonCallouts: false,
            onDiscardedF: () {
                parentTW.resetTransform();
                unhideAllSingleTargetBtns();
                bloc.add(const CAPIEvent.unhideAllTargetGroups());
            }
          );
        });
      }
    }
  }
}
