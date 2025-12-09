import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/size_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration_shape.dart';
import 'package:json_annotation/json_annotation.dart';

import '../snippet/pnodes/enums/enum_target_pointer_type.dart';
import '../snippet/snodes/target_model_hook.dart.dart';
import 'alignment_model.dart';

part 'target_model.mapper.dart';

/// TargetModel is used to model either:
///
///   1. A Target with play button (hotspot)
///     or
///   2. A Target with no play button (Auto-plays Callout)
@MappableClass(hook: TargetModelHook())
class TargetModel with TargetModelMappable {
  TargetId uid;
  double transformScale;

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? gk;

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
  // double? tcSeparation;
  SizeModel? calloutSize;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool showCover;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool showBtn;
  bool canResizeH;
  bool canResizeV;
  bool followScroll;
  int calloutDurationMs;

  // decoration
  UpTo6Colors? calloutFillColors;
  UpTo6Colors? calloutBorderColors;
  DecorationShapeEnum? calloutDecorationShapeEnum;
  double calloutBorderRadius;
  double calloutBorderThickness;
  int? starPoints;

  // String snippetName;

  TargetPointerTypeEnum? targetPointerTypeEnum;
  ColorModel? bubbleOrTargetPointerColor;
  bool? animatePointer;

  bool autoPlay;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  // bool visible = true;

  TargetModel({
    required this.uid,
    // this.single = true,
    this.transformScale = 1.0,
    // this.transformTranslateX = 0.0,
    // this.transformTranslateY = 0.0,
    this.targetCLocalPc,
    this.btnCLocalPosPc,
    this.targetRadiusPC,
    this.btnRadiusPc,
    this.tcAlignment,
    this.calloutSize,
    this.calloutDurationMs = 1500,
    this.showCover = true,
    this.showBtn = true,
    this.canResizeH = true,
    this.canResizeV = true,
    this.followScroll = true,
    this.calloutFillColors,
    this.calloutBorderColors,
    this.calloutDecorationShapeEnum,
    this.calloutBorderRadius = 30,
    this.calloutBorderThickness = 1,
    this.starPoints,
    // required this.snippetName,
    this.targetPointerTypeEnum,
    this.bubbleOrTargetPointerColor,
    this.animatePointer = false,
    // this.tcSeparation,
    this.autoPlay = false,
  }) {
    calloutSize ??= SizeModel(200,80);
    tcAlignment ??= AlignmentModel(1.5,0);
  }

  // for now, assumes a single fill color
  Color bgColor() => calloutFillColors?.color1?.flutterValue ?? Colors.white;

  Color borderColor() =>
      calloutBorderColors?.color1?.flutterValue ?? Colors.grey;

  // if target does not have a hotspot, callout will autoplay
  bool hasAHotspot() => btnCLocalPosPc != null;

