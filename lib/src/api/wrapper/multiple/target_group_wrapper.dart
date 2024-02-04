// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/wrapper/transformable_scaffold.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:get_it/get_it.dart';

import 'positioned_target_cover.dart';
import 'positioned_target_cover_btn.dart';

class TargetGroupWrapper extends StatefulWidget {
  final TargetGroupWrapperName name;
  final Widget child;
  final bool hardEdge;

  TargetGroupWrapper({
    required this.name,
    required this.child,
    this.hardEdge = true,
  }) : super(key: GlobalKey());

  @override
  State<TargetGroupWrapper> createState() => TargetGroupWrapperState();

  static TargetGroupWrapperState? of(BuildContext context) => context.findAncestorStateOfType<TargetGroupWrapperState>();

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

class TargetGroupWrapperState extends State<TargetGroupWrapper> {
  // Rect? _selectedTargetRect;

  Offset? savedChildLocalPosPc;

  Timer? _sizeChangedTimer;
  bool targetCreationInProgress = false;

  double? scrollOffset;

  // Orientation? _lastO;

  CAPIBloC get bloc => CAPIBloC.I;

  TransformableScaffoldState? get parentTW => TransformableScaffold.of(context);

  late TargetConfig tcToPlay;

  @override
  void initState() {
    super.initState();

    if (parentTW?.widget.ancestorHScrollController != null) CAPIState.registerScrollController(parentTW!.widget.ancestorHScrollController!);
    if (parentTW?.widget.ancestorVScrollController != null) CAPIState.registerScrollController(parentTW!.widget.ancestorVScrollController!);

    Useful.afterNextBuildDo(() {
      // register ww with AppWrapper
      measureIWPos();
      // if (widget.key != null) {
      //   Measuring.findGlobalRect(widget.key! as GlobalKey);
      //   // Size size = CAPIState.iwSize(widget.name);
      //   // print("${widget.name} size: ${size.toString()}");
      // }
      // ImageWrapperAuto.showAllTargets(bloc: bloc, name: widget.name);
      // showDottedBorderCallout(
      //   widget.name,
      //   widget.ancestorHScrollController,
      //   widget.ancestorVScrollController,
      //   1000,
      // );
    });
  }

  // @override
  // void didChangeDependencies() {
  //   Useful.instance.initWithContext(context, force: true);
  //   super.didChangeDependencies();
  // }

  void measureIWPos() {
    Offset? globalPos;
    try {
      globalPos = Useful.findGlobalPos(widget.key as GlobalKey)?.translate(
        parentTW?.widget.ancestorHScrollController?.offset ?? 0.0,
        parentTW?.widget.ancestorVScrollController?.offset ?? 0.0,
      );
    } catch (e) {
      // ignore but then don't update pos
    }
    if (globalPos != null) {
      CAPIState.iwPosMap[widget.name] = globalPos;
    }
  }

