// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

import 'positioned_target_cover.dart';
import 'positioned_target_cover_btn.dart';

class TargetsWrapper extends StatefulWidget {
  final TargetsWrapperName name;
  final Widget child;
  final bool hardEdge;

  TargetsWrapper({
    required this.name,
    required this.child,
    this.hardEdge = true,
    required super.key
  });

  @override
  State<TargetsWrapper> createState() => TargetsWrapperState();

  // static TargetsWrapperState? of(BuildContext context) =>
  //     context.findAncestorStateOfType<TargetsWrapperState>();

  /// the following statics are actually all UI-related and span all blocs...
  // can have multiple transformable widgets and preferredSize widgets under the MaterialApp
  // want new sizes to be available immediately after changing, hence not part of bloc, but static (global) instead
  // keys are wrapper name (WidgetWrapper or ImageWrapper)
  static Map<String, Offset> iwPosMap = {};
  static Map<String, Size> iwSizeMap = {};
  static Size iwSize(String wName) => iwSizeMap[wName] ?? Size.zero;
  static Offset iwPos(String wName) => iwPosMap[wName] ?? Offset.zero;
  static Rect wwRect(String wName) => Rect.fromLTWH(
        iwPos(wName).dx,
        iwPos(wName).dy,
        iwSize(wName).width,
        iwSize(wName).height,
      );

  static Alignment? calcTargetAlignmentWithinTargetsWrapper(String twName, TargetConfig tc) {
    Rect? wrapperRect = (FC().parentTW(twName)?.widget.key as GlobalKey)
        .globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
    Rect? targetRect = FC()
        .getMultiTargetGk(tc.uid.toString())!
        .globalPaintBounds();
    if (wrapperRect == null || targetRect == null) return null;

    return Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
  }

// static void hideAllTargets({required CAPIBloc bloc, required String name, final TargetConfig? exception}) {
//   CAPITargetConfig? config = bloc.state.imageConfig(name);
//   if (config != null) {
//     for (int i = 0; i < config.imageTargets.length; i++) {
//       TargetConfig? tc = bloc.state.target(name, i);
//       if (tc != exception) tc?.visible = false;
//     }
//   }
// }
//
// static void showAllTargets({required CAPIBloc bloc, required String name}) {
//   if (!bloc.state.aTargetIsSelected()) {
//     for (TargetConfig tc in bloc.state.imageConfig(name)?.imageTargets ?? []) {
//       tc.visible = true;
//     }
//   }
// }
}

class TargetsWrapperState extends State<TargetsWrapper> {
  // Rect? _selectedTargetRect;

  Offset? savedChildLocalPosPc;

  Timer? _sizeChangedTimer;
  // bool playing = false;

  double? scrollOffset;

  // Orientation? _lastO;

  CAPIBloC get bloc => FC().capiBloc;

  late TargetConfig tcToPlay;

  ZoomerState? get zoomer => Zoomer.of(context)!;

  @override
  void initState() {
    super.initState();

    FC().targetsWrappers[widget.name] = widget.key as GlobalKey;


    if (zoomer?.widget.ancestorHScrollController != null) {
      FC().registerScrollController(zoomer!.widget.ancestorHScrollController!);
    }
    if (zoomer?.widget.ancestorVScrollController != null) {
      FC().registerScrollController(zoomer!.widget.ancestorVScrollController!);
    }

    Useful.afterNextBuildDo(
      () {
        // register ww with AppWrapper
        measureIWPosAndSize();
        // if (widget.key != null) {
        //   Measuring.findGlobalRect(widget.key! as GlobalKey);
        //   // Size size = CAPIState.iwSize(widget.name);
        //   // debugPrint("${widget.name} size: ${size.toString()}");
        // }
        // ImageWrapperAuto.showAllTargets(bloc: bloc, name: widget.name);
        // showDottedBorderCallout(
        //   widget.name,
        //   widget.ancestorHScrollController,
        //   widget.ancestorVScrollController,
        //   1000,
        // );
      },
    );
  }

  // @override
  // void didChangeDependencies() {
  //   Useful.latestContext = context;
  //   super.didChangeDependencies();
  // }

