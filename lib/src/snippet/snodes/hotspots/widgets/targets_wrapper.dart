// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/targets_wrapper_ontap_menu.dart';

import 'positioned_target_cover.dart';
import 'positioned_target_play_btn.dart';

class TargetsWrapper extends StatefulWidget {
  final TargetsWrapperNode parentNode;
  final Widget? child;
  final bool hardEdge;
  final ScrollControllerName? scName;

  const TargetsWrapper(
      {required this.parentNode,
      this.child,
      this.hardEdge = true,
      this.scName,
      required super.key});

  @override
  State<TargetsWrapper> createState() => TargetsWrapperState();

  static TargetsWrapperState? of(BuildContext context) =>
      context.findAncestorStateOfType<TargetsWrapperState>();

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

  static void configureTarget(
    TargetModel tc,
    Rect wrapperRect,
    ScrollControllerName? scName, {
    bool quickly = false,
  }) {
    if (!fco.canEditContent()) return;

    if (tc.targetsWrapperState() == null) return;

    // fco.dismissAll();

    var coverGK = fco.getTargetGk(tc.uid);
    Rect? targetRect = coverGK!.globalPaintBounds();

    if (targetRect == null) return;

    // targetRect = targetRect.translate(
    //   sw,
    //   sh,
    // );

    Alignment? ta = fco.calcTargetAlignmentWithinWrapper(
        wrapperRect: wrapperRect, targetRect: targetRect);

    if (tc.hasAHotspot()) {
      tc.targetsWrapperState()?.zoomer?.applyTransform(
          tc.transformScale, tc.transformScale, ta, afterTransformF: () {
        showSnippetContentCallout(
          tc: tc,
          justPlaying: false,
          wrapperRect: wrapperRect,
          scName: scName,
        );
        showConfigToolbar(
          tc,
          wrapperRect,
          scName,
        );
      }, quickly: quickly);
    } else {
      showSnippetContentCallout(
        tc: tc,
        justPlaying: false,
        wrapperRect: wrapperRect,
        scName: scName,
      );
      showConfigToolbar(
        tc,
        wrapperRect,
        scName,
      );
    }
  }

  static void showConfigToolbar(
    TargetModel tc,
    Rect wrapperRect,
    final ScrollControllerName? scName,
  ) {
    final cc = CalloutConfig(
      cId: CalloutConfigToolbar.CID,
      scrollControllerName: scName,
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      initialCalloutW: 820,
      initialCalloutH: 80,
      decorationShape: DecorationShape.rounded_rectangle(),
      decorationBorderRadius: 16,
      animatePointer: false,
      targetPointerType: TargetPointerType.none(),
      initialCalloutPos: OffsetModel.fromOffset(fco.calloutConfigToolbarPos()),
      onDragEndedF: (newPos) {
        fco.setCalloutConfigToolbarPos(newPos);
      },
      dragHandleHeight: 30,
      followScroll: false,
      onDismissedF: () {
        void resetZoom() {
          // fco.dismiss(CalloutConfigToolbar.CID);
          SNode.showAllTargetBtns();
          SNode.showAllHotspotTargetCovers();
          //TODO save a new version ? not necessary ?
          // fco.afterNextBuildDo(() {
          //   // save hotspot's parent snippet
          //   var rootNode = tc.parentTargetsWrapperNode?.rootNodeOfSnippet();
          //   if (rootNode != null) {
          //     fco.saveNewVersion(snippet: rootNode);
          //     // fco.cacheAndSaveANewSnippetVersion(
          //     //   snippetName: rootNode.name,
          //     //   rootNode: rootNode,
          //     // );
          //   }
          // });
        }

        tc.targetsWrapperState()?.refresh(() {
          tc.targetsWrapperState()?.zoomer?.resetTransform(afterTransformF: resetZoom);
        });
      },
    );

    fco.showOverlay(
      onReadyF: () {},
      calloutConfig: cc,
      calloutContent: CalloutConfigToolbar(
        cc: cc,
        tc: tc,
        wrapperRect: wrapperRect,
        onCloseF: () {
          tc.targetsWrapperState()!.setPlayingOrEditingTc(null, () {
            removeSnippetContentCallout(tc);
          });
          // fco.dismiss(CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR);
        },
      ),
    );
  }
}

class TargetsWrapperState extends State<TargetsWrapper> {
  // Rect? _selectedTargetRect;

  // bool _needToMeasureSize = true;
  // bool _needToMeasurePos = true;
  bool _needToMeasureWrapperRect = true;
  late Rect wrapperRect;

  Offset? pulsingPointPos;
  late GlobalKey pulsingPointGK;

  // Offset? wrapperPos;
  // Size? _wrapperSize;
  // Size get wrapperSize => _wrapperSize ?? MediaQuery.of(context).size;
  // set wrapperSize(Size newSize) => _wrapperSize = newSize;

  // Offset? savedChildLocalPosPc;

  // Timer? _sizeChangedTimer;
  TargetModel? _playingOrEditingTc; // gets set / reset by btn widgets
  void setPlayingOrEditingTc(newtC, VoidCallback f) => setState(() {
        _playingOrEditingTc = newtC;
        f.call();
      });

