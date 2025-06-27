import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';

import 'colour_callout.dart';
import 'duration_callout.dart';
import 'more_callout_settings.dart';
import 'pointy_callout.dart';
import 'resize_slider.dart';

class CalloutConfigToolbar extends StatefulWidget {
  final CalloutConfigModel cc;
  final TargetModel tc;
  final Rect wrapperRect;
  final VoidCallback onCloseF;
  final ScrollControllerName? scName;

  const CalloutConfigToolbar({
    required this.cc,
    required this.tc,
    required this.wrapperRect,
    required this.onCloseF,
    this.scName,
    super.key,
  });

  static const CID = 'callout-config-toolbar';

  static double CALLOUT_CONFIG_TOOLBAR_W(TargetModel tc) =>
      tc.hasAHotspot() ? 700 : 500;

  static double CALLOUT_CONFIG_TOOLBAR_H(TargetModel tc) => 60.0;

  static void closeThenReopenContentCallout(
    CalloutConfigModel cc,
    TargetModel tc,
    Rect wrapperRect,
    ScrollControllerName? scName,
  ) async {
    removeSnippetContentCallout(tc, skipOnDismiss: true);

    // tc
    //     .targetsWrapperState()
    //     ?.zoomer
    //     ?.zoomImmediately(tc.transformScale, tc.transformScale);

    Alignment? ta = fco.calcTargetAlignmentWithinWrapper(
        wrapperRect: wrapperRect, targetRect: cc.tR());

    tc
        .targetsWrapperState()
        ?.zoomer
        ?.zoomImmediately(tc.transformScale, tc.transformScale);

    showSnippetContentCallout(
      tc: tc,
      justPlaying: false,
      wrapperRect: wrapperRect,
      scName: scName,
    );

    fco.dismiss(CalloutConfigToolbar.CID, skipOnDismiss: true);
    TargetsWrapper.showConfigToolbar(
      tc,
      wrapperRect,
      scName,
    );
  }

  @override
  State<CalloutConfigToolbar> createState() => CalloutConfigToolbarState();
}

class CalloutConfigToolbarState extends State<CalloutConfigToolbar> {
  // BuildContext? updatedContext;
  final dbT = DebounceTimer(delayMs: 100);