  void measureIWPosAndSize() {
    var newPosAndSize = (widget.key as GlobalKey).globalPosAndSize();

    Offset? globalPos;
    try {
      globalPos = newPosAndSize.$1?.translate(
        zoomer?.widget.ancestorHScrollController?.offset ?? 0.0,
        zoomer?.widget.ancestorVScrollController?.offset ?? 0.0,
      );
      if (globalPos != null) {
        // debugPrint('TargetGroupWrapper.iwPosMap[${widget.name}] = ${globalPos.toString()}');
        // debugPrint('TargetGroupWrapper.iwSizeMap[${widget.name}] = ${newPosAndSize.$2!}');
        TargetsWrapper.iwPosMap[widget.name] = globalPos;
        TargetsWrapper.iwSizeMap[widget.name] = newPosAndSize.$2!;
      }
    } catch (e) {
      // ignore but then don't update pos
      debugPrint('measureIWPosAndSizze! ${e.toString()}');
    }
  }
  // @override
  // void didChangeMetrics() {
  //   debugPrint("***  didChangeMetrics  ***");
  //   measureIWPos();
  // }

// @override
// void didUpdateWidget(Object oldWidget) {
//   debugPrint("didUpdateWidget");
// }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // BlocListener<CAPIBloc, CAPIState> _justChangedSelectedTargetRadiusOrZoom() => BlocListener<CAPIBloc, CAPIState>(
  //       listenWhen: (CAPIState previous, CAPIState current) {
  //         bool result = current.selectedTarget?.wName == widget.name &&
  //             (current.selectedTarget?.radius != previous.selectedTarget?.radius ||
  //                 current.selectedTarget?.transformScale != previous.selectedTarget?.transformScale);
  //         if (result) debugPrint('_justChangedSelectedTargetRadiusOrZoom: ${current.selectedTarget?.radius}, ${previous.selectedTarget?.radius}');
  //         return result;
  //       },
  //       listener: (context, state) {
  //         TargetConfig? selectedTarget = state.selectedTarget;
  //         if (selectedTarget != null) {
  //           Useful.afterMsDelayPassBlocAndDo(50, bloc, (bloC) {
  //             if (isShowingTargetConfigCallout()) {
  //               removeTargetConfigToolbarCallout();
  //               if (!isShowingTargetConfigCallout() && transformableWidgetWrapperState != null) {
  //                 showTargetConfigToolbarCallout(
  //                   transformableWidgetWrapperState!,
  //                   selectedTarget,
  //                   widget.ancestorHScrollController,
  //                   widget.ancestorVScrollController,
  //                 );
  //               }
  //             }
  //             if (isShowingHelpContentCallout()) {
  //               removeHelpContentEditorCallout();
  //               if (!isShowingHelpContentCallout()) {
  //                 showHelpContentCallout(tc, true, widget.ancestorHScrollController, widget.ancestorVScrollController);
  //               }
  //             }
  //           });
  //         }
  //       },
  //     );
  //
  // BlocListener<CAPIBloc, CAPIState> _justChangedSelectedTargetArrowType() => BlocListener<CAPIBloc, CAPIState>(
  //       listenWhen: (CAPIState previous, CAPIState current) {
  //         return current.selectedTarget?.wName == widget.name && current.selectedTarget?.arrowType != previous.selectedTarget?.arrowType;
  //       },
  //       listener: (context, state) {
  //         TargetConfig? selectedTarget = state.selectedTarget;
  //         if (selectedTarget != null) {
  //           if (isShowingHelpContentCallout()) {
  //             removeHelpContentEditorCallout();
  //             showHelpContentCallout(selectedTarget, true, widget.ancestorHScrollController, widget.ancestorVScrollController);
  //           }
  //         }
  //       },
  //     );

  // BlocListener<CAPIBloc, CAPIState> _justSelectedATarget() => BlocListener<CAPIBloc, CAPIState>(
  //         // just selected a target
  //         listenWhen: (CAPIState previous, CAPIState current) {
  //       return current.aTargetIsSelected() && current.selectedTarget?.wName == widget.name && !previous.aTargetIsSelected();
  //     }, listener: (context, state) {
  //       TargetConfig selectedTc = state.selectedTarget!;
  //       TransformableWidgetWrapperState? parentState = TransformableWidgetWrapper.of(context);
  //       if (parentState != null) {
  //         Rect? wrapperRect = findGlobalRect(CAPIState.gk(widget.name)!);
  //         Rect? targetRect = findGlobalRect(selectedTc.gk());
  //         if (wrapperRect != null && targetRect != null) {
  //           ImageWrapperAuto.hideAllTargets(bloc: bloc, name: widget.name, exception: selectedTc);
  //           Alignment ta = Useful.calcTargetAlignment(wrapperRect, targetRect);
  //           // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
  //           parentState.applyTransform(selectedTc.transformScale, selectedTc.transformScale, ta, afterTransformF: (bloC) {
  //             showTargetConfigToolbarCallout(bloC, widget.ancestorHScrollController, widget.ancestorVScrollController);
  //             // showHelpContentCallout(selectedTc, widget.ancestorHScrollController, widget.ancestorVScrollController);
  //           });
  //         }
  //       }
  //     });

