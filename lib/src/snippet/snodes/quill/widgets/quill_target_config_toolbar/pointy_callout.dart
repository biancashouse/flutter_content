import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';

class PointyTool extends StatefulWidget {
  final CalloutConfig cc;
  final QuillTargetModel tc;
  final QuillTextNode parentQuillTextNode;
  final void Function(QuillTargetModel)? onTargetConfigChange;
  final ScrollConfig? sc;
  final bool justPlaying;

  const PointyTool(
    this.cc,
    this.tc, {
    required this.justPlaying,
    required this.parentQuillTextNode,
    this.onTargetConfigChange,
    this.sc,
    super.key,
  });

  @override
  State<PointyTool> createState() => _PointyToolState();

  static void show(
    CalloutConfig cc,
    QuillTargetModel tc, {
    ScrollConfig? sc,
    required bool justPlaying,
    required QuillTextNode parentNode,
    void Function(QuillTargetModel)? onTargetConfigChange,
  }) {
    // GlobalKey? targetGK = tc.gk;

    fco.showOverlay(
      // targetGK: targetGK,
      calloutContent: PointyTool(
        cc,
        tc,
        justPlaying: justPlaying,
        parentQuillTextNode: parentNode,
        sc: sc,
        onTargetConfigChange: onTargetConfigChange,
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
      ),
    );
  }

  static bool isShowing() => fco.anyPresent(["arrow-type"]);
}

class _PointyToolState extends State<PointyTool> {
  late TargetPointerTypeEnum _arrowType;
  late bool _animate;

  QuillTargetModel get tc => widget.tc;

  CAPIBloC get bloc => fco.capiBloc;

  @override
  void initState() {
    super.initState();
    _arrowType = tc.targetPointerTypeEnum ?? TargetPointerTypeEnum.THIN;
    _animate = tc.animatePointer ?? false;
  }

  void _onPressed(TargetPointerTypeEnum t, QuillTargetModel tc, bool animate) {
    setState(() => _arrowType = t);
    tc.targetPointerTypeEnum = t;
    widget.onTargetConfigChange?.call(tc);
    fco.dismiss("arrow-type");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ...[TargetPointerTypeEnum.NONE, TargetPointerTypeEnum.POINTY, TargetPointerTypeEnum.WAVY].map(
        (t) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: _ArrowTypeOption(
            arrowType: t,
            arrowColor: tc.bgColor(),
            isActive: _arrowType == t,
            onPressed: () => _onPressed(t, tc, tc.animatePointer ?? false),
          ),
        ),
      ),
      const SizedBox(width: 50,),
      ...[
        TargetPointerTypeEnum.VERY_THIN,
        TargetPointerTypeEnum.THIN,
        TargetPointerTypeEnum.MEDIUM,
        TargetPointerTypeEnum.LARGE,
        // TargetPointerTypeEnum.HUGE,
      ].map(
        (t) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: _ArrowTypeOption(
            arrowType: t,
            arrowColor: tc.bgColor(),
            isActive: _arrowType == t,
            onPressed: () => _onPressed(t, tc, tc.animatePointer ?? false),
          ),
        ),
      ),
      ...[
        TargetPointerTypeEnum.VERY_THIN_REVERSED,
        TargetPointerTypeEnum.THIN_REVERSED,
        TargetPointerTypeEnum.MEDIUM_REVERSED,
        TargetPointerTypeEnum.LARGE_REVERSED,
        // TargetPointerTypeEnum.HUGE_REVERSED,
      ].map(
        (t) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: _ArrowTypeOption(
            arrowType: t,
            arrowColor: tc.bgColor(),
            isActive: _arrowType == t,
            onPressed: () => _onPressed(t, tc, tc.animatePointer ?? false),
          ),
        ),
      ),
    ];
    if (tc.targetPointerTypeEnum != TargetPointerTypeEnum.NONE.index &&
        tc.targetPointerTypeEnum != TargetPointerTypeEnum.POINTY.index) {
      widgets.add(
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: tc.animatePointer ?? false
                ? Colors.white
                : Colors.white60,
          ),
          child: const SizedBox(
            width: 66,
            child: Text('animate', textAlign: TextAlign.center),
          ),
          onPressed: () {
            setState(() => _animate = !_animate);
            tc.animatePointer = _animate;
            _onPressed(
              tc.targetPointerTypeEnum!,
              tc,
              tc.animatePointer ?? false,
            );
            fco.dismiss("arrow-type");
            // fco.afterNextBuildDo(() {
            //   reshowSnippetContentCallout(tc, widget.allowButtonCallouts, widget.justPlaying, widget.onDiscardedF);
            // });
          },
        ),
      );
    }
    return Center(child: Wrap(children: widgets));
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
    Color bgColor = arrowColor == Colors.white
        ? Colors.black26
        : Colors.black12;
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
            ? Icon(Icons.south_west, color: arrowColor, size: 20)
            : arrowType == TargetPointerTypeEnum.THIN_REVERSED
            ? Icon(Icons.north_east, color: arrowColor, size: 20)
            : arrowType == TargetPointerTypeEnum.MEDIUM
            ? Icon(Icons.south_west, color: arrowColor, size: 25)
            : arrowType == TargetPointerTypeEnum.MEDIUM_REVERSED
            ? Icon(Icons.north_east, color: arrowColor, size: 25)
            : arrowType == TargetPointerTypeEnum.LARGE
            ? Icon(Icons.south_west, color: arrowColor, size: 35)
            : arrowType == TargetPointerTypeEnum.LARGE_REVERSED
            ? Icon(Icons.north_east, color: arrowColor, size: 35)
            : arrowType == TargetPointerTypeEnum.WAVY
            ? Icon(Icons.waves, color: arrowColor, size: 15)
            : Icon(Icons.north_east, color: arrowColor, size: 40),
      ),
    );
  }
}
