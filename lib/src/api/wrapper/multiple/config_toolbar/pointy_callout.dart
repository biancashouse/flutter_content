import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';

class PointyTool extends StatefulWidget {
  final TargetsWrapperName twName;
  final TargetModel tc;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;
  final bool justPlaying;

  const PointyTool(
    this.twName,
    this.tc, {
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    required this.justPlaying,
    super.key,
  });

  @override
  State<PointyTool> createState() => _PointyToolState();

  static show(final TargetsWrapperName twName, final TargetModel tc,
      {final ScrollController? ancestorHScrollController,
      final ScrollController? ancestorVScrollController,
      required final bool justPlaying}) {
    GlobalKey? targetGK =
        // tc.single
        //     ? FC().getSingleTargetGk(tc.wName)
        //     :
        FC().getMultiTargetGk(tc.uid.toString());

    Callout.showOverlay(
        targetGkF: () => targetGK,
        boxContentF: (_) => PointyTool(
              twName,
              tc,
              ancestorHScrollController: ancestorHScrollController,
              ancestorVScrollController: ancestorVScrollController,
              justPlaying: justPlaying,
            ),
        calloutConfig: CalloutConfig(
          feature: CAPI.ARROW_TYPE_CALLOUT.name,
          suppliedCalloutW: 300,
          suppliedCalloutH: 200,
          barrier: CalloutBarrier(
            opacity: 0.1,
            // onTappedF: () async {
            //   Callout.removeOverlay(CAPI.ARROW_TYPE_CALLOUT.name);
            // },
          ),
          fillColor: Colors.purpleAccent,
          borderRadius: 16,
          arrowType: ArrowType.NO_CONNECTOR,
          notUsingHydratedStorage: true,
        ));
  }

  static bool isShowing() => Callout.anyPresent([CAPI.ARROW_TYPE_CALLOUT.name]);
}

class _PointyToolState extends State<PointyTool> {
  late ArrowType _arrowType;
  late bool _animate;

  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => FC().capiBloc;

  @override
  void initState() {
    super.initState();
    _arrowType = tc.getArrowType();
    _animate = tc.animateArrow;
  }

  void _onPressed(ArrowType t, TargetModel tc, bool animate) {
    setState(() => _arrowType = t);
    tc.calloutArrowTypeIndex = t.index;
    // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
    Callout.dismiss(CAPI.ARROW_TYPE_CALLOUT.name);
    // Useful.afterNextBuildDo(() {
    //   widget.onParentBarrierTappedF.call();
    //   Callout.refreshOverlay(tc.snippetName, f: () {});
    removeSnippetContentCallout(tc.snippetName);
    FC()
        .parentTW(widget.twName)
        ?.zoomer
        ?.zoomImmediately(tc.transformScale, tc.transformScale);
    showSnippetContentCallout(
      tc: tc,
      justPlaying: false,
      // widget.onParentBarrierTappedF,
    );
    // Useful.afterNextBuildDo(() {
    //   removeSnippetContentCallout(tc.snippetName);
    //   showSnippetContentCallout(
    //     twName: widget.twName,
    //     tc:tc,
    //     justPlaying: widget.justPlaying,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ...[
        ArrowType.NO_CONNECTOR,
        ArrowType.POINTY,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.calloutColor(),
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animateArrow),
            ),
          )),
      ...[
        ArrowType.VERY_THIN,
        ArrowType.THIN,
        ArrowType.MEDIUM,
        ArrowType.LARGE,
        // ArrowType.HUGE,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.calloutColor(),
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animateArrow),
            ),
          )),
      ...[
        ArrowType.VERY_THIN_REVERSED,
        ArrowType.THIN_REVERSED,
        ArrowType.MEDIUM_REVERSED,
        ArrowType.LARGE_REVERSED,
        // ArrowType.HUGE_REVERSED,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.calloutColor(),
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animateArrow),
            ),
          ))
    ];
    if (tc.calloutArrowTypeIndex != ArrowType.NO_CONNECTOR.index &&
        tc.calloutArrowTypeIndex != ArrowType.POINTY.index) {
      widgets.add(
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: tc.animateArrow ? Colors.white : Colors.white60),
          child: const SizedBox(
            width: 75,
            child: Text(
              'animate',
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            setState(() => _animate = !_animate);
            tc.animateArrow = _animate;
            _onPressed(tc.getArrowType(), tc, tc.animateArrow);
            Callout.dismiss(CAPI.ARROW_TYPE_CALLOUT.name);
            // Useful.afterNextBuildDo(() {
            //   reshowSnippetContentCallout(tc, widget.allowButtonCallouts, widget.justPlaying, widget.onDiscardedF);
            // });
          },
        ),
      );
    }
    return Center(
        child: Wrap(
      children: widgets,
    ));
  }
}

class _ArrowTypeOption extends StatelessWidget {
  final ArrowType arrowType;
  final Color arrowColor;
  final Function() onPressed;
  final bool isActive;

  const _ArrowTypeOption({
    required this.arrowType,
    required this.arrowColor,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor =
        arrowColor == Colors.white ? Colors.black26 : Colors.black12;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: !isActive ? bgColor : Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 60,
      height: 40,
      child: InkWell(
        onTap: onPressed,
        child: arrowType == ArrowType.NO_CONNECTOR
            ? Icon(Icons.rectangle_rounded, color: arrowColor)
            : arrowType == ArrowType.POINTY
                ? Icon(Icons.messenger, color: arrowColor)
                : arrowType == ArrowType.VERY_THIN
                    ? Icon(Icons.south_west, color: arrowColor, size: 15)
                    : arrowType == ArrowType.VERY_THIN_REVERSED
                        ? Icon(Icons.north_east, color: arrowColor, size: 15)
                        : arrowType == ArrowType.THIN
                            ? Icon(Icons.south_west,
                                color: arrowColor, size: 20)
                            : arrowType == ArrowType.THIN_REVERSED
                                ? Icon(Icons.north_east,
                                    color: arrowColor, size: 20)
                                : arrowType == ArrowType.MEDIUM
                                    ? Icon(Icons.south_west,
                                        color: arrowColor, size: 25)
                                    : arrowType == ArrowType.MEDIUM_REVERSED
                                        ? Icon(Icons.north_east,
                                            color: arrowColor, size: 25)
                                        : arrowType == ArrowType.LARGE
                                            ? Icon(Icons.south_west,
                                                color: arrowColor, size: 35)
                                            : arrowType ==
                                                    ArrowType.LARGE_REVERSED
                                                ? Icon(Icons.north_east,
                                                    color: arrowColor, size: 35)
                                                // : arrowType == ArrowType.HUGE
                                                //     ? Icon(Icons.south_west, color: arrowColor, size: 40)
                                                : Icon(Icons.north_east,
                                                    color: arrowColor,
                                                    size: 40),
      ),
    );
  }
}