  // BlocListener<CAPIBloc, CAPIState> _justClearedSelection() => BlocListener<CAPIBloc, CAPIState>(
  //       // just cleared selection
  //       listenWhen: (CAPIState previous, CAPIState current) {
  //         return previous.aTargetIsSelected() && previous.selectedTarget?.wName == widget.name && !current.aTargetIsSelected();
  //       },
  //       listener: (context, state) {
  //         _backToNormal();
  //       },
  //     );
  //
  // void _backToNormal() {
  //   Callout.removeOverlay(CAPI.ANY_TOAST.feature(), true);
  //   removeRadiusAndZoomCallout();
  //   removeTargetDurationCallout();
  //   removeHelpContentEditorCallout();
  //   // removeTargetConfigToolbarCallout();
  //   // TransformableWidgetWrapperState? parentState = TransformableWidgetWrapper.of(context);
  //   // parentState?.resetTransform();
  //   ImageWrapperAuto.showAllTargets(bloc: bloc, name: widget.name);
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return _stack(bloc);
  // }

  @override
  Widget build(BuildContext context) {
    CAPIBloC bloc = FC().capiBloc;
    return _stack(bloc);
    // debugPrint("TargetGroupWrapperState.build");
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        // debugPrint("CAPIWidgetWrapperState on Size Change Notification - ${widget.name}");
        // removeDottedBorderCallout();
        // update size at end of resize
        _sizeChangedTimer?.cancel();
        _sizeChangedTimer = Timer(const Duration(milliseconds: 500), () {
          bloc.add(const CAPIEvent.forceRefresh());
          Useful.afterNextBuildDo(() {
            debugPrint('SizeChangedLayoutNotification: measureIWPos...');
            measureIWPosAndSize();
          });
        });
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: SizedBox(
          child: _stack(bloc),
        ),
      ),
    );
  }

  Stack _stack(CAPIBloC bloc) {
    // TargetGroupConfig? config = state.imageConfig(widget.name);
    return Stack(
      clipBehavior: widget.hardEdge ? Clip.hardEdge : Clip.none,
      children: [
        // if (!state.aTargetIsSelected())
        // RESUMED NO SELECTION - LONG-PRESSABLE BARRIER
        _no_selection_long_pressable_barrier_build(bloc),
        _image_child_build(bloc.state),
        // PLAYING BUILD
        for (TargetConfig tc
            in bloc.state.imageConfig(widget.name)?.targets ?? [])
          if (!bloc.state.hideAllTargetGroups &&
              (bloc.state.hideTargetsExcept == null ||
                  bloc.state.hideTargetsExcept == tc))
            // if (!state.aTargetIsSelected() || state.selectedTarget!.uid == tc.uid )
            PositionedTarget(
              twName: widget.name,
              initialTC: tc,
            ),
        // if (!state.aTargetIsSelected() && transformableWidgetWrapperState != null)
        if (zoomer != null)
          for (var tc in bloc.state.imageConfig(widget.name)?.targets ??
              [].where((el) => el.showBtn))
            // if (state.hideTargetsExcept == null && tc.visible)
            if (!bloc.state.hideAllTargetGroupPlayBtns)
              PositionedTargetPlayBtn(
                twName: widget.name,
                initialTC: tc,
              ),
        // if (!state.isSuspended(widget.name) && (state.aTargetIsSelected(widget.name)))
        //   buildPositionedDraggableTarget(state.selectedTarget(widget.name)!),
        // if (bloc.state.playList.isNotEmpty) buildPositionedTargetForPlay(tcToPlay),
      ],
    );
  }

  // void _suspendResumeButtonPressF({bool forceSuspend = false}) {
  //   if (!forceSuspend && bloc.state.isSuspended(widget.name)) {
  //     Size size = CAPIState.iwSize(widget.name);
  //     bloc.add(CAPIEvent.resume(wName: widget.name));
  //   } else {
  //     removeDottedBorderCallout();
  //     bloc.add(CAPIEvent.suspendAndCopyToJson(wName: widget.name));
  //   }
  // }

  // Positioned buildPositionedTargetForPlay(TargetConfig tc) {
  //   FC().setMultiTargetGk(tc.uid.toString(), GlobalKey());
  //   double radius = tc.radiusPc != null
  //       ? tc.radiusPc! * TargetsWrapper.iwSize(tc.wName).width
  //       : 30;
  //   return Positioned(
  //     top: tc.targetStackPos().dy - radius,
  //     left: tc.targetStackPos().dx - radius,
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: FUCHSIA_X.withOpacity(.2), shape: BoxShape.circle),
  //       //color:Colors.pink.withOpacity(.2),
  //       key: FC().setMultiTargetGk(tc.uid.toString(), GlobalKey()),
  //       width: radius * 2,
  //       height: radius * 2,
  //     ),
  //   );
  // }

  // Widget _suspended_build() => MeasureSizeBox(
  //       // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
  //       onSizedCallback: (Size size) {
  //         CAPIState.iwSizeMap[widget.name] = size;
  //         // debugPrint("MeasureSizeBox => ${size.toString()}");
  //       },
  //       child: widget.aspectRatio != null
  //           ? AspectRatio(
  //               aspectRatio: widget.aspectRatio!,
  //               child: widget.imageF.call(),
  //             )
  //           : widget.imageF.call(),
  //     );

  Widget _no_selection_long_pressable_barrier_build(CAPIBloC bloc) =>
      GestureDetector(
        // onTapDown: (_) {
        //   debugPrint("_no_selection_long_pressable_barrier_build tapped.");
        //   TargetConfig? selectedTC = bloc.state.hideTargetsExcept;
        //   if (Callout.anyPresent([snippetCalloutFeature(selectedTC?.snippetName ?? '')])) {
        //     parentTW?.resetTransform();
        //     removeSnippetContentCallout(selectedTC!.snippetName);
        //     bloc.add(const CAPIEvent.unhideAllTargetGroups());
        //     unhideAllSingleTargetBtns();
        //     Callout.removeOverlay(snippetCalloutFeature(bloc.state.selectedTarget!.snippetName));
        //   }
        // },
        // long press creates a new target for this TargetWrapper
        onLongPressStart: (LongPressStartDetails details) {
          bloc.add(const CAPIEvent.hideAllTargetGroups());
          bloc.add(
            CAPIEvent.newTarget(
              wName: widget.name,
              newGlobalPos: details.globalPosition.translate(
                zoomer?.widget.ancestorHScrollController?.offset ?? 0.0,
                zoomer?.widget.ancestorVScrollController?.offset ?? 0.0,
              ),
            ),
          );
          Useful.afterNextBuildDo(() {
            bloc.add(const CAPIEvent.unhideAllTargetGroups());
            Useful.afterNextBuildDo(() {
              // TargetGroupConfig? mtc = bloc.state.targetGroupMap[widget.name];
              bloc.add(const CAPIEvent.saveModel());
            });
          });
        },
        child: SizedBox.fromSize(
          size: TargetsWrapper.iwSize(widget.name),
          child: ModalBarrier(
            color: !bloc.state.playList.isNotEmpty
                ? Colors.purple.withOpacity(.25)
                : null,
            dismissible: false,
          ),
        ),
      );

  Widget _image_child_build(final CAPIState state) {
    // var sizeMap = CAPIState.iwSizeMap;
    //debugPrint("sizeMap: ${sizeMap.toString()}");
    // var gkMap = CAPIState.gkMap;
    // debugPrint("gkMap: ${gkMap.toString()}");
    return TargetsWrapper.iwSizeMap.containsKey(widget.name)
        ? IgnorePointer(
            ignoring: true, //!state.aTargetIsSelected(),
            child: MeasureSizeBox(
              // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
              onSizedCallback: (Size size) {
                TargetsWrapper.iwSizeMap[widget.name] = size;
                // debugPrint("MeasureSizeBox => ${size.toString()}");
              },
              child: widget.child,
            ),
          )
        : MeasureSizeBox(
            // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
            onSizedCallback: (Size size) {
              TargetsWrapper.iwSizeMap[widget.name] = size;
              // debugPrint("MeasureSizeBox => ${size.toString()}");
              // force a rebuild with the measured size
              Useful.afterNextBuildDo(() {
                setState(() {});
              });
            },
            child: widget.child,
          );
  }
}

class IntegerCircleAvatar extends StatelessWidget {
  final TargetConfig tc;
  final int? num;
  final Color textColor;
  final Color bgColor;
  final double radius;
  final double fontSize;

  const IntegerCircleAvatar(this.tc,
      {this.num,
      required this.textColor,
      required this.bgColor,
      required this.radius,
      required this.fontSize,
      super.key});

  CAPIBloC get bloc => FC().capiBloc;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: const Color.fromRGBO(255,0,0,.01),
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
                          style:
                              TextStyle(color: textColor, fontSize: fontSize),
                        ),
                      )),
                ),
        ),
      );
}