  // @override
  @override
  Widget build(BuildContext context) {
    TargetModel tc = widget.tc;
    Size ivSize = tc.targetsWrapperState()?.wrapperRect.size ??
        MediaQuery.sizeOf(context);
    return SizedBox(
      width: CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_W(tc),
      height: CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(tc),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            toolbarVFlipIcon(),
            const VerticalDivider(color: Colors.white, width: 2),
            if (tc.hasAHotspot())
              Column(
                children: [
                  fco.coloredText('zoom', color: Colors.white70),
                  Tooltip(
                    message: 'edit the zoom...',
                    child: SizedBox(
                      width: 200,
                      child: ResizeSlider(
                          value: tc.transformScale,
                          //icon: Icons.zoom_in,
                          iconSize: 30,
                          color: Colors.white,
                          onDragStartF: () => _onDragStartF(tc),
                          onDragEndF: () => _onDragEndF(tc),
                          // onDragEndF: () {
                          //   tc.changed_saveRootSnippet();
                          //   SNode.showAllTargetBtns();
                          //   SNode.showAllHotspotTargetCovers();
                          //   // fco.dismiss(CalloutConfigToolbar.CID);
                          //   showSnippetContentCallout(
                          //     tc: tc,
                          //     justPlaying: false,
                          //     wrapperRect: widget.wrapperRect,
                          //     scName: widget.scName,
                          //   );
                          // },
                          onChangeF: (value) {
                            TargetsWrapperState? state =
                                tc.targetsWrapperState();
                            // state?.zoomer?.resetTransform(afterTransformF: () {
                            tc.transformScale = value;
                            state?.zoomer?.zoomImmediately(value, value);
                            // });
                          },
                          min: 1.0,
                          max: 3.0),
                    ),
                  ),
                ],
              ),
            if (tc.hasAHotspot())
              const VerticalDivider(color: Colors.white, width: 2),
            Column(
              children: [
                fco.coloredText('target size', color: Colors.white70),
                Tooltip(
                  message: 'resize the circular target radius...',
                  child: SizedBox(
                    width: 200,
                    child: ResizeSlider(
                        value: tc.radiusPc != null
                            ? max(16, tc.radiusPc! * ivSize.width)
                            : 30,
                        // icon: Icons.circle_rounded,
                        color: Colors.white70,
                        onDragStartF: () => _onDragStartF(tc),
                        onDragEndF: () => _onDragEndF(tc),
                        // onDragStartF: () {
                        //   removeSnippetContentCallout(tc);
                        //   tc
                        //       .targetsWrapperState()
                        //       ?.zoomer
                        //       ?.resetTransform(afterTransformF: () {});
                        // },
                        // onDragEndF: () {
                        //   tc.changed_saveRootSnippet();
                        //   // SNode.showAllTargetBtns();
                        //   // SNode.showAllHotspotTargetCovers();
                        //   TargetsWrapper.configureTarget(
                        //     tc,
                        //     widget.wrapperRect,
                        //     widget.scName,
                        //   );
                        // },
                        onChangeF: (value) {
                          // Cancel previous debounce timer, if any
                          tc.targetsWrapperState()?.refresh(
                                () => tc.radiusPc = value / ivSize.width,
                              );
                        },
                        min: 16.0,
                        max: 100.0),
                  ),
                ),
              ],
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
                TargetColourTool.show(
                  widget.cc,
                  tc,
                  widget.wrapperRect,
                  onBarrierTappedF: widget.onCloseF,
                  justPlaying: false,
                );

                // hideTargetModelToolbarCallout();
                // // ensure snippet exists
                // SnippetNode? sNode = bloc.state.snippet(tc.snippetName);
                // if (sNode == null) {
                //   sNode = SnippetNode(name: tc.snippetName);
                //   bloc.add(CAPIEvent.createdSnippet(
                //     newNode: sNode,
                //   ));
                //   fco.afterNextBuildDo(() {
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
                  widget.cc,
                  tc, widget.wrapperRect,
                  // onBarrierTappedF: onParentBarrierTappedF,
                  scName: widget.scName,
                  justPlaying: false,
                );
              },
            ),
            Tooltip(
              message: 'configure callout shape...',
              child: PropertyButtonEnum(
                label: "",
                menuItems: MappableDecorationShapeEnum.values
                    .map((e) => e.toMenuItem())
                    .toList(),
                originalEnumIndex: tc.calloutDecorationShape.index,
                onChangeF: (newIndex) {
                  tc.calloutDecorationShape =
                      MappableDecorationShapeEnum.of(newIndex) ??
                          MappableDecorationShapeEnum.rectangle;
                  if (tc.calloutDecorationShape ==
                      MappableDecorationShapeEnum.star) {
                    tc.calloutArrowTypeIndex = ArrowTypeEnum.NONE.index;
                  }
                  tc.calloutBorderColor = ColorModel.grey();
                  tc.calloutBorderThickness = 2;
                  SnippetRootNode? rootNode = tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
                  if (rootNode == null) return;
                  fco.saveNewVersion(snippet: rootNode);
                  CalloutConfigToolbar.closeThenReopenContentCallout(
                    widget.cc,
                    tc,
                    widget.wrapperRect,
                    widget.scName,
                  );
                  // FlutterContentApp.capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
                  // fco.afterNextBuildDo(() {
                  //   removeSnippetContentCallout(tc.snippetName);
                  //   showSnippetContentCallout(
                  //     twName: widget.twName,
                  //     tc:tc,
                  //     justPlaying: false,
                  // ancestorHScrollController: widget.ancestorHScrollController,
                  // ancestorVScrollController: widget.ancestorVScrollController,
                  //   );
                  // });
                },
                wrap: true,
                calloutButtonSize: const Size(70, 40),
                calloutSize: const Size(240, 220),
                scName: widget.scName,
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
                  widget.cc,
                  widget.tc,
                  widget.wrapperRect,
                  scName: widget.scName,
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
                  SnippetRootNode? rootNode =
                      tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
                  if (rootNode == null) return;
                  tc
                      .targetsWrapperState()
                      ?.widget
                      .parentNode
                      .targets
                      .remove(tc);
                  fco.saveNewVersion(snippet: rootNode);
                  // fco.cacheAndSaveANewSnippetVersion(
                  //   snippetName: rootNode.name, // tc.snippetName,
                  //   rootNode: rootNode,
                  // );
                  _closeCalloutConfigToolbar(tc);
                  //tc.targetsWrapperState()?.refresh(() {});
                }),
            const VerticalDivider(color: Colors.white, width: 2),
            IconButton(
              tooltip: 'close this toolbar',
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                _closeCalloutConfigToolbar(tc);
              },
            ),
            const VerticalDivider(color: Colors.white, width: 2),
            toolbarVFlipIcon(),
          ]),
    );
  }

  Widget toolbarVFlipIcon() => IconButton(
        onPressed: () {
          fco.dismiss(CalloutConfigToolbar.CID, skipOnDismiss: true);
          fco.calloutConfigToolbarAtTopOfScreen =
              !fco.calloutConfigToolbarAtTopOfScreen;
          TargetsWrapper.showConfigToolbar(
            widget.tc,
            widget.wrapperRect,
            widget.scName,
          );
        },
        icon: Icon(
          fco.calloutConfigToolbarAtTopOfScreen
              ? Icons.arrow_downward
              : Icons.arrow_upward,
          color: Colors.white70,
        ),
      );

  // used by both slider
  void _onDragStartF(TargetModel tc) {
    removeSnippetContentCallout(tc, skipOnDismiss: true);
    // tc
    //     .targetsWrapperState()
    //     ?.zoomer
    //     ?.resetTransform(afterTransformF: () {}, quickly: true);
  }

  // used by both slider
  void _onDragEndF(TargetModel tc) {
    tc.changed_saveRootSnippet();
    CalloutConfigToolbar.closeThenReopenContentCallout(
      widget.cc,
      tc,
      widget.wrapperRect,
      widget.scName,
    );
  }

  void _closeCalloutConfigToolbar(TargetModel tc) {
    // removing the content callout remove toolbar and resets
    removeSnippetContentCallout(tc);
  }

// @override
// void didChangeDependencies() {
//   // FCO.instance.initWithContext(context);
//   updatedContext = context;
//   super.didChangeDependencies();
// }

// Offset _topLeft(TargetModel tc) {
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