  // @override
  // void didChangeMetrics() {
  //   print("***  didChangeMetrics  ***");
  //   measureIWPos();
  // }

// @override
// void didUpdateWidget(Object oldWidget) {
//   print("didUpdateWidget");
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
  //         if (result) print('_justChangedSelectedTargetRadiusOrZoom: ${current.selectedTarget?.radius}, ${previous.selectedTarget?.radius}');
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
    CAPIBloC bloc = CAPIBloC.I;
    // print("TargetGroupWrapperState.build");
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        // print("CAPIWidgetWrapperState on Size Change Notification - ${widget.name}");
        // removeDottedBorderCallout();
        // update size at end of resize
        _sizeChangedTimer?.cancel();
        _sizeChangedTimer = Timer(const Duration(milliseconds: 500), () {
          measureIWPos();
          // if (widget.key != null) {
          //   Measuring.findGlobalRect(widget.key as GlobalKey);
          //   // Size size = CAPIState.iwSize(widget.name);
          //   // print("${widget.name} size: ${size.toString()}");
          // }
        });
        Useful.afterNextBuildDo(() {
          measureIWPos();
          // if (widget.key != null) {
          //   Measuring.findGlobalRect(widget.key as GlobalKey);
          //   // Size size = CAPIState.iwSize(widget.name);
          //   // print("${widget.name} size: ${size.toString()}");
          // }
        });
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: BlocBuilder<CAPIBloC, CAPIState>(buildWhen: (previous, current) {
          // suspendws OR resumed OR selection changed
          return true; //previous.isSuspended(widget.name) != current.isSuspended(widget.name) //||
          // previous.selectedTarget(widget.name) != current.selectedTarget(widget.name) ||
              ; //previous.isPlaying != current.isPlaying;
        }, builder: (context, CAPIState state) {
          // print("--- ${widget.name} builder");
          return SizedBox(
            child: _stack(bloc),
          );
          // cannot show any CC functionality until not suspended and have measured the child (i.e. after 1st build)
        }),
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
        for (TargetConfig tc in bloc.state
            .imageConfig(widget.name)
            ?.targets ?? [])
          if (!bloc.state.hideAllTargetGroups && (bloc.state.hideTargetsExcept == null || bloc.state.hideTargetsExcept == tc))
          // if (!state.aTargetIsSelected() || state.selectedTarget!.uid == tc.uid )
            PositionedTarget(
              name: widget.name,
              initialTC: tc,
            ),
        // if (!state.aTargetIsSelected() && transformableWidgetWrapperState != null)
        if (parentTW != null)
          for (var tc in bloc.state
              .imageConfig(widget.name)
              ?.targets ?? [].where((el) => el.showBtn))
          // if (state.hideTargetsExcept == null && tc.visible)
            if (!bloc.state.hideAllTargetGroupPlayBtns)
              PositionedTargetCoverBtn(
                transformableScaffoldState: parentTW!,
                name: widget.name,
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

  Positioned buildPositionedTargetForPlay(TargetConfig tc) {
    GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()] = GlobalKey();
    double radius = tc.radius;
    return Positioned(
      top: tc
          .targetStackPos()
          .dy - radius,
      left: tc
          .targetStackPos()
          .dx - radius,
      child: Container(
        decoration: BoxDecoration(color: FUCHSIA_X.withOpacity(.2), shape: BoxShape.circle),
        //color:Colors.pink.withOpacity(.2),
        key: GetIt.I.get<GKMap>(instanceName: getIt_multiTargets)[tc.uid.toString()] = GlobalKey(),
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }

  // Widget _suspended_build() => MeasureSizeBox(
  //       // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
  //       onSizedCallback: (Size size) {
  //         CAPIState.iwSizeMap[widget.name] = size;
  //         // print("MeasureSizeBox => ${size.toString()}");
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
        //   print("_no_selection_long_pressable_barrier_build tapped.");
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
                parentTW?.widget.ancestorHScrollController?.offset ?? 0.0,
                parentTW?.widget.ancestorVScrollController?.offset ?? 0.0,
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
          size: CAPIState.iwSize(widget.name),
          child: ModalBarrier(
            color: !bloc.state.playList.isNotEmpty ? Colors.purple.withOpacity(.25) : null,
            dismissible: false,
          ),
        ),
      );

  Widget _image_child_build(final CAPIState state) {
    // var sizeMap = CAPIState.iwSizeMap;
    //print("sizeMap: ${sizeMap.toString()}");
    // var gkMap = CAPIState.gkMap;
    // print("gkMap: ${gkMap.toString()}");
    return CAPIState.iwSizeMap.containsKey(widget.name)
        ? IgnorePointer(
      ignoring: true, //!state.aTargetIsSelected(),
      child: MeasureSizeBox(
        // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
        onSizedCallback: (Size size) {
          CAPIState.iwSizeMap[widget.name] = size;
          // print("MeasureSizeBox => ${size.toString()}");
        },
        child: widget.child,
      ),
    )
        : MeasureSizeBox(
      // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
      onSizedCallback: (Size size) {
        CAPIState.iwSizeMap[widget.name] = size;
        // print("MeasureSizeBox => ${size.toString()}");
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
  final bool selected;
  final double radius;
  final double fontSize;

  const IntegerCircleAvatar(this.tc,
      {this.num, required this.textColor, required this.bgColor, required this.radius, required this.fontSize, this.selected = false, super.key});

  CAPIBloC get bloc => CAPIBloC.I;

  @override
  Widget build(BuildContext context) =>
      CircleAvatar(
        backgroundColor: Colors.black.withOpacity(.1),
        radius: radius + 2,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: radius + 1,
          child: bloc.state.hideTargetsExcept != null
              ? const Offstage()
              : CircleAvatar(
            foregroundColor: textColor,
            backgroundColor: selected ? Colors.white12 : bgColor,
            radius: radius,
            child: Container(
                decoration:  ShapeDecoration(
                    color: bgColor,
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.white),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '${num}',
                    style: TextStyle(color: textColor, fontSize: fontSize),
                  ),
                )),
          ),
        ),
      );
}