  TargetModel? get playingTc => _playingOrEditingTc;

  double? scrollOffset;

  // Orientation? _lastO;

  // late TargetModel tcToPlay;

  ZoomerState? get zoomer {
    if (context.mounted) {
      return Zoomer.of(context);
    } else {
      fco.logger.i('zoomer context NOT MOUNTED!');
    }
    return null;
  }

  void refresh(VoidCallback f) {
    setState(() {
      f.call();
      _playingOrEditingTc = null;
    });
  }

  void hidePossibleNewTarget() {
    setState(() {
      pulsingPointPos = null;
    });
  }

  @override
  void initState() {
    fco.logger.i('TargetsWrapperState initState');
    super.initState();

    pulsingPointGK = GlobalKey();

    for (TargetModel tc in widget.parentNode.targets) {
      tc.parentTargetsWrapperNode = widget.parentNode;
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
          if (mounted) {
            measureIWPosAndSize();
            // autoplay callouts when not in editing mode
            if (!fco.canEditContent()) {
              fco.afterNextBuildDo(() {
                for (TargetModel tc in widget.parentNode.targets) {
                  if (!tc.hasAHotspot()) {
                    TargetCover.playTarget(tc, wrapperRect, null);
                  }
                }
              });
            }
          }
        });
      },
    );
  }

  // double scrollOffsetX() =>
  //     NamedScrollController.hScrollOffset(widget.scName);
  //
  // double scrollOffsetY() =>
  //     NamedScrollController.vScrollOffset(widget.scName);

  void measureIWPosAndSize() {
    // fco.logger.i('measureIWPosAndSize');
    var newPosAndSize = (widget.key as GlobalKey).globalPosAndSize();

    // final sw = NamedScrollController.hScrollOffset(widget.scName);
    // final sh = NamedScrollController.vScrollOffset(widget.scName);
    Offset? globalPos;
    try {
      globalPos = newPosAndSize.$1
          // ?.translate(
          // sw,
          // sh,
          // )
          ;
      if (globalPos != null) {
        // fco.logger.i('globalPos != null');
        // fco.logger.i('TargetGroupWrapper.iwPosMap[${widget.name}] = ${globalPos.toString()}');
        // fco.logger.i('TargetGroupWrapper.iwSizeMap[${widget.name}] = ${newPosAndSize.$2!}');
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
        fco.logger
            .i('measureIWPosAndSize: wrapper is ${wrapperSize.toString()}');
        fco.logger.i(
            'measureIWPosAndSize: aspect ratio is ${wrapperSize.aspectRatio}');
        setState(() {
          widget.parentNode.aspectRatio ??= wrapperSize.aspectRatio;
          _needToMeasureWrapperRect = false;
        });
      }
    } catch (e) {
      // ignore but then don't update pos
      fco.logger.i('measureIWPosAndSize! ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_needToMeasureWrapperRect) {
      _needToMeasureWrapperRect = false;
      return _childBuild();
    }

    String? editablePageName = EditablePage.maybeScrollControllerName(context);
    double hScrollOffset =
        NamedScrollController.hScrollOffset(editablePageName);
    double vScrollOffset =
        NamedScrollController.vScrollOffset(editablePageName);

    // when dragging a btn or cover ends
    void droppedBtnOrCover(DragTargetDetails<(TargetId, bool)> details) {
      // ignore drags when toolbar showing
      if (fco.anyPresent([CalloutConfigToolbar.CID])) {
        refresh(() {});
        return;
      }

      // get current scrollOffset
      refresh(() {
        var data = details.data;
        TargetId uid = data.$1;
        TargetModel? foundTc = widget.parentNode.findTarget(uid);
        // $2 true means target btn rather than target cover
        if (foundTc != null && data.$2) {
          foundTc.setBtnStackPosPc(details.offset
              .translate(
                fco.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
                fco.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
              )
              .translate(hScrollOffset, vScrollOffset));
          foundTc.changed_saveRootSnippet();
        } else if (foundTc != null) {
          foundTc.setTargetStackPosPc(details.offset
              .translate(
                foundTc.radius,
                foundTc.radius,
              )
              .translate(hScrollOffset, vScrollOffset));
          foundTc.changed_saveRootSnippet();
        }
        // fco.capiBloc
        //     .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
      });
    }

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
                    onTapDown: (TapDownDetails details) async {
                      // ignore if not in editing mode or if currently showing config toolbar
                      if (!fco.canEditContent() ||
                          fco.anyPresent([CalloutConfigToolbar.CID]) ||
                          fco.snippetBeingEdited != null) {
                        return;
                      }
                      CalloutConfig cc = CalloutConfig(
                          cId: 'create-target-menu',
                          initialTargetAlignment: Alignment.topRight,
                          initialCalloutAlignment: Alignment.bottomLeft,
                          initialCalloutW: TargetsWrapperOnTapMenu.menuWidth(),
                          initialCalloutH: TargetsWrapperOnTapMenu.menuHeight(),
                          // contentTranslateX: 1,
                          // contentTranslateY: 1,
                          barrier: CalloutBarrierConfig(
                            opacity: 0.1,
                          ),
                          // finalSeparation: 50,
                          bubbleOrTargetPointerColor: Colors.purpleAccent,
                          animatePointer: true,
                          decorationFillColors: ColorOrGradient.color(Colors.purpleAccent.withAlpha(90)),
                          scrollControllerName: null,
                          showCloseButton: true,
                          closeButtonPos: Offset(10, 10),
                          closeButtonColor: Colors.white,
                          decorationBorderRadius: 16,
                          onDismissedF: () {
                            hidePossibleNewTarget();
                          });
                      // show pulsing indicator
                      setState(() {
                        pulsingPointPos =
                            details.localPosition.translate(-32, -32);
                        fco.showOverlay(
                          targetGkF: () => pulsingPointGK,
                          calloutConfig: cc,
                          calloutContent: Padding(
                            padding: const EdgeInsets.all(48.0),
                            child: TargetsWrapperOnTapMenu(
                              details,
                              widget.parentNode,
                              wrapperRect,
                              widget.scName,
                            ),
                          ),
                        );
                      });

                      // hide pulsing indicator
                      // setState(() {
                      //   pulsingPointPos = null;
                      // });
                    },
                    child: _childBuild(),
                    // onLongPressEnd: (LongPressEndDetails details) async =>
                    //     await longPressedeBarrier(details),
                  ),
                );
              },
              onAcceptWithDetails: fco.anyPresent([CalloutConfigToolbar.CID])
                  ? null
                  : droppedBtnOrCover,
            ),

            // CHILD, typically an image
            // _childBuild(),

            // TARGET COVERS
            for (TargetModel tc in widget.parentNode.targets)
              Positioned(
                top: tc.targetStackPos().dy - tc.radius,
                // + vScrollOffset,
                // + (_playingOrEditingTc !=null ? scrollOffsetY()/tc.getScale() : 0.00),
                left: tc.targetStackPos().dx - tc.radius,
                // + hScrollOffset,
                // + (_playingOrEditingTc != null ? scrollOffsetX()/tc.getScale() : 0.00),
                child: Visibility.maintain(
                  key: fco.setTargetGk(tc.uid,
                      GlobalKey(debugLabel: 'Target ${tc.uid.toString()}')),
                  visible: fco.canEditContent() &&
                      (playingTc == null || playingTc == tc),
                  child: TargetCover(
                    tc,
                    _targetIndex(tc),
                    wrapperRect: wrapperRect,
                    scName: widget.scName,
                    playing: playingTc == tc,
                  ),
                ),
              ),

            // TARGET BUTTONS
            for (TargetModel tc in widget.parentNode.targets)
              if (playingTc == null && tc.hasAHotspot())
                Positioned(
                  top: tc.btnStackPos().dy -
                      fco.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
                  left: tc.btnStackPos().dx -
                      fco.capiBloc.state.CAPI_TARGET_BTN_RADIUS,
                  child: TargetPlayBtn(
                    initialTC: tc,
                    index: _targetIndex(tc),
                    wrapperRect: wrapperRect,
                    scName: widget.scName,
                  ),
                ),

            if (pulsingPointPos != null)
              Positioned(
                top: pulsingPointPos!.dy,
                left: pulsingPointPos!.dx,
                child: TargetCover(
                  gk: pulsingPointGK,
                  TargetModel(uid: -1)
                    ..parentTargetsWrapperNode = widget.parentNode,
                  widget.parentNode.targets.length,
                  wrapperRect: wrapperRect,
                  scName: widget.scName,
                  playing: false,
                )
                    .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true))
                    .scale(duration: 500.milliseconds),
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

    // return child;
    return IgnorePointer(
      ignoring: false, //fco.canEditContent.isTrue,
      child: child,
    );
  }
}

