import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:flutter_content/src/target_config/config_toolbar/more_callout_settings.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_radio_menu.dart';

import 'colour_callout.dart';
import 'duration_callout.dart';
import 'pointy_callout.dart';
import 'resize_slider.dart';

Timer? _debounce;

class CalloutConfigToolbar extends StatefulWidget {
  final TargetsWrapperName twName;
  final TargetConfig tc;
  final VoidCallback onCloseF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const CalloutConfigToolbar({
    required this.twName,
    required this.tc,
    required this.onCloseF,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    super.key,
  });

  static double CALLOUT_CONFIG_TOOLBAR_W(TargetConfig tc) => 700;

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
    Size ivSize = TargetsWrapper.iwSize(tc.wName);
    return SizedBox(
      width: CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_W(tc),
      height: CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(tc),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Tooltip(
            message: 'edit the zoom...',
            child: SizedBox(
              width: 200,
              child: ResizeSlider(
                  value: tc.transformScale,
                  icon: Icons.zoom_in,
                  iconSize: 30,
                  color: Colors.white,
                  onDragStartF: () => Callout.dismiss(tc.snippetName),
                  onDragEndF: () => showSnippetContentCallout(
                        twName: widget.twName,
                        tc: tc,
                        // parentTW.widget.ancestorHScrollController,
                        // parentTW.widget.ancestorVScrollController,
                        justPlaying: false,
                      ),
                  onChangeF: (value) {
                    tc.transformScale = value;
                    FC()
                        .parentTW(widget.twName)
                        ?.zoomer
                        ?.zoomImmediately(value, value);
                  },
                  min: 1.0,
                  max: 3.0),
            ),
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          Tooltip(
            message: 'resize the circular target radius...',
            child: SizedBox(
              width: 200,
              child: ResizeSlider(
                  value: tc.radiusPc != null ? max(16, tc.radiusPc! * ivSize.width) : 30,
                  icon: Icons.circle_rounded,
                  color: Colors.white70,
                  onChangeF: (value) {
                    // Cancel previous debounce timer, if any
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    // Set up a new debounce timer
                    _debounce = Timer(const Duration(milliseconds: 100), () {
                      FC().capiBloc.add(CAPIEvent.targetConfigChanged(
                          newTC: tc..radiusPc = value / ivSize.width));
                    });
                  },
                  min: 16.0,
                  max: 100.0),
            ),
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'edit the callout show duration in ms...',
            icon: const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            onPressed: () {
              showTargetDurationCallout(tc);
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'change the callout fill colour...',
            icon: const Icon(
              Icons.palette_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              ColourTool.show(
                widget.twName,
                tc,
                onBarrierTappedF: widget.onCloseF,
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
          IconButton(
            tooltip: 'configure how the callout points to the target...',
            icon: Transform.rotate(
              angle: pi * 3 / 4,
              child: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              PointyTool.show(
                widget.twName,
                tc,
                // onBarrierTappedF: onParentBarrierTappedF,
                ancestorHScrollController: widget.ancestorHScrollController,
                ancestorVScrollController: widget.ancestorVScrollController,
                justPlaying: false,
              );
            },
          ),
          Tooltip(
            message: 'configure callout shape...',
            child: NodePropertyButtonEnum(
              label: "",
              menuItems: DecorationShapeEnum.values
                  .map((e) => e.toMenuItem())
                  .toList(),
              originalEnumIndex: tc.calloutDecorationShape.index,
              onChangeF: (newIndex) {
                tc.calloutDecorationShape = DecorationShapeEnum.of(newIndex) ??
                    DecorationShapeEnum.rectangle;
                tc.calloutBorderColorValue = Colors.grey.value;
                tc.calloutBorderThickness = 2;
                removeSnippetContentCallout(tc.snippetName);
                FC()
                    .parentTW(widget.twName)
                    ?.zoomer
                    ?.zoomImmediately(tc.transformScale, tc.transformScale);
                showSnippetContentCallout(
                  twName: widget.twName,
                  tc: tc,
                  justPlaying: false,
                  // widget.onParentBarrierTappedF,
                );
                // FC().capiBloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
                // Useful.afterNextBuildDo(() {
                //   removeSnippetContentCallout(tc.snippetName);
                //   showSnippetContentCallout(
                //     twName: widget.twName,
                //     tc:tc,
                //     justPlaying: false,
                //   );
                // });
              },
              wrap: true,
              calloutButtonSize: const Size(70, 40),
              calloutSize: const Size(240, 220),
            ),
          ),
          IconButton(
            tooltip: 'more callout settings...',
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              MoreCalloutConfigSettings.show(
                widget.twName,
                widget.tc,
                ancestorHScrollController: widget.ancestorHScrollController,
                ancestorVScrollController: widget.ancestorVScrollController,
                justPlaying: false,
              );
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'delete this target.',
            icon: const Icon(
              Icons.delete,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
              FC().capiBloc.add(CAPIEvent.deleteTarget(tc: tc));
              Callout.dismiss('config-toolbar');
              removeSnippetContentCallout(tc.snippetName);
              FC().parentTW(widget.twName)?.zoomer?.resetTransform();
              FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'close this toolbar',
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Callout.dismiss('config-toolbar');
              removeSnippetContentCallout(tc.snippetName);
              FC().parentTW(widget.twName)?.zoomer?.resetTransform();
              FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
            },
          ),
        ],
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
