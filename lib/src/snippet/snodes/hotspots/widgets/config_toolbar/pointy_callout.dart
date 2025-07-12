import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class PointyTool extends StatefulWidget {
  final CalloutConfigModel cc;
  final TargetModel tc;
  final Rect wrapperRect;
  final ScrollControllerName? scName;
  final bool justPlaying;

  const PointyTool(
    this.cc,
    this.tc, {
    required this.wrapperRect,
    this.scName,
    required this.justPlaying,
    super.key,
  });

  @override
  State<PointyTool> createState() => _PointyToolState();

  static void show(
    CalloutConfigModel cc,
    TargetModel tc,
    Rect wrapperRect, {
    ScrollControllerName? scName,
    required bool justPlaying,
  }) {
    GlobalKey? targetGK =
        // tc.single
        //     ? FCO.getSingleTargetGk(tc.wName)
        //     :
        fco.getTargetGk(tc.uid);

    fco.showOverlay(
        targetGkF: () => targetGK,
        calloutContent: PointyTool(
          cc,
          tc,
          wrapperRect: wrapperRect,
          scName: scName,
          justPlaying: justPlaying,
        ),
        calloutConfig: CalloutConfigModel(
          cId: "arrow-type",
          initialCalloutW: 300,
          initialCalloutH: 200,
          barrier: CalloutBarrierConfig(
            opacity: 0.1,
            // onTappedF: () async {
            //   fco.removeOverlay("arrow-type");
            // },
          ),
          fillColor: ColorModel.purpleAccent(),
          borderRadius: 16,
          arrowType: ArrowTypeEnum.NONE,
          notUsingHydratedStorage: true,
          scrollControllerName: scName,
        ));
  }

  static bool isShowing() => fco.anyPresent(["arrow-type"]);
}

class _PointyToolState extends State<PointyTool> {
  late ArrowTypeEnum _arrowType;
  late bool _animate;

  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => fco.capiBloc;

  @override
  void initState() {
    super.initState();
    _arrowType = tc.getArrowType();
    _animate = tc.animateArrow;
  }

  void _onPressed(ArrowTypeEnum t, TargetModel tc, bool animate) {
    setState(() => _arrowType = t);
    tc.calloutArrowTypeIndex = t.index;
    // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
    fco.dismiss("arrow-type");
    // fco.afterNextBuildDo(() {
    //   widget.onParentBarrierTappedF.call();
    //   fco.refreshOverlay(tc.snippetName, f: () {});
    SnippetRootNode? rootNode = tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
    if (rootNode == null) return;
    fco.saveNewVersion(snippet: rootNode);
    CalloutConfigToolbar.closeThenReopenContentCallout(
      widget.cc,
      tc,
      widget.wrapperRect,
      widget.scName,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ...[
        ArrowTypeEnum.NONE,
        ArrowTypeEnum.POINTY,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.calloutFillColor!.flutterValue,
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animateArrow),
            ),
          )),
      ...[
        ArrowTypeEnum.VERY_THIN,
        ArrowTypeEnum.THIN,
        ArrowTypeEnum.MEDIUM,
        ArrowTypeEnum.LARGE,
        // ArrowTypeEnum.HUGE,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.calloutFillColor!.flutterValue,
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animateArrow),
            ),
          )),
      ...[
        ArrowTypeEnum.VERY_THIN_REVERSED,
        ArrowTypeEnum.THIN_REVERSED,
        ArrowTypeEnum.MEDIUM_REVERSED,
        ArrowTypeEnum.LARGE_REVERSED,
        // ArrowTypeEnum.HUGE_REVERSED,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.calloutFillColor!.flutterValue,
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animateArrow),
            ),
          ))
    ];
    if (tc.calloutArrowTypeIndex != ArrowTypeEnum.NONE.index &&
        tc.calloutArrowTypeIndex != ArrowTypeEnum.POINTY.index) {
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
  final ArrowTypeEnum arrowType;
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
        child: arrowType == ArrowTypeEnum.NONE
            ? Icon(Icons.rectangle_rounded, color: arrowColor)
            : arrowType == ArrowTypeEnum.POINTY
                ? Icon(Icons.messenger, color: arrowColor)
                : arrowType == ArrowTypeEnum.VERY_THIN
                    ? Icon(Icons.south_west, color: arrowColor, size: 15)
                    : arrowType == ArrowTypeEnum.VERY_THIN_REVERSED
                        ? Icon(Icons.north_east, color: arrowColor, size: 15)
                        : arrowType == ArrowTypeEnum.THIN
                            ? Icon(Icons.south_west,
                                color: arrowColor, size: 20)
                            : arrowType == ArrowTypeEnum.THIN_REVERSED
                                ? Icon(Icons.north_east,
                                    color: arrowColor, size: 20)
                                : arrowType == ArrowTypeEnum.MEDIUM
                                    ? Icon(Icons.south_west,
                                        color: arrowColor, size: 25)
                                    : arrowType == ArrowTypeEnum.MEDIUM_REVERSED
                                        ? Icon(Icons.north_east,
                                            color: arrowColor, size: 25)
                                        : arrowType == ArrowTypeEnum.LARGE
                                            ? Icon(Icons.south_west,
                                                color: arrowColor, size: 35)
                                            : arrowType ==
                                                    ArrowTypeEnum.LARGE_REVERSED
                                                ? Icon(Icons.north_east,
                                                    color: arrowColor, size: 35)
                                                // : arrowType == ArrowTypeEnum.HUGE
                                                //     ? Icon(Icons.south_west, color: arrowColor, size: 40)
                                                : Icon(Icons.north_east,
                                                    color: arrowColor,
                                                    size: 40),
      ),
    );
  }
}
