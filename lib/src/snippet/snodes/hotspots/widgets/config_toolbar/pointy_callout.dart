import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';

class PointyTool extends StatefulWidget {
  final CalloutConfig cc;
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
    CalloutConfig cc,
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
        calloutConfig: CalloutConfig(
          cId: "arrow-type",
          initialCalloutW: 300,
          initialCalloutH: 200,
          barrier: CalloutBarrierConfig(
            opacity: 0.1,
            // onTappedF: () async {
            //   fco.removeOverlay("arrow-type");
            // },
          ),
          decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
          decorationBorderRadius: 16,
          targetPointerType: TargetPointerType.none(),
          notUsingHydratedStorage: true,
          scrollControllerName: scName,
        ));
  }

  static bool isShowing() => fco.anyPresent(["arrow-type"]);
}

class _PointyToolState extends State<PointyTool> {
  late TargetPointerTypeEnum _arrowType;
  late bool _animate;

  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => fco.capiBloc;

  @override
  void initState() {
    super.initState();
    _arrowType = tc.targetPointerTypeEnum ?? TargetPointerTypeEnum.THIN;
    _animate = tc.animatePointer??false;
  }

  void _onPressed(TargetPointerTypeEnum t, TargetModel tc, bool animate) {
    setState(() => _arrowType = t);
    tc.targetPointerTypeEnum = t;
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
        TargetPointerTypeEnum.NONE,
        TargetPointerTypeEnum.POINTY,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.bgColor(),
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animatePointer??false),
            ),
          )),
      ...[
        TargetPointerTypeEnum.VERY_THIN,
        TargetPointerTypeEnum.THIN,
        TargetPointerTypeEnum.MEDIUM,
        TargetPointerTypeEnum.LARGE,
        // TargetPointerTypeEnum.HUGE,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.bgColor(),
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animatePointer??false),
            ),
          )),
      ...[
        TargetPointerTypeEnum.VERY_THIN_REVERSED,
        TargetPointerTypeEnum.THIN_REVERSED,
        TargetPointerTypeEnum.MEDIUM_REVERSED,
        TargetPointerTypeEnum.LARGE_REVERSED,
        // TargetPointerTypeEnum.HUGE_REVERSED,
      ].map((t) => Padding(
            padding: const EdgeInsets.all(3.0),
            child: _ArrowTypeOption(
              arrowType: t,
              arrowColor: tc.bgColor(),
              isActive: _arrowType == t,
              onPressed: () => _onPressed(t, tc, tc.animatePointer??false),
            ),
          ))
    ];
    if (tc.targetPointerTypeEnum != TargetPointerTypeEnum.NONE.index &&
        tc.targetPointerTypeEnum != TargetPointerTypeEnum.POINTY.index) {
      widgets.add(
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: tc.animatePointer??false ? Colors.white : Colors.white60),
          child: const SizedBox(
            width: 75,
            child: Text(
              'animate',
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            setState(() => _animate = !_animate);
            tc.animatePointer = _animate;
            _onPressed(tc.targetPointerTypeEnum!, tc, tc.animatePointer??false);
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
  final TargetPointerTypeEnum arrowType;
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
        child: arrowType == TargetPointerTypeEnum.NONE
            ? Icon(Icons.rectangle_rounded, color: arrowColor)
            : arrowType == TargetPointerTypeEnum.POINTY
                ? Icon(Icons.messenger, color: arrowColor)
                : arrowType == TargetPointerTypeEnum.VERY_THIN
                    ? Icon(Icons.south_west, color: arrowColor, size: 15)
                    : arrowType == TargetPointerTypeEnum.VERY_THIN_REVERSED
                        ? Icon(Icons.north_east, color: arrowColor, size: 15)
                        : arrowType == TargetPointerTypeEnum.THIN
                            ? Icon(Icons.south_west,
                                color: arrowColor, size: 20)
                            : arrowType == TargetPointerTypeEnum.THIN_REVERSED
                                ? Icon(Icons.north_east,
                                    color: arrowColor, size: 20)
                                : arrowType == TargetPointerTypeEnum.MEDIUM
                                    ? Icon(Icons.south_west,
                                        color: arrowColor, size: 25)
                                    : arrowType == TargetPointerTypeEnum.MEDIUM_REVERSED
                                        ? Icon(Icons.north_east,
                                            color: arrowColor, size: 25)
                                        : arrowType == TargetPointerTypeEnum.LARGE
                                            ? Icon(Icons.south_west,
                                                color: arrowColor, size: 35)
                                            : arrowType ==
                                                    TargetPointerTypeEnum.LARGE_REVERSED
                                                ? Icon(Icons.north_east,
                                                    color: arrowColor, size: 35)
                                                // : arrowType == TargetPointerTypeEnum.HUGE
                                                //     ? Icon(Icons.south_west, color: arrowColor, size: 40)
                                                : Icon(Icons.north_east,
                                                    color: arrowColor,
                                                    size: 40),
      ),
    );
  }
}
