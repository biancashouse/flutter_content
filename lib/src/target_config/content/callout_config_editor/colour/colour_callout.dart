import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';
import 'package:get_it/get_it.dart';

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
        ? GetIt.I.get<GKMap>(instanceName: getIt_singleTargets)[tc.wName]
        : GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()];

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
  late ArrowType _arrowType;
  late bool _animate;

  TargetConfig get tc => widget.tc;

  CAPIBloC get bloc => CAPIBloC.I;

  @override
  void initState() {
    super.initState();
    _arrowType = tc.getArrowType();
    _animate = tc.animateArrow;
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
                Callout.refreshOverlay(tc.snippetName, f: () {});
                reshowSnippetContentCallout(tc, widget.onParentBarrierTappedF, widget.allowButtonCallouts, widget.justPlaying);
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
