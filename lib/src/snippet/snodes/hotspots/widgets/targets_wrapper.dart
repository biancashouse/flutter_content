// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/measuring/size_aware_widget.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/targets_wrapper_ontap_menu.dart';
import 'hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';
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
    HotspotTargetModel tc,
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

    if (tc.hasABtn()) {
      wrapperState.zoomer?.applyTransform(
        tc.transformScale,
        tc.transformScale,
        ta,
        afterTransformF: () {
          tc.showContentCallout(
            justPlaying: false,
            wrapperState: wrapperState,
          );
          showConfigToolbar(tc, wrapperState);
        },
        quickly: quickly,
      );
    } else {
      tc.showContentCallout(
        justPlaying: false,
        wrapperState: wrapperState,
      );
      showConfigToolbar(tc, wrapperState);
    }
  }

  static void showConfigToolbar(
    HotspotTargetModel tc,
    TargetsWrapperState wrapperState,
  ) {
    final cc = CalloutConfig(
      cId: HotspotTargetConfigToolbar.CID,

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
        }

        wrapperState.refresh(() {
          wrapperState.zoomer?.resetTransform(afterTransformF: resetZoom);
        });
      },
    );

    fco.showOverlay(
      onReadyF: () {},
      calloutConfig: cc,
      calloutContent: HotspotTargetConfigToolbar(
        cc: cc,
        tc: tc,
        wrapperState: wrapperState,
        onCloseF: () {
          wrapperState.setPlayingOrEditingTc(null, () {
            tc.removeContentCallout();
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

  ScrollConfig? scrollConfig;

  // Offset? _lineStartPos;
  // Offset? _lineEndPos;

  bool canAutoPlay() => _canAutoPlay && !fco.canEditContent();

  // Offset? wrapperPos;
  // Size? _wrapperSize;
  // Size get wrapperSize => _wrapperSize ?? MediaQuery.of(context).size;
  // set wrapperSize(Size newSize) => _wrapperSize = newSize;

  // Offset? savedChildLocalPosPc;

  // Timer? _sizeChangedTimer;
  HotspotTargetModel? _playingOrEditingTc; // gets set / reset by btn widgets

  void setPlayingOrEditingTc(newtC, VoidCallback f) => setState(() {
    _playingOrEditingTc = newtC;
    f.call();
  });

  HotspotTargetModel? get playingTc => _playingOrEditingTc;

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
      scrollConfig = fco.findAncestorScrollConfig(context);

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
    for (HotspotTargetModel tc in widget.parentNode.targets) {
      if (!tc.hasABtn() && !fco.anyPresent([tc.contentCId])) {
        tc.showContentCallout(
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
      if (fco.anyPresent([HotspotTargetConfigToolbar.CID])) {
        refresh(() {});
        return;
      }

      // get current scrollOffset
      refresh(() {
        var data = details.data;
        TargetId uid = data.$1;
        HotspotTargetModel? foundTc = widget.parentNode.findTarget(uid);
        // $2 true means target btn rather than target cover
        // NamedScrollController? sc = scName(context) != null
        //     ? NamedScrollController.instance(scName(context)!)
        //     : null;

        if (foundTc != null && data.$2) {
          foundTc.setBtnLocalPosPc(
            this,
            details.offset.translate(
              HotspotTargetModel.DEFAULT_BTN_RADIUS,
              HotspotTargetModel.DEFAULT_BTN_RADIUS,
            ),
          );
          foundTc.saveParentSnippet(
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
          foundTc.saveParentSnippet(
            widget.parentNode.rootNodeOfSnippet(),
          );
        }
      });
    }

    // prepare list of lines, play btns and target covers
    // final lines = <Widget>[];
    // if (!_needToMeasureChild) {
    //   for (HotspotTargetModel tc in widget.parentNode.targets) {
    //     if (tc.isALine()) {
    //       lines.add(
    //         IgnorePointer(
    //           child: CustomPaint(
    //             painter: LinePainter(
    //               start: tc.lineStartLocalPc,
    //               end: tc.lineEndLocalPc,
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //   }
    // }

    final btns = <Widget>[];
    if (!_needToMeasureChild) {
      for (HotspotTargetModel tc in widget.parentNode.targets) {
        if (playingTc == null && tc.hasABtn()) {
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
      for (HotspotTargetModel tc in widget.parentNode.targets) {
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
                  // onLongPressDown: (details) {
                  //   print('*** long press down');
                  //   setState(() {
                  //     _lineStartPos = details.globalPosition;
                  //     _lineEndPos = details.globalPosition;
                  //     print('_lineStartPos is $_lineStartPos');
                  //     print('_lineEndPos is $_lineEndPos');
                  //   });
                  // },
                  // onLongPressMoveUpdate: (details) {
                  //   print('*** long press move');
                  //   if (_lineStartPos != null) {
                  //     setState(() {
                  //       _lineEndPos = details.globalPosition;
                  //     });
                  //   }
                  // },
                  // onLongPressEnd: (details) {
                  //   print('*** long press end');
                  //   print('_lineStartPos is $_lineStartPos');
                  //   print('_lineEndPos is $_lineEndPos');
                  //   if (_lineStartPos != null && _lineEndPos != null) {
                  //     // line must not be too short
                  //     Line line = Line(
                  //       Coord.fromOffset(_lineStartPos!),
                  //       Coord.fromOffset(_lineEndPos!),
                  //     );
                  //     double lineLen = line.length();
                  //     print('lineLen is $lineLen');
                  //     if (lineLen < 50) return;
                  //     // A line has been drawn.
                  //     // You can now create your line object.
                  //     createLine(context, _lineStartPos!, _lineEndPos!);
                  //     print('Line created from $_lineStartPos to $_lineEndPos');
                  //   }
                  //   // Reset for the next line drawing operation.
                  //   setState(() {
                  //     _lineStartPos = null;
                  //     _lineEndPos = null;
                  //   });
                  // },
                  onTapUp: (TapUpDetails details) async {
                    // ignore if not in editing mode or if currently showing config toolbar
                    if (!fco.canEditContent() ||
                        fco.anyPresent([HotspotTargetConfigToolbar.CID]) ||
                        fco.snippetBeingEdited != null) {
                      return;
                    }
                    // dismiss any auto-played target callouts
                    if (fco.canEditContent()) {
                      bool hidACallout = false;
                      for (HotspotTargetModel tc in widget.parentNode.targets) {
                        if (!tc.hasABtn() &&
                            fco.anyPresent([tc.contentCId])) {
                          tc.removeContentCallout();
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
                    // pos on wrapperRect
                    var tapPosLocal = details.localPosition;
                    var tapPosGlobal = fco.translateOffsetForScroll(
                      scrollConfig,
                      details.globalPosition,
                    );
                    var targetRect = Rect.fromCenter(
                      center: tapPosGlobal,
                      width: HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                      height: HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                    );
                    var screenCenterPos = fco.translateOffsetForScroll(
                      scrollConfig,
                      Offset(
                        MediaQuery.of(context).size.width / 2,
                        MediaQuery.of(context).size.height / 2,
                      ),
                    );
                    var wrapperRect = this.wrapperRect;
                    alX = (tapPosGlobal.dx < screenCenterPos.dx) ? 1 : -1;
                    alY = (tapPosGlobal.dy < screenCenterPos.dy) ? 1 : -1;
                    // var relCalloutTopLeft = calculateCalloutTopLeft(
                    //   targetRect: targetRect,
                    //   calloutRect: Rect.fromLTWH(
                    //     0,
                    //     0,
                    //     TargetsWrapperOnTapMenu.menuWidth(),
                    //     TargetsWrapperOnTapMenu.menuHeight(),
                    //   ),
                    //   alignment: Alignment(alX, alY),
                    // );
                    // Offset initialCalloutPos = translateOffsetForScroll(
                    //   relCalloutTopLeft,
                    // );
                    CalloutConfig cc = CalloutConfig(
                      cId: 'create-target-menu',
                      // initialCalloutPos: initialCalloutPos,
                      initialTargetAlignment: Alignment(alX, alY),
                      initialCalloutAlignment: Alignment(-alX, -alY),
                      initialCalloutW: TargetsWrapperOnTapMenu.menuWidth(),
                      initialCalloutH: TargetsWrapperOnTapMenu.menuHeight(),
                      // contentTranslateX: 1,
                      // contentTranslateY: 1,
                      barrier: CalloutBarrierConfig(opacity: 0.1),
                      finalSeparation: 150,
                      targetPointerType: TargetPointerType.thin_line(),
                      bubbleOrTargetPointerColor: Colors.purpleAccent,
                      animatePointer: true,
                      decorationFillColors: ColorOrGradient.color(
                        Colors.purpleAccent.withValues(alpha: .9),
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
              onAcceptWithDetails: fco.anyPresent([HotspotTargetConfigToolbar.CID])
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
            ...covers,

            ...btns,

            // ...lines,

            // PULSING POINT animation
            if (!_needToMeasureChild &&
                pulsingPointPos != null &&
                pulsingPointGK != null)
              Positioned(
                    top:
                        pulsingPointPos!.dy - HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                    left:
                        pulsingPointPos!.dx - HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                    child: TargetCover(
                      // key: pulsingPointGK,
                      HotspotTargetModel(uid: -1),
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
                top: pulsingPointPos!.dy - HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                left: pulsingPointPos!.dx - HotspotTargetModel.DEFAULT_TARGET_RADIUS,
                child: TargetCover(
                  key: pulsingPointGK,
                  HotspotTargetModel(uid: -1),
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

  // void createLine(BuildContext context, Offset fromGlobalPos, Offset toGlobalPos) {
  //   if (!fco.canEditContent()) return;
  //
  //   TargetId newLineId = DateTime.now().millisecondsSinceEpoch;
  //   HotspotTargetModel newLine = HotspotTargetModel(uid: newLineId);
  //
  //   newLine.setLineStartLocalPosPc(this, fromGlobalPos);
  //   newLine.setLineEndLocalPosPc(this, toGlobalPos);
  //
  //   widget.parentNode.targets = [...widget.parentNode.targets, newLine];
  //
  //   fco.capiBloc.add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
  //
  //   final newVersionId = SnippetInfoModel.createNewVersion(
  //     widget.parentNode.rootNodeOfSnippet()!,
  //   );
  //   fco.modelRepo.saveSnippetVersion(
  //     snippetName: widget.parentNode.rootNodeOfSnippet()!.name,
  //     newVersionId: newVersionId,
  //     newVersion: widget.parentNode.rootNodeOfSnippet()!,
  //   );
  // }

  int _targetIndex(HotspotTargetModel tc) => widget.parentNode.targets.indexOf(tc);

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

    if (childNode is StorageImageNode) {
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
  final int? num;

  // final Color textColor;
  final Color bgColor;
  final double radius;
  final double fontSize;
  final Widget? child;

  const IntegerCircleAvatar({
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

class LinePainter extends CustomPainter {
  final Offset? start;
  final Offset? end;

  LinePainter({this.start, this.end});

  @override
  void paint(Canvas canvas, Size size) {
    if (start != null && end != null) {
      final paint = Paint()
        ..color = Colors.purpleAccent
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(start!, end!, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
