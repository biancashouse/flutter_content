import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/styles/option_button.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

import 'colour_callout.dart';
import 'duration_callout.dart';
import 'pointy_callout.dart';
import 'resize_slider.dart';

Timer? _debounce;

class CalloutConfigToolbar extends StatefulWidget {
  final TargetConfig tc;
  final ZoomerState zoomer;
  final VoidCallback onCloseF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;
  final bool allowButtonCallouts;

  const CalloutConfigToolbar({
    required this.tc,
    required this.zoomer,
    required this.onCloseF,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    this.allowButtonCallouts = false,
    super.key,
  });

  static double CALLOUT_CONFIG_TOOLBAR_W(TargetConfig tc) =>
      tc.single ? 440.0 : 700;

  static double CALLOUT_CONFIG_TOOLBAR_H(TargetConfig tc) => 60.0;

  @override
  State<CalloutConfigToolbar> createState() => _CalloutConfigToolbarState();
}

class _CalloutConfigToolbarState extends State<CalloutConfigToolbar> {
  BuildContext? updatedContext;

  // @override
  @override
  Widget build(BuildContext context) {
    TargetConfig tc = widget.tc;
    Size ivSize = TargetGroupWrapper.iwSize(tc.wName);
    return SizedBox(
      width: CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_W(tc),
      height: CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(tc),
      child: Draggable(
        feedback: const Offstage(),
        onDragUpdate: (DragUpdateDetails dud) {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionButton(
              tooltip: 'edit the callout show duration in ms...',
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
              tooltip: 'edit the zoom...',
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
                      FC()
                          .capiBloc
                          .add(CAPIEvent.targetConfigChanged(newTC: tc));
                      // find the selected target's TransformableWidgetWrapper
                      // var map = CAPIState.wGKMap;
                      // GlobalKey? targetGK = tc.single
                      //     ? FC().getSingleTargetGk(tc.wName)
                      //     : FC().getMultiTargetGk(tc.uid.toString());
                      // var ctx = targetGK?.currentContext;
                      // var state = gk?.currentState;
                      widget.zoomer.zoomImmediately(value, value);
                    },
                    min: 1.0,
                    max: 3.0),
              ),
              onPressed: () {},
            ),
            if (!tc.single)
              OptionButton(
                tooltip: 'resize the circular target radius...',
                isActive: false,
                size: const Size(220, 45),
                child: SizedBox(
                  width: 200,
                  child: ResizeSlider(
                      value: tc.radiusPc != null ? tc.radiusPc! * ivSize.width : 30,
                      icon: Icons.circle_rounded,
                      color: Colors.grey,
                      onChange: (value) {
                        // Cancel previous debounce timer, if any
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        // Set up a new debounce timer
                        _debounce =
                            Timer(const Duration(milliseconds: 100), () {
                          FC().capiBloc.add(CAPIEvent.targetConfigChanged(
                              newTC: tc..radiusPc = value / ivSize.width));
                        });
                      },
                      min: 10.0,
                      max: 100.0),
                ),
                onPressed: () {},
              ),
            OptionButton(
              tooltip: 'change the callout fill colour...',
              isActive: false,
              child: const Icon(
                Icons.palette_outlined,
                color: Colors.purpleAccent,
              ),
              onPressed: () {
                ColourTool.show(
                  tc,
                  onBarrierTappedF: widget.onCloseF,
                  allowButtonCallouts: widget.allowButtonCallouts,
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
              tooltip: 'configure how the callout points to the target...',
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
                  ancestorHScrollController: widget.ancestorHScrollController,
                  ancestorVScrollController: widget.ancestorVScrollController,
                  allowButtonCallouts: widget.allowButtonCallouts,
                  justPlaying: false,
                  onDiscardedF: () {},
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
              tooltip: 'close this toolbar',
              isActive: false,
              child: const Icon(
                Icons.close,
                color: Colors.purpleAccent,
              ),
              onPressed: () {
                Callout.dismiss('config-toolbar');
                removeSnippetContentCallout(tc.snippetName);
              },
            ),
            if (!tc.single)
              OptionButton(
                tooltip: 'delete this target.',
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
                  Callout.dismiss('config-toolbar');
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // Useful.instance.initWithContext(context);
    updatedContext = context;
    super.didChangeDependencies();
  }

  // Offset _topLeft(TargetConfig tc) {
  //   Rect calloutRect = Rect.fromLTWH(widget.parent.left!, widget.parent.top!,
  //       widget.parent.calloutW!, widget.parent.calloutH!);
  //   if (widget.side == Side.TOP) {
  //     return (calloutRect.topLeft
  //         .translate(0, -CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(tc)));
  //   } else {
  //     return (calloutRect.bottomLeft.translate(0, 0));
  //   }
  // }
}
