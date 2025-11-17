// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/measuring/size_aware_widget.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/targets_wrapper_ontap_menu.dart';

import 'positioned_target_cover.dart';
import 'positioned_target_play_btn.dart';

class TargetsWrapper extends StatefulWidget {
  final TargetsWrapperNode parentNode;
  final SNode? childNode;
  final bool hardEdge;

  static double CAPI_TARGET_BTN_RADIUS = 15.0;

  const TargetsWrapper({
    required this.parentNode,
    this.childNode,
    this.hardEdge = true,
    required super.key,
  });

  @override
  State<TargetsWrapper> createState() => TargetsWrapperState();

  static TargetsWrapperState? of(BuildContext context) =>
      context.findAncestorStateOfType<TargetsWrapperState>();

  static void configureTarget(
      BuildContext context,
    TargetModel tc,
    Rect wrapperRect, {
    bool quickly = false,
  }) {
    if (!fco.canEditContent()) return;

    if (tc.targetsWrapperState() == null) return;

    // fco.dismissAll();

    var coverGK = tc.gk;
    Rect? targetRect = coverGK!.globalPaintBounds();

    if (targetRect == null) return;

    // targetRect = targetRect.translate(
    //   sw,
    //   sh,
    // );

    Alignment? ta = fco.calcTargetAlignmentWithinWrapper(
      wrapperRect: wrapperRect,
      targetRect: targetRect,
    );

    if (tc.hasAHotspot()) {
      tc.targetsWrapperState()?.zoomer?.applyTransform(
        tc.transformScale,
        tc.transformScale,
        ta,
        afterTransformF: () {
          showHotspotSnippetContentCallout(
            tc: tc,
            justPlaying: false,
            wrapperRect: wrapperRect,
          );
          showConfigToolbar(tc, wrapperRect);
        },
        quickly: quickly,
      );
    } else {
      showHotspotSnippetContentCallout(
        tc: tc,
        justPlaying: false,
        wrapperRect: wrapperRect,
      );
      showConfigToolbar(tc, wrapperRect);
    }
  }

