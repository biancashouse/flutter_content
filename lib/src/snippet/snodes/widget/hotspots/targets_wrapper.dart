// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';

import 'positioned_target_play_btn.dart';
import 'target_cover.dart';

class TargetsWrapper extends StatefulWidget {
  final HotspotsNode parentNode;
  final Widget? child;
  final bool hardEdge;

  const TargetsWrapper(
      {required this.parentNode,
      this.child,
      this.hardEdge = true,
      required super.key});

  @override
  State<TargetsWrapper> createState() => TargetsWrapperState();

// static TargetsWrapperState? of(BuildContext context) =>
//     context.findAncestorStateOfType<TargetsWrapperState>();

  /// the following statics are actually all UI-related and span all blocs...
// can have multiple transformable widgets and preferredSize widgets under the MaterialApp
// want new sizes to be available immediately after changing, hence not part of bloc, but static (global) instead
// keys are wrapper name (WidgetWrapper or ImageWrapper)

// static Alignment? calcTargetAlignmentWithinTargetsWrapper(TargetModel tc, Rect wrapperRect) {
//
//   if (targetRect == null) return null;
//
//   return FCO.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
// }

// static void hideAllTargets({required CAPIBloc bloc, required String name, final TargetModel? exception}) {
//   CAPITargetModel? config = bloc.state.imageConfig(name);
//   if (config != null) {
//     for (int i = 0; i < config.imageTargets.length; i++) {
//       TargetModel? tc = bloc.state.target(name, i);
//       if (tc != exception) tc?.visible = false;
//     }
//   }
// }
//
// static void showAllTargets({required CAPIBloc bloc, required String name}) {
//   if (!bloc.state.aTargetIsSelected()) {
//     for (TargetModel tc in bloc.state.imageConfig(name)?.imageTargets ?? []) {
//       tc.visible = true;
//     }
//   }
// }
}

class TargetsWrapperState extends State<TargetsWrapper> {
  // Rect? _selectedTargetRect;

  // bool _needToMeasureSize = true;
  // bool _needToMeasurePos = true;
  bool _needToMeasureWrapperRect = true;
  late Rect wrapperRect;

  // Offset? wrapperPos;
  // Size? _wrapperSize;
  // Size get wrapperSize => _wrapperSize ?? MediaQuery.of(context).size;
  // set wrapperSize(Size newSize) => _wrapperSize = newSize;

  // Offset? savedChildLocalPosPc;

  // Timer? _sizeChangedTimer;
  TargetModel? _playingOrEditingTc; // gets set / reset by btn widgets
  void setPlayingOrEditingTc(newtC) => setState(() {
        _playingOrEditingTc = newtC;
      });

  get playingTc => _playingOrEditingTc;

  double? scrollOffset;

  // Orientation? _lastO;

  // late TargetModel tcToPlay;

  ZoomerState? get zoomer {
    if (context.mounted) {
      return Zoomer.of(context)!;
    } else {
      debugPrint('zoomer context NOT MOUNTED!');
    }
    return null;
  }

  @override
  void initState() {
    debugPrint('TargetsWrapperState initState');
    super.initState();

    for (TargetModel tc in widget.parentNode.targets) {
      tc.targetsWrapperNode = widget.parentNode;
    }

    fco.afterNextBuildDo(
      () {
        // if (zoomer?.widget.ancestorHScrollController != null) {
        //   FCO.registerScrollController(zoomer!.widget.ancestorHScrollController!);
        // }
        // if (zoomer?.widget.ancestorVScrollController != null) {
        //   FCO.registerScrollController(zoomer!.widget.ancestorVScrollController!);
        // }

        fco.afterMsDelayDo(1000, () {
          measureIWPosAndSize();
        });
      },
    );
  }

