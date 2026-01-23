import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/colour_picker_tool.dart';

import 'duration_callout.dart';
import 'more_callout_settings.dart';
import 'pointy_callout.dart';
import 'resize_slider.dart';

class HotspotTargetConfigToolbar extends StatefulWidget {
  final CalloutConfig cc;
  final HotspotTargetModel tc;
  final TargetsWrapperState wrapperState;
  final VoidCallback onCloseF;

  const HotspotTargetConfigToolbar({
    required this.cc,
    required this.tc,
    required this.wrapperState,
    required this.onCloseF,

    super.key,
  });

  static const CID = 'hotspot-callout-config-toolbar';

  static double CALLOUT_CONFIG_TOOLBAR_W(HotspotTargetModel tc) =>
      tc.hasABtn() ? 700 : 500;

  static double CALLOUT_CONFIG_TOOLBAR_H(HotspotTargetModel tc) => 60.0;

  @override
  State<HotspotTargetConfigToolbar> createState() =>
      HotspotTargetConfigToolbarState();
}

class HotspotTargetConfigToolbarState
    extends State<HotspotTargetConfigToolbar> {
  // BuildContext? updatedContext;
  // final dbT = Debouncer(delayMs: 100);

  // @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HotspotTargetConfigToolbar.CALLOUT_CONFIG_TOOLBAR_W(widget.tc),
      height: HotspotTargetConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H(widget.tc),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          toolbarVFlipIcon(),
          const VerticalDivider(color: Colors.white, width: 2),
          if (widget.tc.hasABtn())
            Column(
              children: [
                fco.coloredText('zoom', color: Colors.white70),
                Tooltip(
                  message: 'edit the zoom...',
                  child: SizedBox(
                    width: 200,
                    child: ResizeSlider(
                      value: widget.tc.transformScale,
                      //icon: Icons.zoom_in,
                      iconSize: 30,
                      color: Colors.white,
                      onDragStartF: () => _onDragStartF(widget.tc),
                      onDragEndF: () => _onDragEndF(widget.tc),
                      // onDragEndF: () {
                      //   widget.tc.changed_saveRootSnippet();
                      //   SNode.showAllTargetBtns();
                      //   SNode.showAllHotspotTargetCovers();
                      //   // fco.dismiss(CalloutConfigToolbar.CID);
                      //   showSnippetContentCallout(
                      //     tc: tc,
                      //     justPlaying: false,
                      //     wrapperRect: widget.wrapperRect,
                      //
                      //   );
                      // },
                      onChangeF: (value) {
                        widget.tc.transformScale = value;
                        widget.wrapperState.zoomer?.zoomImmediately(
                          value,
                          value,
                        );
                        // });
                      },
                      min: 1.0,
                      max: 3.0,
                    ),
                  ),
                ),
              ],
            ),
          if (widget.tc.hasABtn())
            const VerticalDivider(color: Colors.white, width: 2),
          Column(
            children: [
              fco.coloredText('target size', color: Colors.white70),
              Tooltip(
                message: 'resize the circular target radius...',
                child: SizedBox(
                  width: 200,
                  child: ResizeSlider(
                    value: widget.tc.targetRadiusPC != null
                        ? max(
                            16,
                            widget.tc.targetRadiusPC! *
                                widget.wrapperState.wrapperRect.width,
                          )
                        : HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                    // icon: Icons.circle_rounded,
                    color: Colors.white70,
                    onDragStartF: () => _onDragStartF(widget.tc),
                    onDragEndF: () => _onDragEndF(widget.tc),
                    // onDragStartF: () {
                    //   removeSnippetContentCallout(tc);
                    //   tc
                    //       .targetsWrapperState()
                    //       ?.zoomer
                    //       ?.resetTransform(afterTransformF: () {});
                    // },
                    // onDragEndF: () {
                    //   widget.tc.changed_saveRootSnippet();
                    //   // SNode.showAllTargetBtns();
                    //   // SNode.showAllHotspotTargetCovers();
                    //   TargetsWrapper.configureTarget(
                    //     tc,
                    //     widget.wrapperRect,
                    //     widget.
                    //   );
                    // },
                    onChangeF: (value) {
                      // Cancel previous debounce timer, if any
                      widget.wrapperState.refresh(
                        () => widget.tc.targetRadiusPC =
                            value / widget.wrapperState.wrapperRect.width,
                      );
                    },
                    min: 16.0,
                    max: 200.0,
                  ),
                ),
              ),
            ],
          ),
          if (kDebugMode) const VerticalDivider(color: Colors.white, width: 2),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // fco.coloredText('align', color: Colors.white70),
              Center(
                child: Tooltip(
                  message: 'target <- callout alignment',
                  child: Container(
                    width: 80,
                    height: 70,
                    alignment: Alignment.center,
                    child: Text(
                      'x: ${widget.tc.tcAlignment?.x.toStringAsFixed(2)},\n'
                      'y: ${widget.tc.tcAlignment?.y.toStringAsFixed(2)}',
                      // 'sep: ${widget.tc.tcSeparation?.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'edit the callout show duration in ms...',
            icon: const Icon(Icons.timer, color: Colors.white),
            onPressed: () {
              showTargetDurationCallout(tc: widget.tc);
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'change the callout fill colour...',
            icon: const Icon(Icons.palette_outlined, color: Colors.white),
            onPressed: () {
              showTargetColorTool(
                onColorPickedF: (Color? pickedColor) {
                  if (pickedColor != null) {
                    widget.tc.setCalloutFillColor(
                      ColorModel.fromColor(pickedColor),
                    );
                    widget.tc.calloutConfig!.decorationFillColors =
                        ColorOrGradient.color(pickedColor);
                    widget.tc.calloutConfig!.bubbleOrTargetPointerColor =
                        pickedColor;
                  }
                  widget.tc.saveParentSnippet(
                    widget.wrapperState.widget.parentNode.rootNodeOfSnippet(),
                  );
                  // STreeNode.hideAllTargetCovers();
                  // STreeNode.showAllTargetCovers();
                  // fco.refreshOverlay(widget.tc.snippetName);
                  // // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
                  // fco.afterNextBuildDo(() {
                  //   widget.onParentBarrierTappedF.call();
                  //   fco.refreshOverlay(widget.tc.snippetName, f: () {});
                  fco.dismiss('color-picker');
                  // widget.tc.closeThenReopenContentCallout(widget.wrapperState);
                  fco.refresh(widget.tc.contentCId);
                },
              );

              // hideTargetModelToolbarCallout();
              // // ensure snippet exists
              // SnippetNode? sNode = bloc.state.snippet(widget.tc.snippetName);
              // if (sNode == null) {
              //   sNode = SnippetNode(name: widget.tc.snippetName);
              //   bloc.add(CAPIEvent.createdSnippet(
              //     newNode: sNode,
              //   ));
              //   fco.afterNextBuildDo(() {
              //     showHelpContentCallout(tc, widget.tc.snippetName, true, ancestorHScrollController, ancestorVScrollController);
              //   });
              // } else {
              //   showHelpContentCallout(tc, widget.tc.snippetName, true, ancestorHScrollController, ancestorVScrollController);
              // }
            },
          ),
          IconButton(
            tooltip: 'configure how the callout points to the target...',
            icon: Transform.rotate(
              angle: pi * 3 / 4,
              child: const Icon(Icons.arrow_right_alt, color: Colors.white),
            ),
            onPressed: () {
              PointyTool.show(
                widget.cc,
                widget.tc,
                widget.wrapperState,

                // onBarrierTappedF: onParentBarrierTappedF,
                justPlaying: false,
              );
            },
          ),
          Tooltip(
            message: 'configure callout shape...',
            child: PropertyButtonEnum(
              label: "shape",
              skipShowingLabel: true,
              // passing label as the cId
              menuItems: DecorationShapeEnum.values
                  .map((e) => e.toMenuItem())
                  .toList(),
              originalEnumIndex: widget.tc.calloutDecorationShapeEnum?.index,
              onChangeF: (newIndex) {
                fco.dismiss('shape');
                widget.tc.calloutDecorationShapeEnum =
                    DecorationShapeEnum.of(newIndex) ??
                    DecorationShapeEnum.rectangle;
                if (widget.tc.calloutDecorationShapeEnum ==
                    DecorationShapeEnum.star) {
                  widget.tc.targetPointerTypeEnum = TargetPointerTypeEnum.NONE;
                }
                widget.tc.calloutBorderColors = UpTo6Colors(
                  color1: ColorModel.grey(),
                );
                widget.tc.calloutBorderThickness = 2;
                SnippetRootNode? rootNode = widget
                    .wrapperState
                    .widget
                    .parentNode
                    .rootNodeOfSnippet();
                if (rootNode == null) return;
                // fco.modelRepo.saveNewVersionOfSnippet(rootNode);
                fco.appInfo.cachedSnippetInfo(rootNode.name)?.notifyChange(rootNode);
                widget.tc.closeThenReopenContentCallout(widget.wrapperState);
                // fco.capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
                // fco.afterNextBuildDo(() {
                //   removeSnippetContentCallout(widget.tc.snippetName);
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
            ),
          ),
          IconButton(
            tooltip: 'more callout settings...',
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              MoreCalloutConfigSettings.show(
                widget.tc,
                widget.wrapperState,
                justPlaying: false,
              );
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'delete this target.',
            icon: const Icon(Icons.delete, color: Colors.orangeAccent),
            onPressed: () {
              SnippetRootNode? rootNode = widget.wrapperState.widget.parentNode
                  .rootNodeOfSnippet();
              if (rootNode == null) return;
              widget.wrapperState.widget.parentNode.targets.remove(widget.tc);
              // fco.modelRepo.saveNewVersionOfSnippet(rootNode);
              fco.appInfo.cachedSnippetInfo(rootNode.name)?.notifyChange(rootNode);

              // fco.cacheAndSaveANewSnippetVersion(
              //   snippetName: rootNode.name, // widget.tc.snippetName,
              //   rootNode: rootNode,
              // );
              _closeCalloutConfigToolbar(widget.tc);
              //widget.tc.targetsWrapperState()?.refresh(() {});
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'close this toolbar',
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              _closeCalloutConfigToolbar(widget.tc);
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          toolbarVFlipIcon(),
        ],
      ),
    );
  }

  Widget toolbarVFlipIcon() => IconButton(
    onPressed: () {
      fco.dismiss(HotspotTargetConfigToolbar.CID, skipOnDismiss: true);
      fco.calloutConfigToolbarAtTopOfScreen =
          !fco.calloutConfigToolbarAtTopOfScreen;
      widget.tc.showConfigToolbar(widget.wrapperState);
    },
    icon: Icon(
      fco.calloutConfigToolbarAtTopOfScreen
          ? Icons.arrow_downward
          : Icons.arrow_upward,
      color: Colors.white70,
    ),
  );

  // used by both slider
  void _onDragStartF(HotspotTargetModel tc) {
    tc.removeContentCallout(skipOnDismiss: true);
    // tc
    //     .targetsWrapperState()
    //     ?.zoomer
    //     ?.resetTransform(afterTransformF: () {}, quickly: true);
  }

  // used by both slider
  void _onDragEndF(HotspotTargetModel tc) {
    widget.tc.saveParentSnippet(
      widget.wrapperState.widget.parentNode.rootNodeOfSnippet(),
    );
    tc.closeThenReopenContentCallout(widget.wrapperState);
  }

  void _closeCalloutConfigToolbar(HotspotTargetModel tc) {
    // if (widget.tc.calloutLeftPc == null ||
    //     widget.tc.calloutTopPc == null ||
    //     widget.tc.targetLocalCentrePosPc == null ||
    //     widget.tc.targetLocalPosTopPc == null)
    //   return;

    // Offset globalCalloutContentPos = Offset(
    //   widget.wrapperRect.left + widget.tc.calloutLeftPc! * widget.wrapperRect.width,
    //   widget.wrapperRect.top + widget.tc.calloutTopPc! * widget.wrapperRect.height,
    // );

    // Offset globalTargetPos = widget.tc.targetStackPos();

    // skip if not using targetAlignment
    // pos of callout relative to target

    // close the callout

    // removing the content callout removes toolbar and resets
    tc.removeContentCallout();
  }

  void showTargetColorTool({required ColorPickedCallback onColorPickedF}) {
    // GlobalKey? targetGK = widget.tc.gk;

    fco.showOverlay(
      // targetGK: targetGK,
      calloutConfig: CalloutConfig(
        cId: 'color-picker',
        initialCalloutW: 320,
        initialCalloutH: 380,
        decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
        decorationBorderRadius: 16,
        targetPointerType: TargetPointerType.none(),
        barrier: CalloutBarrierConfig(opacity: 0.1),
      ),
      calloutContent: ColourPickerTool(
        originalColor:
            widget.tc.calloutFillColors?.color1?.flutterValue ?? Colors.white,
        onColorPickedF: onColorPickedF,
      ),
    );
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
