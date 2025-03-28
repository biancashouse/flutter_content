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
  final TargetModel tc;
  final Rect wrapperRect;
  final VoidCallback onCloseF;
  final ScrollControllerName? scName;

  const CalloutConfigToolbar({
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

  @override
  State<CalloutConfigToolbar> createState() => _CalloutConfigToolbarState();
}

class _CalloutConfigToolbarState extends State<CalloutConfigToolbar> {
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
                          onDragStartF: () => removeSnippetContentCallout(tc),
                          onDragEndF: () {
                            tc.changed_saveRootSnippet();
                            SNode.showAllTargetBtns();
                            SNode.showAllHotspotTargetCovers();
                            // fco.dismiss(CalloutConfigToolbar.CID);
                            showSnippetContentCallout(
                              tc: tc,
                              justPlaying: false,
                              wrapperRect: widget.wrapperRect,
                              scName: widget.scName,
                            );
                          },
                          onChangeF: (value) {
                            tc.transformScale = value;
                            TargetsWrapperState? state =
                                tc.targetsWrapperState();
                            state?.zoomer?.zoomImmediately(value, value);
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
                        onDragStartF: () {
                          removeSnippetContentCallout(tc);
                          tc
                              .targetsWrapperState()
                              ?.zoomer
                              ?.resetTransform(afterTransformF: () {});
                        },
                        onDragEndF: () {
                          tc.changed_saveRootSnippet();
                          SNode.showAllTargetBtns();
                          SNode.showAllHotspotTargetCovers();
                          TargetsWrapper.configureTarget(
                            tc,
                            widget.wrapperRect,
                            widget.scName,
                          );
                        },
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
                  if (tc.calloutDecorationShape == DecorationShapeEnum.star) {
                    tc.calloutArrowTypeIndex = ArrowType.NONE.index;
                  }
                  tc.calloutBorderColorValue = Colors.grey.value;
                  tc.calloutBorderThickness = 2;
                  removeSnippetContentCallout(tc);
                  tc
                      .targetsWrapperState()
                      ?.zoomer
                      ?.zoomImmediately(tc.transformScale, tc.transformScale);
                  showSnippetContentCallout(
                    tc: tc,
                    wrapperRect: widget.wrapperRect,
                    justPlaying: false,
                    // widget.onParentBarrierTappedF,
                    scName: widget.scName,
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
                  fco.cacheAndSaveANewSnippetVersion(
                    snippetName: rootNode.name, // tc.snippetName,
                    rootNode: rootNode,
                  );
                  fco.dismiss(CalloutConfigToolbar.CID);
                  removeSnippetContentCallout(tc);
                  tc.targetsWrapperState()?.zoomer?.resetTransform(
                      afterTransformF: () {
                    fco.afterMsDelayDo(2000, () {
                      tc.targetsWrapperState()?.refresh(() {
                        SNode.showAllHotspotTargetCovers();
                        SNode.showAllTargetBtns();
                      });
                    });
                    tc.targetsWrapperState()?.refresh(() {});
                  });
                }),
            const VerticalDivider(color: Colors.white, width: 2),
            IconButton(
              tooltip: 'close this toolbar',
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                fco.dismiss(CalloutConfigToolbar.CID);
                if (tc.hasAHotspot()) {
                  tc.targetsWrapperState()?.refresh(() {
                    tc.targetsWrapperState()?.zoomer?.resetTransform(
                        afterTransformF: () {
                      // tc.changed_saveRootSnippet();
                      SNode.showAllTargetBtns();
                      SNode.showAllHotspotTargetCovers();
                      // fco.currentPageState?.unhideFAB();
                      removeSnippetContentCallout(tc);
                      fco.afterNextBuildDo(() {
                        // save hotspot's parent snippet
                        var rootNode =
                            tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
                        if (rootNode != null) {
                          fco.cacheAndSaveANewSnippetVersion(
                            snippetName: rootNode.name,
                            rootNode: rootNode,
                          );
                        }
                      });
                    });
                  });
                } else {
                  tc.targetsWrapperState()?.refresh(() {
                    // tc.changed_saveRootSnippet();
                    SNode.showAllTargetBtns();
                    SNode.showAllHotspotTargetCovers();
                    removeSnippetContentCallout(tc);
                    fco.afterNextBuildDo(() {
                      // save parent snippet
                      var rootNode =
                          tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
                      if (rootNode != null) {
                        fco.cacheAndSaveANewSnippetVersion(
                          snippetName: rootNode.name,
                          rootNode: rootNode,
                        );
                      }
                    });
                  });
                }
              },
            ),
            const VerticalDivider(color: Colors.white, width: 2),
            toolbarVFlipIcon(),
          ]),
    );
  }

  Widget toolbarVFlipIcon() => IconButton(
        onPressed: () {
          fco.calloutConfigToolbarAtTopOfScreen =
              !fco.calloutConfigToolbarAtTopOfScreen;
          fco.dismiss(CalloutConfigToolbar.CID);
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
