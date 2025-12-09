// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/measuring/size_aware_widget.dart';
import 'package:flutter_content/src/model/alignment_model.dart';
import 'package:flutter_content/src/snippet/snodes/fs_image_node.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/targets_wrapper_ontap_menu.dart';

import 'positioned_target_cover.dart';
import 'positioned_target_play_btn.dart';

class TargetsWrapper extends StatefulWidget {
  final TargetsWrapperNode parentNode;
  final SNode? childNode;
  final bool hardEdge;

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
    TargetsWrapperState wrapperState, {
    bool quickly = false,
  }) {
    if (!fco.canEditContent()) return;

    var coverGK = tc.gk;
    Rect? targetRect = coverGK!.globalPaintBounds();

    if (targetRect == null) return;

    // targetRect = targetRect.translate(
    //   sw,
    //   sh,
    // );

    Alignment? ta = fco.calcTargetAlignmentWithinWrapper(
      wrapperRect: wrapperState.wrapperRect,
      targetRect: targetRect,
    );

    if (tc.hasAHotspot()) {
      wrapperState.zoomer?.applyTransform(
        tc.transformScale,
        tc.transformScale,
        ta,
        afterTransformF: () {
          showHotspotSnippetContentCallout(
            tc: tc,
            justPlaying: false,
            wrapperState: wrapperState,
          );
          showConfigToolbar(tc, wrapperState);
        },
        quickly: quickly,
      );
    } else {
      showHotspotSnippetContentCallout(
        tc: tc,
        justPlaying: false,
        wrapperState: wrapperState,
      );
      showConfigToolbar(tc, wrapperState);
    }
  }

  static void showConfigToolbar(
    TargetModel tc,
    TargetsWrapperState wrapperState,
  ) {
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

        wrapperState.refresh(() {
          wrapperState.zoomer?.resetTransform(afterTransformF: resetZoom);
        });
      },
    );

    fco.showOverlay(
      onReadyF: () {},
      calloutConfig: cc,
      calloutContent: CalloutConfigToolbar(
        cc: cc,
        tc: tc,
        wrapperState: wrapperState,
        onCloseF: () {
          wrapperState.setPlayingOrEditingTc(null, () {
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
  late bool _canAutoPlay;
  late Rect wrapperRect;

  Offset? pulsingPointPos;
  GlobalKey? pulsingPointGK;

  ScrollController? sc;
  Axis? scrollDirection;

  bool canAutoPlay() => _canAutoPlay && !fco.canEditContent();

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
    _canAutoPlay = false;

    fco.afterNextBuildDo(() {
      if (!mounted) return;
      var scrollConfig = fco.findAncestorScrollControllerAndDirection(context);
      sc = scrollConfig.$1;
      scrollDirection = scrollConfig.$2;

      // fco.afterMsDelayDo(1000, (){
      // setState(() {
      measureIWPosAndSize();

      // after 2nd build can auto play callouts if not signed in
      fco.afterMsDelayDo(2000, () {
        if (mounted && !fco.canEditContent()) _canAutoPlay = true;
      });
    });
  }

  void autoPlayTargets() {
    if (fco.canEditContent()) return;
    for (TargetModel tc in widget.parentNode.targets) {
      if (!tc.hasAHotspot() && !fco.anyPresent([tc.contentCId])) {
        showHotspotSnippetContentCallout(
          tc: tc,
          justPlaying: true,
          wrapperState: this,
        );
      }
    }
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

  Offset translateForScroll(Offset pos) => pos.translate(
    scrollDirection == Axis.horizontal ? sc?.offset ?? 0.0 : 0.0,
    scrollDirection == Axis.vertical ? sc?.offset ?? 0.0 : 0.0,
  );

  @override
  Widget build(BuildContext context) {
    // possibly autoplay callouts
    if (canAutoPlay()) {
      // fco.afterNextBuildDo(autoPlayTargets);
      autoPlayTargets();
      _canAutoPlay = false;
    }
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

        if (foundTc != null && data.$2) {
          foundTc.setBtnLocalPosPc(
            this,
            details.offset.translate(
              TargetModel.DEFAULT_BTN_RADIUS,
              TargetModel.DEFAULT_BTN_RADIUS,
            ),
          );
          foundTc.changed_saveRootSnippet(
            widget.parentNode.rootNodeOfSnippet(),
          );
        } else if (foundTc != null) {
          foundTc.setTargetLocalPosPc(
            this,
            details.offset.translate(
              foundTc.targetRadius(this),
              foundTc.targetRadius(this),
            ),
          );
          foundTc.changed_saveRootSnippet(
            widget.parentNode.rootNodeOfSnippet(),
          );
        }
      });
    }

    // prepare list of play btns and target covers
    final btns = <Widget>[];
    if (!_needToMeasureChild) {
      for (TargetModel tc in widget.parentNode.targets) {
        if (playingTc == null && tc.hasAHotspot()) {
          btns.add(
            Positioned(
              top: tc.btnLocalPos(this).dy - tc.btnRadius(this),
              left: tc.btnLocalPos(this).dx - tc.btnRadius(this),
              child: TargetPlayBtn(
                tc: tc,
                index: _targetIndex(tc),
                wrapperState: this,
              ),
            ),
          );
        }
      }
    }

    final covers = <Widget>[];
    if (!_needToMeasureChild) {
      for (TargetModel tc in widget.parentNode.targets) {
        if ((playingTc == null || playingTc == tc)) {
          covers.add(
            Positioned(
              top: tc.targetLocalPos(this).dy - tc.targetRadius(this),
              left: tc.targetLocalPos(this).dx - tc.targetRadius(this),

              // + hScrollOffset,
              // + (_playingOrEditingTc != null ? scrollOffsetX()/tc.getScale() : 0.00),
              child: TargetCover(
                key: tc.gk ??= GlobalKey(
                  debugLabel: 'Target Cover ${tc.uid.toString()}',
                ),
                tc,
                _targetIndex(tc),
                wrapperState: this,
                playing: playingTc == tc,
              ),
            ),
          );
        }
      }
    }

    return BlocConsumer<CAPIBloC, CAPIState>(
      // autoPlay callouts when just signed out
      listenWhen: (prev, curr) {
        return prev.isSignedIn != curr.isSignedIn && !curr.isSignedIn;
      },
      listener: (context, state) {
        autoPlayTargets();
      },

      builder: (BuildContext context, CAPIState state) {
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
                    // dismiss any auto-played target callouts
                    if (fco.canEditContent()) {
                      bool hidACallout = false;
                      for (TargetModel tc in widget.parentNode.targets) {
                        if (!tc.hasAHotspot() &&
                            fco.anyPresent([tc.contentCId])) {
                          removeSnippetContentCallout(tc);
                          hidACallout = true;
                        }
                      }
                      if (hidACallout) return;
                    }
                    // show create target dlg
                    pulsingPointPos = details.localPosition;
                    pulsingPointGK = GlobalKey();
                    // TODO wrapperRect.center is not necc on screen: the image
                    // TODO could be very tall
                    //
                    double alX = 0;
                    double alY = 0;
                    alX = (details.globalPosition.dx < wrapperRect.center.dx)
                        ? 1.5
                        : -1.5;
                    alY = (details.globalPosition.dy < wrapperRect.center.dy)
                        ? 1.5
                        : -1.5;
                    CalloutConfig cc = CalloutConfig(
                      cId: 'create-target-menu',
                      initialTargetAlignment: Alignment(alX, alY),
                      initialCalloutAlignment: -Alignment(alX, alY),
                      initialCalloutW: TargetsWrapperOnTapMenu.menuWidth(),
                      initialCalloutH: TargetsWrapperOnTapMenu.menuHeight(),
                      // contentTranslateX: 1,
                      // contentTranslateY: 1,
                      barrier: CalloutBarrierConfig(opacity: 0.1),
                      finalSeparation: 30,
                      targetPointerType: TargetPointerType.thin_line(),
                      bubbleOrTargetPointerColor: Colors.purpleAccent,
                      // animatePointer: true,
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
                      fco.afterNextBuildDo(() {
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
                              this,
                            ),
                          ),
                        );
                      });
                    });
                  },
                  child: _childBuild(),
                );
              },
              onAcceptWithDetails: fco.anyPresent([CalloutConfigToolbar.CID])
                  ? null
                  : droppedBtnOrCover,
            ),

            // for guests, just show target as a 1x1 with a gk
            // if (canAutoPlay())
            //   for (TargetModel tc in widget.parentNode.targets)
            //     if (!tc.hasAHotspot())
            //       Positioned(
            //         top: tc.targetLocalPos(this).dy,
            //         left: tc.targetLocalPos(this).dx,
            //         key: tc.gk = GlobalKey(debugLabel: 'dot ${tc.uid.toString()}'),
            //         child: SizedBox(width: 1, height: 1),
            //       ),
            ...btns,

            ...covers,

            // PULSING POINT animation
            if (!_needToMeasureChild &&
                pulsingPointPos != null &&
                pulsingPointGK != null)
              Positioned(
                    top:
                        pulsingPointPos!.dy - TargetModel.DEFAULT_TARGET_RADIUS,
                    left:
                        pulsingPointPos!.dx - TargetModel.DEFAULT_TARGET_RADIUS,
                    child: TargetCover(
                      // key: pulsingPointGK,
                      TargetModel(uid: -1),
                      widget.parentNode.targets.length,
                      wrapperState: this,
                      playing: false,
                    ),
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(duration: 500.milliseconds),

            // PULSING POINT INDICATOR with globalKey - need separate widget so
            // as not to bugger up the pointing arrow animation
            if (!_needToMeasureChild &&
                pulsingPointPos != null &&
                pulsingPointGK != null)
              Positioned(
                top: pulsingPointPos!.dy - TargetModel.DEFAULT_TARGET_RADIUS,
                left: pulsingPointPos!.dx - TargetModel.DEFAULT_TARGET_RADIUS,
                child: TargetCover(
                  key: pulsingPointGK,
                  TargetModel(uid: -1),
                  widget.parentNode.targets.length,
                  wrapperState: this,
                  playing: false,
                ),
              ),
          ],
        );
      },
    );
  }

  int _targetIndex(TargetModel tc) => widget.parentNode.targets.indexOf(tc);

  Widget _childBuild() {
    final childNode = widget.childNode;
    Widget? childWidget;

    if (childNode is AssetImageNode) {
      childWidget = SizeAwareWidget.asset(
        assetPath: childNode.assetPath!,
        fit: childNode.fit?.flutterValue,
        scale: childNode.scale,
        alignment: childNode.alignment?.alignment,
        onSizeAvailable: (Size _) {
          setState(() {
            measureIWPosAndSize();
          });
        },
      );
    }

    if (childNode is FSImageNode) {
      childWidget = SizeAwareWidget.storage(
        fsFullPath: childNode.fsFullPath!,
        fit: childNode.fit?.flutterValue,
        scale: childNode.scale,
        alignment: childNode.alignment?.alignment,
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