  static void showConfigToolbar(TargetModel tc, Rect wrapperRect) {
    final cc = CalloutConfig(
      cId: CalloutConfigToolbar.CID,

      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      initialCalloutW: 920,
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
          tc.targetsWrapperState()?.zoomer?.resetTransform(
            afterTransformF: resetZoom,
          );
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
  late bool _needToMeasureChild;
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

  // double? scrollOffset;

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
    // fco.logger.i('TargetsWrapperState initState');
    super.initState();

    _needToMeasureChild = true;

    pulsingPointGK = GlobalKey();

    for (TargetModel tc in widget.parentNode.targets) {
      tc.parentTargetsWrapperNode = widget.parentNode;
    }

    fco.afterNextBuildDo(() {
      if (!mounted) return;
      // fco.afterMsDelayDo(1000, (){
      // setState(() {
      measureIWPosAndSize();
      // });
      // });
    });
  }

  // double scrollOffsetX() =>
  //     NamedScrollController.hScrollOffset(scName(context));
  //
  // double scrollOffsetY() =>
  //     NamedScrollController.vScrollOffset(scName(context));

  void measureIWPosAndSize() {
    // fco.logger.i('measureIWPosAndSize');
    var newPosAndSize = (widget.key as GlobalKey).globalPosAndSize();

    // final sw = NamedScrollController.hScrollOffset(scName(context));
    // final sh = NamedScrollController.vScrollOffset(scName(context));
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
        fco.logger.i(
          'measureIWPosAndSize: wrapper is ${wrapperSize.toString()}',
        );
        fco.logger.i(
          'measureIWPosAndSize: aspect ratio is ${wrapperSize.aspectRatio}',
        );
        setState(() {
          widget.parentNode.aspectRatio ??= wrapperSize.aspectRatio;
          _needToMeasureChild = false;
        });
      }
    } catch (e) {
      // ignore but then don't update pos
      fco.logger.i('measureIWPosAndSize! ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        // NamedScrollController? sc = scName(context) != null
        //     ? NamedScrollController.instance(scName(context)!)
        //     : null;

        var scrollConfig = fco.findAncestorScrollControllerAndDirection(
          context,
        );
        ScrollController? sc = scrollConfig.$1;
        Axis? scrollDirection = scrollConfig.$2;

        if (foundTc != null && data.$2) {
          foundTc.setBtnStackPosPc(
            details.offset
                .translate(
                  TargetsWrapper.CAPI_TARGET_BTN_RADIUS,
                  TargetsWrapper.CAPI_TARGET_BTN_RADIUS,
                )
                .translate(
                  scrollDirection == Axis.horizontal ? sc?.offset ?? 0.0 : 0.0,
                  scrollDirection == Axis.vertical ? sc?.offset ?? 0.0 : 0.0,
                ),
          );
          foundTc.changed_saveRootSnippet();
        } else if (foundTc != null) {
          foundTc.setTargetStackPosPc(
            details.offset
                .translate(foundTc.radius, foundTc.radius)
                .translate(
                  scrollDirection == Axis.horizontal ? sc?.offset ?? 0.0 : 0.0,
                  scrollDirection == Axis.vertical ? sc?.offset ?? 0.0 : 0.0,
                ),
          );
          foundTc.changed_saveRootSnippet();
        }
        // fco.capiBloc
        //     .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
      });
    }

    return Stack(
      clipBehavior: widget.hardEdge ? Clip.hardEdge : Clip.none,
      children: [
        DragTarget<(TargetId, bool)>(
          builder: (_, __, ___) {
            return GestureDetector(
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
                  barrier: CalloutBarrierConfig(opacity: 0.1),
                  finalSeparation: 30,
                  targetPointerType: TargetPointerType.thin_line(),
                  bubbleOrTargetPointerColor: Colors.purpleAccent,
                  animatePointer: true,
                  decorationFillColors: ColorOrGradient.color(
                    Colors.purpleAccent.withAlpha(90),
                  ),

                  showCloseButton: true,
                  closeButtonPos: Offset(10, 10),
                  closeButtonColor: Colors.white,
                  decorationBorderRadius: 16,
                  onDismissedF: () {
                    hidePossibleNewTarget();
                  },
                );
                // show pulsing indicator
                setState(() {
                  pulsingPointPos = details.localPosition.translate(-32, -32);
                  fco.showOverlay(
                    targetGK: pulsingPointGK,
                    calloutConfig: cc,
                    calloutContent: Padding(
                      padding: const EdgeInsets.only(
                        top: 48.0,
                        left: 48,
                        right: 48,
                      ),
                      child: TargetsWrapperOnTapMenu(
                        details,
                        widget.parentNode,
                        wrapperRect,
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
            );
          },
          onAcceptWithDetails: fco.anyPresent([CalloutConfigToolbar.CID])
              ? null
              : droppedBtnOrCover,
        ),

        // CHILD, typically an image
        // _childBuild(),

        // TARGET COVERS
        if (!_needToMeasureChild)
          for (TargetModel tc in widget.parentNode.targets)
            Positioned(
              top: tc.targetStackPos().dy - tc.radius,
              // + vScrollOffset,
              // + (_playingOrEditingTc !=null ? scrollOffsetY()/tc.getScale() : 0.00),
              left: tc.targetStackPos().dx - tc.radius,
              // + hScrollOffset,
              // + (_playingOrEditingTc != null ? scrollOffsetX()/tc.getScale() : 0.00),
              child: Visibility.maintain(
                key: tc.gk ??= GlobalKey(debugLabel: 'Target ${tc.uid.toString()}'),
                visible:
                    fco.canEditContent() &&
                    (playingTc == null || playingTc == tc),
                child: TargetCover(
                  tc,
                  _targetIndex(tc),
                  wrapperRect: wrapperRect,
                  playing: playingTc == tc,
                ),
              ),
            ),

        // TARGET BUTTONS
        if (!_needToMeasureChild)
          for (TargetModel tc in widget.parentNode.targets)
            if (playingTc == null && tc.hasAHotspot())
              Positioned(
                top:
                    tc.btnStackPos().dy - TargetsWrapper.CAPI_TARGET_BTN_RADIUS,
                left:
                    tc.btnStackPos().dx - TargetsWrapper.CAPI_TARGET_BTN_RADIUS,
                child: TargetPlayBtn(
                  initialTC: tc,
                  index: _targetIndex(tc),
                  wrapperRect: wrapperRect,
                ),
              ),

        if (!_needToMeasureChild && pulsingPointPos != null)
          Positioned(
            top: pulsingPointPos!.dy,
            left: pulsingPointPos!.dx,
            child:
                TargetCover(
                      gk: pulsingPointGK,
                      TargetModel(uid: -1)
                        ..parentTargetsWrapperNode = widget.parentNode,
                      widget.parentNode.targets.length,
                      wrapperRect: wrapperRect,
                      playing: false,
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scale(duration: 500.milliseconds),
          ),
      ],
    );
  }

  int _targetIndex(TargetModel tc) => widget.parentNode.targets.indexOf(tc);

  Widget _childBuild() {
    Widget? childWidget;
    if (widget.childNode is AssetImageNode) {
      childWidget = SizeAwareWidget.asset(
        assetPath: (widget.childNode as AssetImageNode).assetPath!,
        onSizeAvailable: (Size _) {
          setState(() {
            measureIWPosAndSize();
          });
        },
      );
    }

    Widget child = IgnorePointer(
      ignoring: false, //fco.canEditContent.isTrue,
      child:
          childWidget ??
          const Material(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Add a Child to the Targets Wrapper; \ne.g. an image over which \nyou will place callout targets',
              ),
            ),
          ),
    );

    // return child;
    return child;
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

  const IntegerCircleAvatar(
    this.tc, {
    this.num,
    // required this.textColor,
    required this.bgColor,
    required this.radius,
    required this.fontSize,
    this.child,
    super.key,
  });

  // CAPIBloC get bloc => fco.capiBloc;

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
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
