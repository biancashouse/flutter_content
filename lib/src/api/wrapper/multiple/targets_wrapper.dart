// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

import 'positioned_target_cover.dart';
import 'positioned_target_cover_btn.dart';

class TargetsWrapper extends StatefulWidget {
  final TargetGroupWrapperNode parentNode;
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

  static Alignment? calcTargetAlignmentWithinTargetsWrapper(TargetModel tc) {
    Rect? wrapperRect = tc.targetsWrapperGK
        ?.globalPaintBounds(); //Measuring.findGlobalRect(parentIW?.widget.key as GlobalKey);
    Rect? targetRect =
        FC().getMultiTargetGk(tc.uid.toString())!.globalPaintBounds();
    if (wrapperRect == null || targetRect == null) return null;

    return Useful.calcTargetAlignmentWithinWrapper(wrapperRect, targetRect);
  }

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

  bool _needToMeasure = true;
  late Offset wrapperPos;
  late Size _wrapperSize;
  Size get wrapperSize => _wrapperSize;
  set wrapperSize(Size newSize) => _wrapperSize = newSize;

  Offset? savedChildLocalPosPc;

  // Timer? _sizeChangedTimer;
  // bool playing = false;

  double? scrollOffset;

  // Orientation? _lastO;

  CAPIBloC get bloc => FC().capiBloc;

  late TargetModel tcToPlay;

