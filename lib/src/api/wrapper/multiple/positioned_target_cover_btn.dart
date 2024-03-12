import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/config_toolbar/callout_config_toolbar.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

// Btn has 2 uses: Tap to play, and DoubleTap to configure, plus it is draggable
class PositionedTargetPlayBtn extends StatelessWidget {
  final String name;
  final TargetConfig initialTC;

  const PositionedTargetPlayBtn({
    required this.name,
    required this.initialTC,
    super.key,
  });

  CAPIBloC get bloc => FC().capiBloc;

  @override
  Widget build(BuildContext context) {
    ZoomerState? zoomer = Zoomer.of(context);
    TargetConfig? tc = bloc.state.tcByNameOrUid(initialTC);
    return tc != null && zoomer != null
        ? Positioned(
            top: tc.btnStackPos().dy - bloc.state.CAPI_TARGET_BTN_RADIUS,
            left: tc.btnStackPos().dx - bloc.state.CAPI_TARGET_BTN_RADIUS,
            child: _draggableSelectTargetBtn(context, bloc, tc, zoomer),
          )
        : const Icon(
            Icons.warning,
            color: Colors.red,
          );
  }

  Widget _draggableSelectTargetBtn(BuildContext context, CAPIBloC bloc,
      TargetConfig tc, ZoomerState zoomer) {
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
          playTarget(context, tc, parentIW);
        },
        onDoubleTap: () async {
          Rect? wrapperRect = (parentIW?.widget.key as GlobalKey)
              .globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
          Rect? targetRect = FC()
              .getMultiTargetGk(tc.uid.toString())!
              .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()]!);
          if (wrapperRect != null && targetRect != null) {
            hideAllSingleTargetBtns();
            bloc.add(CAPIEvent.showOnlyOneTarget(tc: tc));
            Alignment ta = Useful.calcTargetAlignmentWithinWrapper(
                wrapperRect, targetRect);
            // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
            zoomer.applyTransform(
                tc.transformScale,
                tc.transformScale,
                ta, afterTransformF: () {
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
                // zoomer: parentZoomer,
                initialTC: tc,
                snippetName: tc.snippetName,
                justPlaying: false,
                allowButtonCallouts: false,
                onDiscardedF: () async {
                  zoomer.resetTransform();
                  bloc.add(const CAPIEvent.unhideAllTargetGroups());
                  unhideAllSingleTargetBtns();
                },
              );
              // show config toolbar in a toast
              showConfigToolbar(tc, zoomer, parentIW);
            });
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
              zoomer.widget.ancestorHScrollController?.offset ?? 0.0,
              zoomer.widget.ancestorVScrollController?.offset ?? 0.0,
            ));
        bloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
        // parentTW!.bloc.add(CAPIEvent.btnMoved(tc: tc, newGlobalPos: newGlobalPos));
      },
    );
  }

  void playTarget(context, TargetConfig tc, parentIW) {
    // var cw = tc.gk().currentWidget;
    // tapped helper icon - transform scaffold corr to target widget, then show content callout
    CAPIBloC bloc = FC().capiBloc;
    Rect? wrapperRect = (parentIW?.widget.key as GlobalKey)
        .globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
    Rect? targetRect = FC()
        .getMultiTargetGk(tc.uid.toString())!
        .globalPaintBounds(); //Measuring.findGlobalRect(GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()]!);
    if (wrapperRect != null && targetRect != null) {
      ZoomerState? zoomer = Zoomer.of(context);
      if (zoomer != null) {
        Alignment ta =
            Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
        bloc.add(CAPIEvent.hideTargetGroupsExcept(tc: tc));
        bloc.add(const CAPIEvent.hideAllTargetGroupBtns());
        hideAllSingleTargetBtns();

        zoomer.applyTransform(
            tc.transformScale,
            tc.transformScale,
            ta, afterTransformF: () {
          showSnippetContentCallout(
              initialTC: tc,
              snippetName: tc.snippetName,
              // parentTW.widget.ancestorHScrollController,
              // parentTW.widget.ancestorVScrollController,
              justPlaying: true,
              allowButtonCallouts: false,
              onDiscardedF: () {
                // context will have changed, so use new (cached) one
                zoomer.resetTransform();
                unhideAllSingleTargetBtns();
                bloc.add(const CAPIEvent.unhideAllTargetGroups());
              });
        });
      }
    }
  }

  static void showConfigToolbar(
      TargetConfig tc, ZoomerState zoomer, TargetGroupWrapperState? parentIW) {
    Callout.showOverlay(
      calloutConfig: CalloutConfig(
        feature: 'config-toolbar',
        color: Colors.white,
        suppliedCalloutW: 800,
        suppliedCalloutH: 60,
        roundedCorners: 20,
        animate: false,
        arrowType: ArrowType.NO_CONNECTOR,
      ),
      boxContentF: (ctx) => CalloutConfigToolbar(
        tc: tc,
        zoomer: zoomer,
        onCloseF: () {
          Callout.dismiss(tc.snippetName);
          // Callout.dismiss('config-toolbar');
        },
      ),
    );
  }
}