class IntegerCircleAvatar extends StatelessWidget {
  final TargetModel tc;
  final int? num;

  // final Color textColor;
  final Color bgColor;
  final double radius;
  final double fontSize;
  final Widget? child;

  const IntegerCircleAvatar(this.tc,
      {this.num,
      // required this.textColor,
      required this.bgColor,
      required this.radius,
      required this.fontSize,
      this.child,
      super.key});

  CAPIBloC get bloc => fco.capiBloc;

  @override
  Widget build(BuildContext context) {
    double luminance = bgColor.computeLuminance();
    bool needsDarkText = luminance > 0.5;
    return CircleAvatar(
      backgroundColor: const Color.fromRGBO(255, 0, 0, .01),
      radius: radius, // + 2,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius, // + 1,
        child: CircleAvatar(
          foregroundColor: needsDarkText ? Colors.black : Colors.white,
          backgroundColor: bgColor,
          radius: radius,
          child: Container(
              // decoration: ShapeDecoration(
              //     color: bgColor,
              //     shape: const CircleBorder(
              //       side: BorderSide(color: Colors.white),
              //     )),
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '$num',
              style: TextStyle(
                  color: needsDarkText ? Colors.black : Colors.white,
                  fontSize: fontSize),
            ),
          )),
        ),
      ),
    );
  }
}
