import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class PointyTool extends StatefulWidget {
  final VoidCallback enterEditModeF;
  final VoidCallback exitEditModeF;
  final TargetModel tc;
  final Rect wrapperRect;
  final String? scrollControllerName;
  final bool justPlaying;

  const PointyTool(
    this.enterEditModeF,
    this.exitEditModeF,
    this.tc, {
    required this.wrapperRect,
    this.scrollControllerName,
    required this.justPlaying,
    super.key,
  });

  @override
  State<PointyTool> createState() => _PointyToolState();

  static show(final VoidCallback enterEditModeF, final VoidCallback exitEditModeF, final TargetModel tc,
      final Rect wrapperRect,
      {final String? scrollControllerName, required final bool justPlaying}) {
    GlobalKey? targetGK =
        // tc.single
        //     ? FCO.getSingleTargetGk(tc.wName)
        //     :
        fco.getTargetGk(tc.uid);

    fco.showOverlay(
        targetGkF: () => targetGK,
        calloutContent: PointyTool(
          enterEditModeF,
          exitEditModeF,
          tc,
          wrapperRect: wrapperRect,
          scrollControllerName: scrollControllerName,
          justPlaying: justPlaying,
        ),
        calloutConfig: CalloutConfig(
          cId: "arrow-type",
          initialCalloutW: 300,
          initialCalloutH: 200,
          barrier: CalloutBarrier(
            opacity: 0.1,
            // onTappedF: () async {
            //   fco.removeOverlay("arrow-type");
            // },
          ),
          fillColor: Colors.purpleAccent,
          borderRadius: 16,
          arrowType: ArrowType.NONE,
          notUsingHydratedStorage: true,
        ));
  }

  static bool isShowing() => fco.anyPresent(["arrow-type"]);
}

class _PointyToolState extends State<PointyTool> {
  late ArrowType _arrowType;
  late bool _animate;

  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

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
    fco.dismiss("arrow-type");
    // fco.afterNextBuildDo(() {
    //   widget.onParentBarrierTappedF.call();
    //   fco.refreshOverlay(tc.snippetName, f: () {});
    removeSnippetContentCallout(tc);
    tc
        .targetsWrapperState()
        ?.zoomer
        ?.zoomImmediately(tc.transformScale, tc.transformScale);
    showSnippetContentCallout(
      enterEditModeF: widget.enterEditModeF,
      exitEditModeF: widget.exitEditModeF,
      tc: tc,
      justPlaying: false,
      // widget.onParentBarrierTappedF,
      wrapperRect: widget.wrapperRect,
      scrollControllerName: widget.scrollControllerName,
    );
    // fco.afterNextBuildDo(() {
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
        ArrowType.NONE,
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
    if (tc.calloutArrowTypeIndex != ArrowType.NONE.index &&
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
            fco.dismiss("arrow-type");
            // fco.afterNextBuildDo(() {
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
        child: arrowType == ArrowType.NONE
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