  /// https://gist.github.com/pskink/aa0b0c80af9a986619845625c0e87a67
  Matrix4 composeMatrix({
    double scale = 1,
    double rotation = 0,
    double translateX = 0,
    double translateY = 0,
    double anchorX = 0,
    double anchorY = 0,
  }) {
    final double c = cos(rotation) * scale;
    final double s = sin(rotation) * scale;
    final double dx = translateX - c * anchorX + s * anchorY;
    final double dy = translateY - s * anchorX - c * anchorY;

    //  ..[0]  = c       # x scale
    //  ..[1]  = s       # y skew
    //  ..[4]  = -s      # x skew
    //  ..[5]  = c       # y scale
    //  ..[10] = 1       # diagonal "one"
    //  ..[12] = dx      # x translation
    //  ..[13] = dy      # y translation
    //  ..[15] = 1       # diagonal "one"
    return Matrix4(c, s, 0, 0, -s, c, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
  }

  bool playingOrSelected(TargetsWrapperState targetsWrapperState) =>
      targetsWrapperState.widget.parentNode.playList.isNotEmpty ??
      false; // || (_bloc.state.aTargetIsSelected() && _bloc.state.selectedTarget!.uid == uid);

  double getScale(
    TargetsWrapperState targetsWrapperState, {
    bool testing = false,
  }) => //playingOrSelected(targetsWrapperState) || testing
      // ?
  max(transformScale, 0.01)
      // : 1.0;
;
  // Offset getTranslate(CAPIState state, {bool testing = false}) {
  //   Size wrapperSize = TargetsWrapper.iwSize(wName);
  //   Offset translate =
  //       playingOrSelected(state) || testing ? Offset(transformTranslateX * wrapperSize.width, transformTranslateY * wrapperSize.height) : Offset.zero;
  //   return translate;
  // }

  double coverRadius(TargetsWrapperState targetsWrapperState) {
    Size wrapperSize = targetsWrapperState.wrapperRect.size;
    return targetRadiusPC != null ? targetRadiusPC! * wrapperSize.width : 30.0;
  }

  // CAPIBloc get bloc => _bloc;

  // Color textColor() => textColorValue == null ? Colors.blue[900]! : Color(textColorValue!);

  // FocusNode textFocusNode() => _textFocusNode;
  //
  // FocusNode imageUrlFocusNode() => _imageUrlFocusNode;

  String get contentCId => '$uid';

  // rename T-* to _*
  // String get contentSnippetName => '$uid';

  // Future<void> ensureContentSnippetPresent() async =>
  //     SnippetInfoModel.cachedSnippet(contentSnippetName) ??
  //     await SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
  //       snippetName: contentSnippetName,
  //       snippetRootNode: SnippetRootNode(
  //         name: contentCId,
  //         child: CenterNode(child: TextNode(text: contentCId, tsPropGroup: TextStyleProperties())),
  //       ),
  //       // snippetRootNode: SnippetTemplateEnum.empty.templateSnippet(),
  //     );

  // Color calloutColor() => calloutFillColorValue == null
  //     ? Colors.white
  //     : Color(calloutFillColorValue!);

  void setCalloutFillColor(ColorModel? newColor) =>
      calloutFillColors = UpTo6Colors(color1: newColor ?? ColorModel.white());

  void setCalloutStarPoints(int? newValue) => starPoints = newValue;

  // Offset targetGlobalPos({
  //   required Size wrapperSize,
  //   required Offset wrapperPos,
  // }) {
  //   // wrapper rect should always be measured
  //   Offset wrapperTopLeft = wrapperPos;
  //   Size wrapperSize = wrapperSize;
  //
  //   // calc from matrix
  //   double scale = getScale();
  //   // Offset translate = getTranslate(state);
  //
  //   double globalPosX =
  //       wrapperTopLeft.dx + /* translate.dx + */
  //       ((targetLocalPosLeftPc ?? 0.0) * wrapperSize.width * scale);
  //   double globalPosY =
  //       wrapperTopLeft.dy + /* translate.dy + */
  //       ((targetLocalPosTopPc ?? 0.0) * wrapperSize.height * scale);
  //
  //   // in prod, target callout will be much smaller
  //   // if (bloc.state.isPlaying(name)) {
  //   //   globalPosX += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), wrapperSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), wrapperSize) * scale / 2;
  //   //   globalPosY += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), wrapperSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), wrapperSize) * scale / 2;
  //   // }
  //   return Offset(globalPosX, globalPosY);
  // }

  double targetRadius(TargetsWrapperState targetsWrapperState) {
    double longestSide = targetsWrapperState.wrapperRect.longestSide;
    return targetRadiusPC != null ? targetRadiusPC! * longestSide : DEFAULT_TARGET_RADIUS;
  }

  double btnRadius(TargetsWrapperState targetsWrapperState) {
    double longestSide = targetsWrapperState.wrapperRect.longestSide;
    return btnRadiusPc != null ? btnRadiusPc! * longestSide : DEFAULT_BTN_RADIUS;
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

  void setTargetLocalPosPc(TargetsWrapperState targetsWrapperState, Offset globalPos) {
    // wrapperRect rect should always have been measured
    Offset wrapperTopLeft = targetsWrapperState.wrapperRect.topLeft;
    Size wrapperSize = targetsWrapperState.wrapperRect.size;

    targetCLocalPc = OffsetModel(
      (globalPos.dx - wrapperTopLeft.dx) / wrapperSize.width,
      (globalPos.dy - wrapperTopLeft.dy) / wrapperSize.height,
    );

    targetCLocalPc = OffsetModel(max(0, targetCLocalPc!.dx), min(targetCLocalPc!.dy, 1));
    // fco.logger.i("${targetCLocalPc?.$1}, ${targetCLocalPc?.$2}");
  }

  void setBtnLocalPosPc(TargetsWrapperState targetsWrapperState, Offset globalPos) {
    // wrapperRect rect should always have been measured
    Offset wrapperTopLeft = targetsWrapperState.wrapperRect.topLeft;
    Size wrapperSize = targetsWrapperState.wrapperRect.size;

    btnCLocalPosPc = OffsetModel(
      (globalPos.dx - wrapperTopLeft.dx) / (wrapperSize.width),
      (globalPos.dy - wrapperTopLeft.dy) / (wrapperSize.height),
    );

    btnCLocalPosPc = OffsetModel(max(0, btnCLocalPosPc!.dx), min(btnCLocalPosPc!.dy, 1));
    // fco.logger.i("${btnLocalLeftPc}, ${btnLocalTopPc}");
  }

  void setAlignment(AlignmentModel newAlignment) {
    tcAlignment = newAlignment;
  }

  // Offset getCalloutPos() =>
  //     Offset(fco.scrW * (calloutLeftPc ?? .5), fco.scrH * (calloutTopPc ?? .5));

  // setTextCalloutPos(Offset newGlobalPos) {
  //   calloutTopPc = newGlobalPos.dy / FCO.scrH;
  //   calloutLeftPc = newGlobalPos.dx / FCO.scrW;
  // }

  // void init(
  //   CAPIBloc bloc,
  //   // GlobalKey gk,
  //   // FocusNode textFocusNode,
  //   // FocusNode imageUrlFocusNode,
  // ) {
  //   _bloc = bloc;
  //   // _gk = gk;
  //   // _textFocusNode = textFocusNode;
  //   // _imageUrlFocusNode = imageUrlFocusNode;
  //   // _transientMatrix = Matrix4.identity();
  // }

  // GlobalKey gk() => _gk;

  // GlobalKey generateNewGK() => _gk = GlobalKey();

  Future<void> changed_saveRootSnippet(SnippetRootNode? rootNode) async {
    if (rootNode != null) {
      fco.dismissAll(onlyToasts: true);
      // HydratedBloc.storage.write('flutter-content', rootNode.toJson());
      fco.showToast(
        removeAfterMs: 1000,
        msg: 'saving changes...',
        gravity: Alignment.topCenter,
        bgColor: Colors.yellow,
        textColor: Colors.black,
      );
      final newVersionId = SnippetInfoModel.createNewVersion(rootNode);
      fco.modelRepo.saveSnippetVersion(
        snippetName: rootNode.name,
        newVersionId: newVersionId,
        newVersion: rootNode,
      );
      fco.dismissToast(Alignment.topCenter);
    }

    // emit(state.copyWith(
    //   // targetGroupMap: newMap,
    //   // hideAllTargetGroups:
    //   //     event.keepTargetsHidden ? state.hideAllTargetGroups : false,
    //   // hideAllTargetGroupPlayBtns:
    //   //     event.keepTargetsHidden ? state.hideAllTargetGroupPlayBtns : false,
    //   // hideTargetsExcept:
    //   //     event.keepTargetsHidden ? state.hideTargetsExcept : null,
    //   force: state.force + 1,
    // ));
  }

  @override
  bool operator ==(Object other) => other is TargetModel && other.uid == uid;

  @override
  int get hashCode {
    return uid;
  }

  // TargetModel clone() {
  //   var cloneJson = toJson();
  //   TargetModel clonedTC = TargetModel.fromJson(cloneJson);
  //   // clonedTC._bloc = this._bloc;
  //   // clonedTC._gk = this._gk;
  //   // clonedTC._textFocusNode = this._textFocusNode;
  //   // clonedTC._imageUrlFocusNode = this._imageUrlFocusNode;
  //   // clonedTC._transientMatrix = this._transientMatrix;
  //   // clonedTC._rect = this._rect;
  //   clonedTC.visible = visible;
  //   return clonedTC;
  // }
}
