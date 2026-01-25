import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/size_model.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_target_config_toolbar/quill_target_config_toolbar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../snippet/pnodes/enums/enum_target_pointer_type.dart';
import '../snippet/snodes/hotspots/widgets/enum_target_btn_icon.dart';
import 'alignment_model.dart';
import 'base_target_model.dart';

part 'quill_target_model.mapper.dart';

/// TargetModel is used to model either:
///
///   1. A Target with play button (hotspot)
///     or
///   2. A Target with no play button (Auto-plays Callout)
@MappableClass()
class QuillTargetModel extends TargetConfigModel with QuillTargetModelMappable {
  double? iconSize;
  TargetButtonIconEnum? iconEnum;

  QuillTargetModel({
    this.iconSize,
    this.iconEnum,
    required super.uid,
    // super.tcAlignment,
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
  }

  void showConfigToolbar({
    required QuillTextNode parentNode,
    ScrollConfig? scrollConfig,
    void Function(QuillTargetModel)? onTargetConfigChange,
    void Function(QuillTargetModel)? onTargetConfigRemove,
  }) {
    final toolbarCC = CalloutConfig(
      cId: QuillTargetConfigToolbar.CID,

      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      initialCalloutW: 920,
      initialCalloutH: 80,
      decorationShape: DecorationShape.rounded_rectangle(),
      decorationBorderRadius: 16,
      animatePointer: false,
      targetPointerType: TargetPointerType.none(),
      // starts at screen bottom
      initialCalloutPos: OffsetModel.fromOffset(
        Offset(fco.scrW / 2 - 350, fco.scrH - 90),
      ),
      onDragEndedF: (newPos) {
        fco.setCalloutConfigToolbarPos(newPos);
      },
      dragHandleHeight: 30,
      followScroll: false,
      onDismissedF: () {
        fco.unhide(parentNode.quillTextToolbarCID);
      },
    );

    fco.showOverlay(
      onReadyF: () {},
      calloutConfig: toolbarCC,
      calloutContent: QuillTargetConfigToolbar(
        qtF: () => this,
        parentNode: parentNode,
        sc: scrollConfig,
        onCloseF: () {
          removeContentCallout();
          // fco.dismiss(CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR);
        },
        onTargetConfigChange: onTargetConfigChange,
        onTargetConfigRemove: onTargetConfigRemove,
      ),
    );
  }

  CalloutConfig createCalloutConfig(
    {
    // required QuillTextNode parentQuillTextNode,
    // ScrollConfig? scrollConfig,
    required bool justPlaying,
    void Function(QuillTargetModel)? onTargetConfigChange,
    }
  ) {
    double minHeight = 0;

    // final snippetBeingEdited = fco.snippetBeingEdited != null;

    // var screenCenterPos = fco.translateOffsetForScroll(
    //   scrollConfig,
    //   Offset(
    //     MediaQuery.of(context).size.width / 2,
    //     MediaQuery.of(context).size.height / 2,
    //   ),
    // );
    // alX = (tapPosGlobal.dx < screenCenterPos.dx) ? 1 : -1;
    // alY = (tapPosGlobal.dy < screenCenterPos.dy) ? 1 : -1;

    return calloutConfig = CalloutConfig(
      cId: 'quill-target-$contentCId',

      decorationFillColors: calloutFillColors?.getColorOrGradient(),
      decorationShape: calloutDecorationShapeEnum?.decorationShape,
      decorationStarPoints: starPoints,
      decorationBorderColors: calloutBorderColors?.getColorOrGradient(),
      decorationBorderThickness: calloutBorderThickness,
      decorationBorderRadius: calloutBorderRadius,
      bubbleOrTargetPointerColor: bgColor(),
      targetPointerType: targetPointerTypeEnum?.targetPointerType,
      animatePointer: animatePointer,
      initialTargetAlignment: Alignment.topRight,
      initialCalloutAlignment: Alignment.centerLeft,
      finalSeparation: 150,
      initialCalloutW: calloutSize.width,
      initialCalloutH: calloutSize.height,
      minHeight: minHeight + 4,
      resizeableH: !justPlaying && canResizeH,
      resizeableV: !justPlaying && canResizeV,
      followScroll: false,
      onResizeF: (Size newSize) {
        calloutSize = SizeModel(newSize.width, newSize.height);
        onTargetConfigChange?.call(this);
      },
      bubbleBorderRadius: calloutBorderRadius,
      // onDragF: (Offset newPos) {
      //   // tcAlignment = AlignmentModel(cc.targetAlignment!.x, cc.targetAlignment!.y);
      // },
      // onDragEndedF: (Offset newPos) {
      //   if ((justPlaying) || !fco.canEditContent()) return;
      //
      //   // update the targetAlignment
      //   final Rect calloutRect = Rect.fromLTWH(
      //     newPos.dx,
      //     newPos.dy,
      //     calloutSize!.width,
      //     calloutSize!.height,
      //   );
      //
      //   var targetRectSA = fco.translateRectForScroll(scrollConfig, targetRect);
      //
      //   Alignment newAlignment = fco.getAlignmentBetweenRects(
      //     targetRectSA,
      //     calloutRect,
      //   );
      //
      //   setAlignment(AlignmentModel(newAlignment.x, newAlignment.y));
      //
      //   onTargetConfigChange?.call(this);
      //
      //   closeThenReopenContentCallout(
      //     parentNode: parentQuillTextNode,
      //     sc: scrollConfig,
      //     onTargetConfigChange: onTargetConfigChange,
      //   );
      // },
      frameTarget: false,
      barrier: justPlaying ? CalloutBarrierConfig(
        color: Colors.black,
        opacity: .8,
        excludeTargetFromBarrier: true,
        roundExclusion: true,
        dismissible: true,
      ) : null,
    );
  }

  Widget content({required bool justPlaying}) => SnippetBuilder(
    snippetName: contentCId,
    templateSnippet: SnippetRootNode(
      name: contentCId,
      child: PlaceholderNode(),
    ),
    justPlaying: justPlaying,
  );

  // Widget editableContent({required bool justPlaying}) => Container(
  //   decoration: BoxDecoration(
  //     border: Border.all(
  //       width: 2,
  //       color: Colors.purpleAccent,
  //       style: BorderStyle.solid,
  //     ),
  //   ),
  //   child: content(justPlaying: justPlaying),
  // );

  Widget possiblyEditableContent({required bool justPlaying}) =>
      fco.canEditContent() && !justPlaying
      ? content(justPlaying: justPlaying)
      : content(justPlaying: justPlaying);

  // create the callout config for the content callout
  /// returning false means user tapped the x
  // void showContentCallout({
  //   required QuillTextNode parentQuillTextNode,
  //   ScrollConfig? scrollConfig,
  //   required bool justPlaying,
  //   void Function(QuillTargetModel)? onTargetConfigChange,
  // }) {
  //   double minHeight = 0;
  //
  //   final snippetBeingEdited = fco.snippetBeingEdited != null;
  //
  //   // globalPaintBounds() returns the correctly scaled topLeft, but the
  //   // rect width and height are the unscaled values!
  //   Rect? targetRect = parentQuillTextNode.targetGks[contentCId]
  //       ?.globalPaintBounds();
  //   if (targetRect == null) return;
  //
  //   Offset initialCalloutPos = fco.calculateCalloutTopLeft(
  //     // targetRect: inflateRectByFactor_fromCenter(gk!.globalPaintBounds()!, getScale(wrapperState)),
  //     targetRect: targetRect,
  //     calloutRect: Rect.fromLTWH(0, 0, calloutSize!.width, calloutSize!.height),
  //     alignment: tcAlignment!,
  //   );
  //
  //   Offset initialCalloutPosSA = fco.translateOffsetForScroll(
  //     scrollConfig,
  //     initialCalloutPos,
  //   );
  //
  //   calloutConfig = CalloutConfig(
  //     cId: contentCId,
  //
  //     decorationFillColors: calloutFillColors?.getColorOrGradient(),
  //     decorationShape: calloutDecorationShapeEnum?.decorationShape,
  //     decorationStarPoints: starPoints,
  //     decorationBorderColors: calloutBorderColors?.getColorOrGradient(),
  //     decorationBorderThickness: calloutBorderThickness,
  //     decorationBorderRadius: calloutBorderRadius,
  //     bubbleOrTargetPointerColor: bgColor(),
  //     // targetPointerType: !hasAHotspot() ? TargetPointerType.none(): targetPointerTypeEnum?.targetPointerType,
  //     targetPointerType: targetPointerTypeEnum?.targetPointerType,
  //     animatePointer: animatePointer,
  //     initialCalloutPos: initialCalloutPosSA,
  //     initialCalloutW: calloutSize?.width,
  //     initialCalloutH: calloutSize?.height,
  //     minHeight: minHeight + 4,
  //     resizeableH: !justPlaying && canResizeH,
  //     resizeableV: !justPlaying && canResizeV,
  //     followScroll: false,
  //     onResizeF: (Size newSize) {
  //       calloutSize = SizeModel(newSize.width, newSize.height);
  //     },
  //     onDragF: (Offset newPos) {
  //       // tcAlignment = AlignmentModel(cc.targetAlignment!.x, cc.targetAlignment!.y);
  //     },
  //     onDragEndedF: (Offset newPos) {
  //       if ((justPlaying) || !fco.canEditContent()) return;
  //
  //       // update the targetAlignment
  //       final Rect calloutRect = Rect.fromLTWH(
  //         newPos.dx,
  //         newPos.dy,
  //         calloutSize!.width,
  //         calloutSize!.height,
  //       );
  //
  //       var targetRectSA = fco.translateRectForScroll(scrollConfig, targetRect);
  //
  //       Alignment newAlignment = fco.getAlignmentBetweenRects(
  //         targetRectSA,
  //         calloutRect,
  //       );
  //
  //       setAlignment(AlignmentModel(newAlignment.x, newAlignment.y));
  //
  //       onTargetConfigChange?.call(this);
  //
  //       closeThenReopenContentCallout(
  //         parentNode: parentQuillTextNode,
  //         sc: scrollConfig,
  //         onTargetConfigChange: onTargetConfigChange,
  //       );
  //     },
  //     draggable: true || !justPlaying,
  //     scaleTarget: transformScale,
  //     // onDismissedF: () {
  //     //   fco.dismiss(QuillTargetConfigToolbar.CID);
  //     // },
  //     barrier: justPlaying && !snippetBeingEdited
  //         ? CalloutBarrierConfig(
  //       color: Colors.black,
  //       opacity: .8,
  //       excludeTargetFromBarrier: true,
  //       roundExclusion: true,
  //       dismissible: false,
  //     )
  //         : null,
  //     frameTarget: false,
  //   );
  //
  //   if (calloutConfig == null) return;
  //
  //   // show callout for configured duration, unless:
  //   // no hotspot: show forever (until a signed-in editor taps)
  //   int? durationMs;
  //   if (justPlaying) {
  //     durationMs = calloutDurationMs;
  //   }
  //
  //   //)
  //   fco.showOverlay(
  //     // isHotspotCallout: true,
  //     // skipOnScreenCheck: justPlaying,
  //     targetGK: parentQuillTextNode.targetGks[contentCId],
  //     calloutContent: BlocBuilder<CAPIBloC, CAPIState>(
  //       builder: (context, state) =>
  //           MouseInfoViewer(child: possiblyEditableContent(justPlaying: justPlaying)),
  //     ),
  //     calloutConfig: calloutConfig!,
  //     // configurableTarget: (kDebugMode && !justPlaying) ? tc : null,
  //     removeAfterMs: durationMs ?? 0,
  //     onReadyF: () {},
  //   );
  //
  // }

  void closeThenReopenConfigToolbar({
    required QuillTextNode parentNode,
    ScrollConfig? sc,
    void Function(QuillTargetModel)? onTargetConfigChange,
  }) async {
    fco.dismiss(QuillTargetConfigToolbar.CID, skipOnDismiss: true);
    showConfigToolbar(
      parentNode: parentNode,
      scrollConfig: sc,
      onTargetConfigChange: onTargetConfigChange,
    );

    // removeContentCallout(skipOnDismiss: true);
    // showContentCallout(
    //   parentQuillTextNode: parentNode,
    //   justPlaying: false,
    //   scrollConfig: sc,
    //   onTargetConfigChange: onTargetConfigChange,
    // );
  }

  @override
  bool operator ==(Object other) =>
      other is HotspotTargetModel && other.uid == uid;

  @override
  int get hashCode {
    return uid;
  }
}
