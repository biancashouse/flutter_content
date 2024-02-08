import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/wrapper/transformable_scaffold.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/styles/option_button.dart';
import 'package:flutter_content/src/target_config/content/callout_config_editor/colour/colour_callout.dart';
import 'package:flutter_content/src/target_config/content/callout_config_editor/duration/duration_callout.dart';
import 'package:flutter_content/src/target_config/content/callout_config_editor/pointy/pointy_callout.dart';
import 'package:flutter_content/src/target_config/content/callout_config_editor/resize_slider.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';


Timer? _debounce;

class CalloutConfigToolbar extends StatelessWidget {
  final Side side;
  final CalloutConfig parent;
  final VoidCallback onParentBarrierTappedF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;
  final bool allowButtonCallouts;

  const CalloutConfigToolbar({
    required this.side,
    required this.parent,
    required this.onParentBarrierTappedF,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    this.allowButtonCallouts = false,
    super.key,
  });

  static double CALLOUT_CONFIG_TOOLBAR_W(TargetConfig tc) => tc.single ? 440.0 : 700;

  static double CALLOUT_CONFIG_TOOLBAR_H(TargetConfig tc) => 60.0;

  @override
  Widget build(BuildContext context) {
    TargetConfig tc = parent.tc!;
    double top = _topLeft(tc).dy;
    double left = _topLeft(tc).dx;
    // print("build CalloutConfigToolbar top:$top left: $left");

    return Positioned(
      top: max(0, top),
      left: min(Useful.scrW - CALLOUT_CONFIG_TOOLBAR_W(tc), left),
      child: SizedBox(
        width: CALLOUT_CONFIG_TOOLBAR_W(tc),
        height: CALLOUT_CONFIG_TOOLBAR_H(tc),
        child: Draggable(
          feedback: Offstage(),
          onDragUpdate: (DragUpdateDetails dud) {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionButton(
                isActive: isShowingTargetDurationCallout(),
                child: const Icon(
                  Icons.timer,
                  color: Colors.purpleAccent,
                ),
                onPressed: () {
                  showTargetDurationCallout(tc);
                },
              ),
              OptionButton(
                isActive: false,
                size: const Size(220, 45),
                child: SizedBox(
                  width: 200,
                  child: ResizeSlider(
                      value: tc.transformScale,
                      icon: Icons.zoom_in,
                      iconSize: 30,
                      color: Colors.purpleAccent,
                      onChange: (value) {
                        tc.transformScale = value;
                        FC().capiBloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
                        // find the selected target's TransformableWidgetWrapper
                        // var map = CAPIState.wGKMap;
                        GlobalKey? targetGK = tc.single
                            ? FC().getSingleTargetGk(tc.wName)
                            : FC().getMultiTargetGk(tc.uid.toString());
                        // var widg = gk?.currentWidget;
                        var ctx = targetGK?.currentContext;
                        // var state = gk?.currentState;
                        if (ctx != null) {
                          TransformableScaffoldState? wrapper = TransformableScaffold.of(ctx);
                          wrapper?.zoomImmediately(value, value);
                        }
                      },
                      min: 1.0,
                      max: 3.0),
                ),
                onPressed: () {},
              ),
              if (!tc.single)
                OptionButton(
                  isActive: false,
                  size: const Size(220, 45),
                  child: SizedBox(
                    width: 200,
                    child: ResizeSlider(
                        value: tc.radius,
                        icon: Icons.circle_rounded,
                        color: Colors.grey,
                        onChange: (value) {
                          // Cancel previous debounce timer, if any
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          // Set up a new debounce timer
                          _debounce = Timer(const Duration(milliseconds: 100), () {
                            FC().capiBloc.add(CAPIEvent.targetConfigChanged(newTC: tc..radius = value));
                          });
                        },
                        min: 10.0,
                        max: 100.0),
                  ),
                  onPressed: () {},
                ),
              OptionButton(
                isActive: false,
                child: const Icon(
                  Icons.palette_outlined,
                  color: Colors.purpleAccent,
                ),
                onPressed: () {
                  ColourTool.show(
                    tc,
                    onBarrierTappedF: onParentBarrierTappedF,
                    allowButtonCallouts: allowButtonCallouts,
                    justPlaying: false,
                  );

                  // hideTargetConfigToolbarCallout();
                  // // ensure snippet exists
                  // SnippetNode? sNode = bloc.state.snippet(tc.snippetName);
                  // if (sNode == null) {
                  //   sNode = SnippetNode(name: tc.snippetName);
                  //   bloc.add(CAPIEvent.createdSnippet(
                  //     newNode: sNode,
                  //   ));
                  //   Useful.afterNextBuildDo(() {
                  //     showHelpContentCallout(tc, tc.snippetName, true, ancestorHScrollController, ancestorVScrollController);
                  //   });
                  // } else {
                  //   showHelpContentCallout(tc, tc.snippetName, true, ancestorHScrollController, ancestorVScrollController);
                  // }
                },
              ),
              OptionButton(
                isActive: false,
                child: Transform.rotate(
                  angle: pi * 3 / 4,
                  child: const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.purpleAccent,
                  ),
                ),
                onPressed: () {
                  PointyTool.show(
                    tc,
                    // onBarrierTappedF: onParentBarrierTappedF,
                    ancestorHScrollController: ancestorHScrollController,
                    ancestorVScrollController: ancestorVScrollController,
                    allowButtonCallouts: allowButtonCallouts,
                    justPlaying: false,
                    onDiscardedF: (){},
                  );
                  // hideTargetConfigToolbarCallout();
                  // // ensure snippet exists
                  // SnippetNode? sNode = bloc.state.snippet(tc.snippetName);
                  // if (sNode == null) {
                  //   sNode = SnippetNode(name: tc.snippetName);
                  //   bloc.add(CAPIEvent.createdSnippet(
                  //     newNode: sNode,
                  //   ));
                  //   Useful.afterNextBuildDo(() {
                  //     showHelpContentCallout(tc, tc.snippetName, true, ancestorHScrollController, ancestorVScrollController);
                  //   });
                  // } else {
                  //   showHelpContentCallout(tc, tc.snippetName, true, ancestorHScrollController, ancestorVScrollController);
                  // }
                },
              ),
              // OptionButton(
              //   isActive: false,
              //   child: const Icon(
              //     Icons.edit,
              //     color: Colors.purpleAccent,
              //   ),
              //   onPressed: () {
              //     showSnippetTreeCallout(
              //       snippetName: parent.tc!.snippetName,
              //       targetGKF: ()=>null,
              //       onChangedF: (){},
              //       onExpiredF: (){},
              //       onClosedF: (){},
              //     );
              //   },
              // ),
              OptionButton(
                isActive: false,
                child: const Icon(
                  Icons.close,
                  color: Colors.purpleAccent,
                ),
                onPressed: () {
                  Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
                  removeSnippetContentCallout(tc.snippetName);
                },
              ), if (!tc.single)
                OptionButton(
                  isActive: false,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.purpleAccent,
                  ),
                  onPressed: () {
                    FC().capiBloc.add(CAPIEvent.deleteTarget(tc: tc));
                    // parentTW.resetTransform();
                    removeSnippetContentCallout(tc.snippetName);
                    FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
                    unhideAllSingleTargetBtns();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Offset _topLeft(TargetConfig tc) {
    Rect calloutRect = Rect.fromLTWH(parent.left!, parent.top!, parent.calloutW!, parent.calloutH!);
    if (side == Side.TOP) {
      return (calloutRect.topLeft.translate(0, -CALLOUT_CONFIG_TOOLBAR_H(tc)));
    } else {
      return (calloutRect.bottomLeft.translate(0, 0));
    }
  }
}
