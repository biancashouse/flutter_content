import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

class ColourTool extends StatefulWidget {
  final TargetConfig tc;
  final VoidCallback onParentBarrierTappedF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;
  final bool allowButtonCallouts;
  final bool justPlaying;

  const ColourTool(
    this.tc,
    this.onParentBarrierTappedF, {
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    required this.allowButtonCallouts,
    required this.justPlaying,
    super.key,
  });

  @override
  State<ColourTool> createState() => _ColourToolState();

  static show(
    final TargetConfig tc, {
    required VoidCallback onBarrierTappedF,
    final ScrollController? ancestorHScrollController,
    final ScrollController? ancestorVScrollController,
    required final bool allowButtonCallouts,
    required final bool justPlaying,
  }) {
    GlobalKey? targetGK = tc.single
        ? FC().getSingleTargetGk(tc.wName)
        : FC().getMultiTargetGk(tc.uid.toString());

    Callout.showOverlay(
      targetGkF: () => targetGK,
      calloutConfig: CalloutConfig(
        feature: CAPI.COLOUR_CALLOUT.name,
        suppliedCalloutW: 300,
        suppliedCalloutH: 130,
        color: Colors.purpleAccent,
        roundedCorners: 16,
        arrowType: ArrowType.NO_CONNECTOR,
        barrier: CalloutBarrier(
          opacity: 0.1,
        ),
        notUsingHydratedStorage: true,
      ),
      boxContentF: (_) => ColourTool(
        tc,
        onBarrierTappedF,
        ancestorHScrollController: ancestorHScrollController,
        ancestorVScrollController: ancestorVScrollController,
        allowButtonCallouts: allowButtonCallouts,
        justPlaying: justPlaying,
      ),
    );
  }

  static bool isShowing() => Callout.anyPresent([CAPI.ARROW_TYPE_CALLOUT.name]);
}

class _ColourToolState extends State<ColourTool> {
  // late ArrowType _arrowType;
  // late bool _animate;

  TargetConfig get tc => widget.tc;

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
              bloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
              Callout.dismiss(CAPI.COLOUR_CALLOUT.name);
              Useful.afterNextBuildDo(() {
                widget.onParentBarrierTappedF.call();
                // Callout.refreshOverlay(tc.snippetName, f: () {});
                // reshowSnippetContentCallout(
                //   tc,
                //   widget.allowButtonCallouts,
                //   widget.justPlaying,
                //   widget.onParentBarrierTappedF,
                // );
              });
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
