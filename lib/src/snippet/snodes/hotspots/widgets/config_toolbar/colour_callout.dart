import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/callout_snippet_content.dart';

class ColourTool extends StatefulWidget {
  final TargetModel tc;
  final Rect wrapperRect;
  final VoidCallback onParentBarrierTappedF;
  final String? scrollControllerName;
  final bool justPlaying;

  const ColourTool(
      this.tc,
      this.wrapperRect,
      this.onParentBarrierTappedF, {
        this.scrollControllerName,
        required this.justPlaying,
        super.key,
      });

  @override
  State<ColourTool> createState() => _ColourToolState();

  static show(
      final TargetModel tc,
      final Rect wrapperRect, {
        required VoidCallback onBarrierTappedF,
        final String? scrollControllerName,
        required final bool justPlaying,
      }) {
    GlobalKey? targetGK =
    // tc.single
    // ? FCO.getSingleTargetGk(tc.wName)
    // :
    fco.getTargetGk(tc.uid);

    Callout.showOverlay(
      targetGkF: () => targetGK,
      calloutConfig: CalloutConfig(
        cId: 'color-picker',
        initialCalloutW: 300,
        initialCalloutH: 160,
        fillColor: Colors.purpleAccent,
        borderRadius: 16,
        arrowType: ArrowType.NONE,
        barrier: CalloutBarrier(
          opacity: 0.1,
        ),
        notUsingHydratedStorage: true,
      ),
      calloutContent: ColourTool(
        tc,
        wrapperRect,
        onBarrierTappedF,
        scrollControllerName: scrollControllerName,
        justPlaying: justPlaying,
      ),
    );
  }

  static bool isShowing() => Callout.anyPresent(["arrow-type"]);
}

class _ColourToolState extends State<ColourTool> {
  // late ArrowType _arrowType;
  // late bool _animate;

  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

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
              // STreeNode.hideAllTargetCovers();
              // STreeNode.showAllTargetCovers();
              // Callout.refreshOverlay(tc.snippetName);
              // // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
              Callout.dismiss('color-picker');
              // fco.afterNextBuildDo(() {
              //   widget.onParentBarrierTappedF.call();
              //   Callout.refreshOverlay(tc.snippetName, f: () {});
              removeSnippetContentCallout(tc);
              tc.targetsWrapperState()
                  ?.zoomer
                  ?.zoomImmediately(tc.transformScale, tc.transformScale);
              tc.targetsWrapperState()?.refresh(() {
                showSnippetContentCallout(
                  tc: tc,
                  wrapperRect: widget.wrapperRect,
                  justPlaying: false,
                  // widget.onParentBarrierTappedF,
                  scrollControllerName: widget.scrollControllerName,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
