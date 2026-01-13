import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/size_model.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../snippet/pnodes/enums/enum_target_pointer_type.dart';
import '../snippet/snodes/hotspots/widgets/enum_target_btn_icon.dart';
import '../snippet/snodes/target_model_hook.dart.dart';
import 'alignment_model.dart';
import 'base_target_model.dart';

part 'hotspot_target_model.mapper.dart';

/// TargetModel is used to model either:
///
///   1. A Target with play button (hotspot)
///     or
///   2. A Target with no play button (Auto-plays Callout)
@MappableClass(hook: TargetModelHook())
class HotspotTargetModel extends TargetConfigModel
    with HotspotTargetModelMappable {
  // rel to wrapperRect
  OffsetModel? targetCLocalPc;
  double? targetRadiusPC; // target cover radius (not button)
  static double DEFAULT_TARGET_RADIUS = 50;
  OffsetModel? btnCLocalPosPc;
  double? btnRadiusPc; // target cover radius (not button)
  static double DEFAULT_BTN_RADIUS = 15;

  // target alignment gets set when the config toolbar is closed
  // it is used when playing the callout to align the callout with the target
  AlignmentModel? tcAlignment;

  // line
  // OffsetModel? lineStartLocalPc;
  // OffsetModel? lineEndLocalPc;

  TargetButtonIconEnum? btnIcon;

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? gk;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool showCover;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool showBtn;

  HotspotTargetModel({
    // this.single = true,
    // this.transformTranslateX = 0.0,
    // this.transformTranslateY = 0.0,
    this.targetCLocalPc,
    this.btnCLocalPosPc,
    this.targetRadiusPC,
    this.btnRadiusPc,
    this.btnIcon,
    this.showCover = true,
    this.showBtn = true,
    required super.uid,
    this.tcAlignment,
    super.calloutSize,
    super.calloutDurationMs = 1500,
    super.calloutFillColors,
    super.calloutBorderColors,
    super.calloutDecorationShapeEnum,
    super.calloutBorderRadius,
    super.calloutBorderThickness,
    super.starPoints,
    super.targetPointerTypeEnum,
    super.bubbleOrTargetPointerColor,
    super.animatePointer = false,
    super.autoPlay = false,
  }) {
    calloutSize ??= SizeModel(200, 80);
    tcAlignment ??= AlignmentModel(1.5, 0);
  }

  // if target does not have a hotspot, callout will autoplay
  bool hasABtn() => btnCLocalPosPc != null;

  bool playingOrSelected(TargetsWrapperState targetsWrapperState) =>
      targetsWrapperState.widget.parentNode.playList.isNotEmpty
  // ?? false
  ; // || (_bloc.state.aTargetIsSelected() && _bloc.state.selectedTarget!.uid == uid);

  double getScale(
    TargetsWrapperState targetsWrapperState, {
    bool testing = false,
  }) => //playingOrSelected(targetsWrapperState) || testing
      // ?
      max(transformScale, 0.01)
  // : 1.0;
  ;

  void setAlignment(AlignmentModel newAlignment) {
    tcAlignment = newAlignment;
  }

  double coverRadius(TargetsWrapperState targetsWrapperState) {
    Size wrapperSize = targetsWrapperState.wrapperRect.size;
    return targetRadiusPC != null ? targetRadiusPC! * wrapperSize.width : 30.0;
  }

  double targetRadius(TargetsWrapperState targetsWrapperState) {
    double longestSide = targetsWrapperState.wrapperRect.longestSide;
    return targetRadiusPC != null
        ? targetRadiusPC! * longestSide
        : DEFAULT_TARGET_RADIUS;
  }

  double btnRadius(TargetsWrapperState targetsWrapperState) {
    double longestSide = targetsWrapperState.wrapperRect.longestSide;
    return btnRadiusPc != null
        ? btnRadiusPc! * longestSide
        : DEFAULT_BTN_RADIUS;
  }

  Offset btnLocalPos(TargetsWrapperState targetsWrapperState) {
    // wrapper rect should always have been measured
    Size wrapperSize = targetsWrapperState.wrapperRect.size;

    double stackPosX = (btnCLocalPosPc?.dx ?? 0.0) * wrapperSize.width;
    double stackPosY = (btnCLocalPosPc?.dy ?? 0.0) * wrapperSize.height;

    return Offset(stackPosX, stackPosY);
  }

  Offset targetLocalPos(TargetsWrapperState targetsWrapperState) {
    Size wrapperSize = targetsWrapperState.wrapperRect.size;

    double stackPosX = (targetCLocalPc?.dx ?? 0.0) * wrapperSize.width;
    double stackPosY = (targetCLocalPc?.dy ?? 0.0) * wrapperSize.height;

    return Offset(stackPosX, stackPosY);
  }

  void setTargetLocalPosPc(
    TargetsWrapperState targetsWrapperState,
    Offset globalPos,
  ) {
    // wrapperRect rect should always have been measured
    Offset wrapperTopLeft = targetsWrapperState.wrapperRect.topLeft;
    Size wrapperSize = targetsWrapperState.wrapperRect.size;

    targetCLocalPc = OffsetModel(
      (globalPos.dx - wrapperTopLeft.dx) / wrapperSize.width,
      (globalPos.dy - wrapperTopLeft.dy) / wrapperSize.height,
    );

    targetCLocalPc = OffsetModel(
      max(0, targetCLocalPc!.dx),
      min(targetCLocalPc!.dy, 1),
    );
    // fco.logger.i("${targetCLocalPc?.$1}, ${targetCLocalPc?.$2}");
  }

  void setBtnLocalPosPc(
    TargetsWrapperState targetsWrapperState,
    Offset globalPos,
  ) {
    // wrapperRect rect should always have been measured
    Offset wrapperTopLeft = targetsWrapperState.wrapperRect.topLeft;
    Size wrapperSize = targetsWrapperState.wrapperRect.size;

    btnCLocalPosPc = OffsetModel(
      (globalPos.dx - wrapperTopLeft.dx) / (wrapperSize.width),
      (globalPos.dy - wrapperTopLeft.dy) / (wrapperSize.height),
    );

    btnCLocalPosPc = OffsetModel(
      max(0, btnCLocalPosPc!.dx),
      min(btnCLocalPosPc!.dy, 1),
    );
    // fco.logger.i("${btnLocalLeftPc}, ${btnLocalTopPc}");
  }

  void showConfigToolbar(TargetsWrapperState wrapperState) {
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
        tc: this,
        wrapperState: wrapperState,
        onCloseF: () {
          wrapperState.setPlayingOrEditingTc(null, () {
            removeContentCallout();
          });
          // fco.dismiss(CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR);
        },
      ),
    );
  }

  /// returning false means user tapped the x
  void showContentCallout({
    required bool justPlaying,
    required TargetsWrapperState wrapperState,
  }) {
    // possibly transform before showing callout

    // CAPIBloc bloc = FCO.capiBloc;
    // GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
    // bool ignoreBarrierTaps = false;
    double minHeight = 0;
    // int maxLines = 5;
    // TargetModel? tc; // = tc; //FCO.capiBloc.state.tcByNameOrUid(tc);
    // GlobalKey? targetGK() => fco.getTargetGk(uid)!;
    // GlobalKey? gk = CAPIState.gk(tc!.uid);
    // GlobalKey? gk = single ? CAPIState.gk(wName.hashCode) : CAPIState.gk(uid);

    // fco.targetSnippetBeingConfigured = fco.currentSnippet(snippetName);
    // if (fco.targetSnippetBeingConfigured == null) {
    // var rootNode = SnippetTemplateEnum.callout_content.clone();
    // SnippetRootNode newSnippet =
    //     SnippetPanel.createSnippetFromTemplateNodes(rootNode, contentCId);
    // fco.possiblyCacheAndSaveANewSnippetVersion(
    //     snippetName: contentCId, rootNode: newSnippet);
    // fco.targetSnippetBeingConfigured = newSnippet;
    // }
    // snippet may not exist yet
    //  by now should definitely have created the target's snippet
    // if (fco.targetSnippetBeingConfigured != null) {

    Widget content() => SnippetBuilder(
      snippetName: contentCId,
      templateSnippet: SnippetRootNode(
        name: contentCId,
        child: PlaceholderNode(),
      ),
      justPlaying: justPlaying,
    );

    Widget editableContent() => Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.purpleAccent,
          style: BorderStyle.solid,
        ),
      ),
      child: content(),
    );

    Widget possiblyEditableContent() =>
        fco.canEditContent() && !justPlaying ? editableContent() : content();

    final snippetBeingEdited = fco.snippetBeingEdited != null;

    // globalPaintBounds() returns the correctly scaled topLeft, but the
    // rect width and height are the unscaled values!
    Rect? targetRect = gk?.globalPaintBounds();
    if (targetRect == null) return;

    Offset initialCalloutPos = fco.calculateCalloutTopLeft(
      // targetRect: inflateRectByFactor_fromCenter(gk!.globalPaintBounds()!, getScale(wrapperState)),
      targetRect: targetRect,
      calloutRect: Rect.fromLTWH(0, 0, calloutSize!.width, calloutSize!.height),
      alignment: tcAlignment!,
    );

    Offset initialCalloutPosSA = fco.translateOffsetForScroll(
      wrapperState.scrollConfig,
      initialCalloutPos,
    );

    calloutConfig = CalloutConfig(
      cId: contentCId,

      decorationFillColors: calloutFillColors?.getColorOrGradient(),
      decorationShape: calloutDecorationShapeEnum?.decorationShape,
      decorationStarPoints: starPoints,
      decorationBorderColors: calloutBorderColors?.getColorOrGradient(),
      decorationBorderThickness: calloutBorderThickness,
      decorationBorderRadius: calloutBorderRadius,
      bubbleOrTargetPointerColor: bgColor(),
      // targetPointerType: !hasAHotspot() ? TargetPointerType.none(): targetPointerTypeEnum?.targetPointerType,
      targetPointerType: targetPointerTypeEnum?.targetPointerType,
      fromDelta:
          calloutDecorationShapeEnum == DecorationShapeEnum.star && hasABtn()
          ? 60
          : null,
      animatePointer: animatePointer,
      // lineLabelBuilder: () => fco.coloredText(
      //   '${tcAlignment?.toStringAsFixed(2)}',
      //   color: Colors.red,
      // ),
      // https://stackoverflow.com/questions/11671100/scale-path-from-center
      // initialCalloutPos: initialPosScrollAware,
      // initialTargetAlignment: Alignment(
      //   tcAlignment?.x ?? 0.0,
      //   tcAlignment?.y ?? 0.0,
      // ),
      // initialCalloutAlignment: -Alignment(
      //   tcAlignment?.x ?? 0.0,
      //   tcAlignment?.y ?? 0.0,
      // ),
      initialCalloutPos: initialCalloutPosSA,
      initialCalloutW: calloutSize?.width,
      initialCalloutH: calloutSize?.height,
      minHeight: minHeight + 4,
      resizeableH: !justPlaying && canResizeH,
      resizeableV: !justPlaying && canResizeV,
      followScroll: followScroll,
      onResizeF: (Size newSize) {
        calloutSize = SizeModel(newSize.width, newSize.height);
      },
      onDragF: (Offset newPos) {
        // tcAlignment = AlignmentModel(cc.targetAlignment!.x, cc.targetAlignment!.y);
      },
      onDragEndedF: (Offset newPos) {
        if ((justPlaying && hasABtn()) || !fco.canEditContent()) return;

        // update the targetAlignment
        final Rect calloutRect = Rect.fromLTWH(
          newPos.dx,
          newPos.dy,
          calloutSize!.width,
          calloutSize!.height,
        );

        // calc alignment that positions the callout at its final separation

        var targetRectSA = fco.translateRectForScroll(
          wrapperState.scrollConfig,
          targetRect,
        );

        // var calloutRectSA = wrapperState.translateRectForScroll(calloutRect);

        Alignment newAlignment = fco.getAlignmentBetweenRects(
          targetRectSA,
          calloutRect,
        );

        setAlignment(AlignmentModel(newAlignment.x, newAlignment.y));
        closeThenReopenContentCallout(wrapperState);
      },
      draggable: true || !justPlaying,
      scaleTarget: transformScale,
      // separation: 100,
      // barrierOpacity: .1,
      // onBarrierTappedF: () async {
      //   onBarrierTappedF?.call();
      //   fco.removeOverlay(feature);
      // },
      // showCloseButton: true,
      // onTopRightButtonPressF: (){
      //     onBarrierTappedF?.call();
      //     fco.removeOverlay(feature);
      // }
      onDismissedF: () {
        // FCO.parentTW(twName)?.zoomer?.resetTransform();
        // fco.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
        fco.dismiss(HotspotTargetConfigToolbar.CID);
      },
      barrier: hasABtn() && !snippetBeingEdited
          ? CalloutBarrierConfig(
              color: Colors.black,
              opacity: .8,
              excludeTargetFromBarrier: true,
              roundExclusion: true,
              dismissible: false,
              // onTappedF: () {
              //   // do not allow content callout to be dismissed
              //   return;
              //   fco.dismiss(CalloutConfigToolbar.CID);
              //   if (hasAHotspot()) {
              //     targetsWrapperState()?.refresh(() {
              //       tc
              //           .targetsWrapperState()
              //           ?.zoomer
              //           ?.resetTransform(
              //           afterTransformF: () {
              //             // changed_saveRootSnippet();
              //             SNode.showAllTargetBtns();
              //             SNode.showAllHotspotTargetCovers();
              //             // fco.currentPageState?.unhideFAB();
              //             removeSnippetContentCallout(tc);
              //             fco.afterNextBuildDo(() {
              //               // save hotspot's parent snippet
              //               var rootNode =
              //               parentTargetsWrapperNode?.rootNodeOfSnippet();
              //               if (rootNode != null) {
              //                 fco.cacheAndSaveANewSnippetVersion(
              //                   snippetName: rootNode.name,
              //                   rootNode: rootNode,
              //                 );
              //               }
              //             });
              //           });
              //     });
              //   } else {
              //     targetsWrapperState()?.refresh(() {
              //       // changed_saveRootSnippet();
              //       SNode.showAllTargetBtns();
              //       SNode.showAllHotspotTargetCovers();
              //       removeSnippetContentCallout(tc);
              //       fco.afterNextBuildDo(() {
              //         // save parent snippet
              //         var rootNode =
              //         parentTargetsWrapperNode?.rootNodeOfSnippet();
              //         if (rootNode != null) {
              //           fco.cacheAndSaveANewSnippetVersion(
              //             snippetName: rootNode.name,
              //             rootNode: rootNode,
              //           );
              //         }
              //       });
              //     });
              //   }
              // }
            )
          : null,
      frameTarget: false,
    );

    if (calloutConfig == null) return;

    // show callout for configured duration, unless:
    // no hotspot: show forever (until a signed-in editor taps)
    int? durationMs;
    if (hasABtn() && justPlaying) {
      durationMs = calloutDurationMs;
    }

    //)
    fco.showOverlay(
      // isHotspotCallout: true,
      // skipOnScreenCheck: justPlaying,
      targetGK: gk,
      calloutContent: BlocBuilder<CAPIBloC, CAPIState>(
        builder: (context, state) =>
            MouseInfoViewer(child: possiblyEditableContent()),
      ),
      calloutConfig: calloutConfig!,
      // configurableTarget: (kDebugMode && !justPlaying) ? tc : null,
      removeAfterMs: durationMs ?? 0,
      onReadyF: () {},
    );

    // explainPopupsAreDraggable();
    // }
  }

  void closeThenReopenContentCallout(TargetsWrapperState wrapperState) async {
    removeContentCallout(skipOnDismiss: true);

    wrapperState.zoomer?.zoomImmediately(transformScale, transformScale);

    showContentCallout(justPlaying: false, wrapperState: wrapperState);

    fco.dismiss(HotspotTargetConfigToolbar.CID, skipOnDismiss: true);
    showConfigToolbar(wrapperState);
  }

  @override
  bool operator ==(Object other) =>
      other is HotspotTargetModel && other.uid == uid;

  @override
  int get hashCode {
    return uid;
  }
}
