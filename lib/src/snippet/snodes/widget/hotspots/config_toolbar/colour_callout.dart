import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/snippet/snodes/widget/hotspots/callout_snippet_content.dart';

class ColourTool extends StatefulWidget {
  final TargetModel tc;
  final Rect wrapperRect;
  final VoidCallback onParentBarrierTappedF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;
  final bool justPlaying;

  const ColourTool(
    this.tc, this.wrapperRect,
    this.onParentBarrierTappedF, {
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    required this.justPlaying,
    super.key,
  });

  @override
  State<ColourTool> createState() => _ColourToolState();

  static show(
    final TargetModel tc, final Rect wrapperRect, {
    required VoidCallback onBarrierTappedF,
    final ScrollController? ancestorHScrollController,
    final ScrollController? ancestorVScrollController,
    required final bool justPlaying,
  }) {
    GlobalKey? targetGK =
        // tc.single
        // ? FC().getSingleTargetGk(tc.wName)
        // :
        FC().getTargetGk(tc.uid);

    Callout.showOverlay(
      targetGkF: () => targetGK,
      calloutConfig: CalloutConfig(
        feature: 'color-picker',
        suppliedCalloutW: 300,
        suppliedCalloutH: 160,
        fillColor: Colors.purpleAccent,
        borderRadius: 16,
        arrowType: ArrowType.NO_CONNECTOR,
        barrier: CalloutBarrier(
          opacity: 0.1,
        ),
        notUsingHydratedStorage: true,
      ),
      boxContentF: (_) => ColourTool(
        tc, wrapperRect,
        onBarrierTappedF,
        ancestorHScrollController: ancestorHScrollController,
        ancestorVScrollController: ancestorVScrollController,
        justPlaying: justPlaying,
      ),
    );
  }

  static bool isShowing() => Callout.anyPresent([CAPI.ARROW_TYPE_CALLOUT.name]);
}

class _ColourToolState extends State<ColourTool> {
  // late ArrowType _arrowType;
  // late bool _animate;

  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => FC().capiBloc;

  @override
  void initState() {
    super.initState();
    // _arrowType = tc.getArrowType();
    // _animate = tc.animateArrow;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EasyColorPicker(
            selected: tc.calloutColor(),
            onChanged: (color) {
              tc.setCalloutColor(color);
              // Callout.refreshOverlay(tc.snippetName);
              // // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
              Callout.dismiss('color-picker');
              // Useful.afterNextBuildDo(() {
              //   widget.onParentBarrierTappedF.call();
              //   Callout.refreshOverlay(tc.snippetName, f: () {});
              removeSnippetContentCallout(tc.snippetName);
              tc.targetsWrapperState()?.zoomer
                  ?.zoomImmediately(tc.transformScale, tc.transformScale);
              showSnippetContentCallout(
                tc: tc, wrapperRect: widget.wrapperRect,
                justPlaying: false,
                // widget.onParentBarrierTappedF,
              );
              // });
              //reshowSnippetContentCallout(tc);
              // Useful.afterMsDelayDo(1000, () {
              //   Useful.om.moveToTop(CAPI.CALLOUT_CONFIG_TOOLBAR_CALLOUT.name);
              // });
            },
          ),
        ],
      ),
    );
  }
}