  void measureIWPosAndSize() {
    // debugPrint('measureIWPosAndSize');
    var newPosAndSize = (widget.key as GlobalKey).globalPosAndSize();

    Offset? globalPos;
    try {
      globalPos = newPosAndSize.$1?.translate(
        zoomer?.widget.ancestorHScrollController?.offset ?? 0,
        zoomer?.widget.ancestorVScrollController?.offset ?? 0,
      );
      if (globalPos != null) {
        // debugPrint('globalPos != null');
        // debugPrint('TargetGroupWrapper.iwPosMap[${widget.name}] = ${globalPos.toString()}');
        // debugPrint('TargetGroupWrapper.iwSizeMap[${widget.name}] = ${newPosAndSize.$2!}');
        Size wrapperSize = newPosAndSize.$2!;
        if (wrapperSize.width == 0 && wrapperSize.height == 0) {
          wrapperSize = fco.scrSize;
        }
        wrapperRect = Rect.fromLTWH(
          globalPos.dx,
          globalPos.dy,
          wrapperSize.width,
          wrapperSize.height,
        );
        debugPrint('measureIWPosAndSize: wrapper is ${wrapperSize.toString()}');
        _needToMeasureWrapperRect = false;
      }
    } catch (e) {
      // ignore but then don't update pos
      debugPrint('measureIWPosAndSize! ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_needToMeasureWrapperRect) {
      _needToMeasureWrapperRect = false;
      return _childBuild();
    }

    // when dragging a btn or cover ends
    void droppedBtnOrCover(DragTargetDetails<(TargetId, bool)> details) {
      var data = details.data;
      TargetId uid = data.$1;
      TargetModel? foundTc = widget.parentNode.findTarget(uid);
      // $2 true means target btn rather than target cover
      if (foundTc != null && data.$2) {
        foundTc.setBtnStackPosPc(details.offset.translate(
          FlutterContentApp.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
          FlutterContentApp.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
        ));
        foundTc.onChange();
      } else if (foundTc != null) {
        foundTc.setTargetStackPosPc(details.offset.translate(
          foundTc.radius,
          foundTc.radius,
        ));
        foundTc.onChange();
      }
      FlutterContentApp.capiBloc
          .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
    }

    //
    Future<void> longPressedeBarrier(LongPressEndDetails details) async {
      if (!fco.canEditContent) return;
      SnippetName? snippetName = widget.parentNode.rootNodeOfSnippet()?.name;
      if (snippetName == null) return;

      TargetId newTargetId = DateTime.now().millisecondsSinceEpoch;
      TargetModel newTC = TargetModel(
        uid: newTargetId, //event.wName.hashCode,
        snippetName: snippetName,
        // single: false,
      )..targetsWrapperNode = widget.parentNode;
      Offset newGlobalPos = details.globalPosition.translate(
        zoomer?.widget.ancestorHScrollController?.offset ?? 0.0,
        zoomer?.widget.ancestorVScrollController?.offset ?? 0.0,
      );
      newTC.setTargetStackPosPc(
        newGlobalPos,
      );
      bool onLeft = newTC.targetLocalPosLeftPc! < .5;
      newTC.btnLocalTopPc = newTC.targetLocalPosTopPc;
      newTC.btnLocalLeftPc =
          newTC.targetLocalPosLeftPc! + (onLeft ? .02 : -.02);

      widget.parentNode.targets = [...widget.parentNode.targets, newTC];
      // widget.parentNode.targets.add(newTC);
      FlutterContentApp.capiBloc
          .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));

      fco.possiblyCacheAndSaveANewSnippetVersion(
        snippetName: snippetName,
        rootNode: widget.parentNode.rootNodeOfSnippet()!,
      );
    }

    List<TargetModel> tcs = widget.parentNode.targets;

    return SizedBox.fromSize(
        size: wrapperRect.size,
        child: Stack(
          clipBehavior: widget.hardEdge ? Clip.hardEdge : Clip.none,
          children: [
            // BARRIER below IgnorePointer(child) - long-pressable
            DragTarget<(TargetId, bool)>(
              builder: (_, __, ___) {
                return SizedBox.fromSize(
                  size: wrapperRect.size,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('TAP');
                    },
                    onLongPressEnd: (LongPressEndDetails details) async =>
                        await longPressedeBarrier(details),
                  ),
                );
              },
              onAcceptWithDetails: droppedBtnOrCover,
            ),

            // CHILD, typically an image
            _childBuild(),

            // TARGET COVERS
            for (TargetModel tc in tcs)
              Positioned(
                top: tc.targetStackPos().dy - tc.radius,
                left: tc.targetStackPos().dx - tc.radius,
                child: Visibility.maintain(
                  key: fco.setTargetGk(
                      tc.uid, GlobalKey(debugLabel: tc.uid.toString())),
                  visible: fco.canEditContent &&
                      (playingTc == null || playingTc == tc),
                  child: TargetCover(tc, _targetIndex(tc)),
                ),
              ),

            // TARGET BUTTONS
            for (TargetModel tc in tcs)
              if (playingTc == null)
                PositionedTargetPlayBtn(
                  initialTC: tc,
                  index: _targetIndex(tc),
                  wrapperRect: wrapperRect,
                ),
          ],
        ));
  }

  int _targetIndex(TargetModel tc) => widget.parentNode.targets.indexOf(tc);

  Widget _childBuild() {
    Widget child = widget.child ??
        const Material(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Add a Child to the Targets Wrapper; \ne.g. an image over which \nyou will place callout targets'),
          ),
        );

    return Container(
      child: fco.canEditContent
          ? IgnorePointer(
              ignoring: true,
              child: child,
            )
          : child,
    );
  }
}

class IntegerCircleAvatar extends StatelessWidget {
  final TargetModel tc;
  final int? num;
  final Color textColor;
  final Color bgColor;
  final double radius;
  final double fontSize;
  final Widget? child;

  const IntegerCircleAvatar(this.tc,
      {this.num,
      required this.textColor,
      required this.bgColor,
      required this.radius,
      required this.fontSize,
      this.child,
      super.key});

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: const Color.fromRGBO(255, 0, 0, .01),
        radius: radius + 2,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: radius + 1,
          child: CircleAvatar(
            foregroundColor: textColor,
            backgroundColor: bgColor,
            radius: radius,
            child: Container(
                decoration: ShapeDecoration(
                    color: bgColor,
                    shape: const CircleBorder(
                      side: BorderSide(color: Colors.white),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '$num',
                    style: TextStyle(color: textColor, fontSize: fontSize),
                  ),
                )),
          ),
        ),
      );
}