  ZoomerState? get zoomer {
    if (context.mounted) {
      return Zoomer.of(context)!;
    } else {
      print('zoomer context');
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

    Useful.afterNextBuildDo(
      () {
        // if (zoomer?.widget.ancestorHScrollController != null) {
        //   FC().registerScrollController(zoomer!.widget.ancestorHScrollController!);
        // }
        // if (zoomer?.widget.ancestorVScrollController != null) {
        //   FC().registerScrollController(zoomer!.widget.ancestorVScrollController!);
        // }

        setState(() {
          measureIWPosAndSize();
          // measure child size
          var childGK = widget.child?.key as GlobalKey?;
          final renderObject = childGK?.currentContext?.findRenderObject();
          final translation =
              renderObject?.getTransformTo(null).getTranslation();
          Rect? paintBounds;
          try {
            paintBounds = renderObject?.paintBounds;
          } catch (e) {
            debugPrint(
                'paintBounds = renderObject?.paintBounds - ${e.toString()}');
          }
          wrapperSize = paintBounds?.size ?? MediaQuery.of(context).size;
          debugPrint('TargetsWrapper.child size: ${wrapperSize.toString()}');
        });
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

  // Rect wwRect(String wName) => Rect.fromLTWH(
  //       wrapperPos?.dx ?? 0,
  //       wrapperPos?.dy ?? 0,
  //       wrapperSize?.width ?? Useful.scrW,
  //       wrapperSize?.height ?? Useful.scrH,
  //     );

  // @override
  // void didChangeDependencies() {
  //   Useful.latestContext = context;
  //   super.didChangeDependencies();
  // }

  void measureIWPosAndSize() {
    debugPrint('measureIWPosAndSize');
    var newPosAndSize = (widget.key as GlobalKey).globalPosAndSize();

    Offset? globalPos;
    try {
      globalPos = newPosAndSize.$1?.translate(
        zoomer?.widget.ancestorHScrollController?.offset ?? 0.0,
        zoomer?.widget.ancestorVScrollController?.offset ?? 0.0,
      );
      if (globalPos != null) {
        debugPrint('globalPos != null');
        // debugPrint('TargetGroupWrapper.iwPosMap[${widget.name}] = ${globalPos.toString()}');
        // debugPrint('TargetGroupWrapper.iwSizeMap[${widget.name}] = ${newPosAndSize.$2!}');
        wrapperPos = globalPos;
        wrapperSize = newPosAndSize.$2!;
        //debugPrint('measureIWPosAndSize: wrapper is ${wrapperSize.toString()}');
      }
      _needToMeasure = false;
    } catch (e) {
      // ignore but then don't update pos
      debugPrint('measureIWPosAndSize! ${e.toString()}');
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
  //         TargetModel? selectedTarget = state.selectedTarget;
  //         if (selectedTarget != null) {
  //           Useful.afterMsDelayPassBlocAndDo(50, bloc, (bloC) {
  //             if (isShowingTargetModelCallout()) {
  //               removeTargetModelToolbarCallout();
  //               if (!isShowingTargetModelCallout() && transformableWidgetWrapperState != null) {
  //                 showTargetModelToolbarCallout(
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
  //         TargetModel? selectedTarget = state.selectedTarget;
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
  //       TargetModel selectedTc = state.selectedTarget!;
  //       TransformableWidgetWrapperState? parentState = TransformableWidgetWrapper.of(context);
  //       if (parentState != null) {
  //         Rect? wrapperRect = findGlobalRect(CAPIState.gk(widget.name)!);
  //         Rect? targetRect = findGlobalRect(selectedTc.gk());
  //         if (wrapperRect != null && targetRect != null) {
  //           ImageWrapperAuto.hideAllTargets(bloc: bloc, name: widget.name, exception: selectedTc);
  //           Alignment ta = Useful.calcTargetAlignment(wrapperRect, targetRect);
  //           // IMPORTANT applyTransform will destroy this context, so make state available for afterwards
  //           parentState.applyTransform(selectedTc.transformScale, selectedTc.transformScale, ta, afterTransformF: (bloC) {
  //             showTargetModelToolbarCallout(bloC, widget.ancestorHScrollController, widget.ancestorVScrollController);
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
  //   // removeTargetModelToolbarCallout();
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
    if (_needToMeasure) {
      // setState(() {});
      return const Offstage();
    }

    // CAPIBloC bloc = FC().capiBloc;
    return _stack(bloc);

    // debugPrint("TargetGroupWrapperState.build");
    // return NotificationListener<SizeChangedLayoutNotification>(
    //   onNotification: (SizeChangedLayoutNotification notification) {
    //     // debugPrint("CAPIWidgetWrapperState on Size Change Notification - ${widget.name}");
    //     // removeDottedBorderCallout();
    //     // update size at end of resize
    //     _sizeChangedTimer?.cancel();
    //     _sizeChangedTimer = Timer(const Duration(milliseconds: 500), () {
    //       bloc.add(const CAPIEvent.forceRefresh());
    //       Useful.afterNextBuildDo(() {
    //         debugPrint('SizeChangedLayoutNotification: measureIWPos...');
    //         measureIWPosAndSize();
    //       });
    //     });
    //     return true;
    //   },
    //   child: SizeChangedLayoutNotifier(
    //     child: SizedBox(
    //       child: _stack(bloc),
    //     ),
    //   ),
    // );
  }

  Widget _stack(CAPIBloC bloc) {
    // TargetGroupModel? config = state.imageConfig(widget.name);
    List<TargetModel> tcs = widget.parentNode.targets;
    return SizedBox.fromSize(
      size: wrapperSize,
      child: Stack(
        clipBehavior: widget.hardEdge ? Clip.hardEdge : Clip.none,
        children: [
          // if (!state.aTargetIsSelected())
          // RESUMED NO SELECTION - LONG-PRESSABLE BARRIER
          _no_selection_long_pressable_barrier_build(bloc),
          _childBuild(bloc.state),
          // PLAYING BUILD
          for (TargetModel tc in tcs)
            if (!bloc.state.hideAllTargetGroups &&
                (bloc.state.hideTargetsExcept == null ||
                    bloc.state.hideTargetsExcept == tc))
              // if (!state.aTargetIsSelected() || state.selectedTarget!.uid == tc.uid )
              PositionedTarget(
                tc,
                _targetIndex(tc),
              ),
          // if (!state.aTargetIsSelected() && transformableWidgetWrapperState != null)
          if (zoomer != null)
            for (var tc in tcs.where((el) => el.showBtn))
              // if (state.hideTargetsExcept == null && tc.visible)
              if (!bloc.state.hideAllTargetGroupPlayBtns)
                PositionedTargetPlayBtn(initialTC: tc, index: _targetIndex(tc)),
          // if (!state.isSuspended(widget.name) && (state.aTargetIsSelected(widget.name)))
          //   buildPositionedDraggableTarget(state.selectedTarget(widget.name)!),
          // if (bloc.state.playList.isNotEmpty) buildPositionedTargetForPlay(tcToPlay),
        ],
      ),
    );
  }

  int _targetIndex(TargetModel tc) => widget.parentNode.targets.indexOf(tc);

  // void _suspendResumeButtonPressF({bool forceSuspend = false}) {
  //   if (!forceSuspend && bloc.state.isSuspended(widget.name)) {
  //     Size size = CAPIState.iwSize(widget.name);
  //     bloc.add(CAPIEvent.resume(wName: widget.name));
  //   } else {
  //     removeDottedBorderCallout();
  //     bloc.add(CAPIEvent.suspendAndCopyToJson(wName: widget.name));
  //   }
  // }

  // Positioned buildPositionedTargetForPlay(TargetModel tc) {
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

  Widget _no_selection_long_pressable_barrier_build(CAPIBloC bloc) {
    // return GestureDetector(
    //   onTap: (){
    //     debugPrint('HOORAY!');
    //   },
    //     child: Container(color: Colors.red, width: 500, height: 500,));
    return GestureDetector(
      // onTap: () {
      //   debugPrint('_no_selection_long_pressable_barrier_build ontap');
      // },
      // onTapDown: (_) {
      //   debugPrint("_no_selection_long_pressable_barrier_build tapped.");
      //   TargetModel? selectedTC = bloc.state.hideTargetsExcept;
      //   if (Callout.anyPresent([snippetCalloutFeature(selectedTC?.snippetName ?? '')])) {
      //     parentTW?.resetTransform();
      //     removeSnippetContentCallout(selectedTC!.snippetName);
      //     bloc.add(const CAPIEvent.unhideAllTargetGroups());
      //     unhideAllSingleTargetBtns();
      //     Callout.removeOverlay(snippetCalloutFeature(bloc.state.selectedTarget!.snippetName));
      //   }
      // },
      //long press creates a new target for this TargetWrapper
      onLongPressStart: (LongPressStartDetails details) {
        if (!FC().canEditContent) return;
        SnippetName? snippetName = widget.parentNode.rootNodeOfSnippet()?.name;
        if (snippetName == null) return;
        bloc.add(const CAPIEvent.hideAllTargetGroups());
        TargetModelId newTargetId = DateTime.now().millisecondsSinceEpoch;
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

        widget.parentNode.targets.add(newTC);
        bloc.add(const CAPIEvent.forceRefresh());

        Useful.afterNextBuildDo(() {
          bloc.add(const CAPIEvent.unhideAllTargetGroups());
          Useful.afterNextBuildDo(() {
            // TargetGroupModel? mtc = bloc.state.targetGroupMap[widget.name];
            VersionId newVersionId =
                DateTime.now().millisecondsSinceEpoch.toString();
            FC().updateEditingVersionId(
                snippetName: snippetName, newVersionId: newVersionId);
            bloc.add(CAPIEvent.saveSnippet(
                snippetRootNode: widget.parentNode.rootNodeOfSnippet()!,
                newVersionId: newVersionId));
            Useful.afterNextBuildDo(() {
              bloc.add(const CAPIEvent.forceRefresh());
            });
          });
        });
      },
      child: SizedBox.fromSize(
        size: Size.infinite,
        child: Container(
          color: Colors.lime,
          width: double.infinity,
          height: double.infinity,
        ),
        // child: ModalBarrier(
        //   color: !widget.parentNode.playList.isNotEmpty
        //       ? Colors.purple.withOpacity(.25)
        //       : null,
        //   dismissible: false,
        // ),
      ),
    );
  }

  Widget _childBuild(final CAPIState state) {
    // return IgnorePointer(
    //   child: GestureDetector(
    //     onTap: (){
    //       debugPrint('xxxxxx');
    //     },
    //       child: Container(color: Colors.blue, width: 300, height: 300,)),
    // );
    // var sizeMap = CAPIState.iwSizeMap;
    //debugPrint("sizeMap: ${sizeMap.toString()}");
    // var gkMap = CAPIState.gkMap;
    // debugPrint("gkMap: ${gkMap.toString()}");
    Widget child = widget.child ??
        const Material(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Add a Child to the Targets Wrapper; \ne.g. an image over which \nyou will place callout targets'),
          ),
        );

    return wrapperSize != Size.zero
        ? IgnorePointer(
            ignoring: true, //!state.aTargetIsSelected(),
            child: MeasureSizeBox(
              // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
              onSizedCallback: (Size size) {
                wrapperSize = size;
                // debugPrint("MeasureSizeBox => ${size.toString()}");
              },
              child: child,
            ),
          )
        : MeasureSizeBox(
            // key: CAPIState.wGKMap[widget.name] = GlobalKey(),
            onSizedCallback: (Size size) {
              wrapperSize = size;
              // debugPrint("MeasureSizeBox => ${size.toString()}");
              // force a rebuild with the measured size
              Useful.afterNextBuildDo(() {
                setState(() {});
              });
            },
            child: child,
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

  CAPIBloC get bloc => FC().capiBloc;

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
