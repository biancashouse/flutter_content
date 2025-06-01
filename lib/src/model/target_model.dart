import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'target_model.mapper.dart';

/// TargetModel is used to model either:
///
///   1. A Hotspot (has a hotspot target + play btn + callout config props)
///     or
///   2. An Auto-played Callout (has a hotspot target + callout config props)
///     or
///   3. A non-hotspot target + callout config props
@MappableClass()
class TargetModel with TargetModelMappable {
  TargetId uid;
  double transformScale;

  // double transformTranslateX;
  // double transformTranslateY;
  //
  // if target is part of a TargetsWrapper, it's parent node will be this property
  @JsonKey(includeFromJson: false, includeToJson: false)
  TargetsWrapperNode? parentTargetsWrapperNode;

  double? targetLocalPosLeftPc;
  double? targetLocalPosTopPc;
  double? radiusPc;
  double? btnLocalTopPc;
  double? btnLocalLeftPc;
  double? calloutTopPc;
  double? calloutLeftPc;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool showCover;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool showBtn;
  bool canResizeH;
  bool canResizeV;
  bool followScroll;
  double calloutWidth;
  double calloutHeight;
  int calloutDurationMs;
  // deprecated
  int? calloutFillColorValue;
  ColorModel? calloutFillColor;
  int? calloutBorderColorValue;
  ColorModel? calloutBorderColor;
  MappableDecorationShapeEnum calloutDecorationShape;
  double calloutBorderRadius;
  double calloutBorderThickness;
  int? starPoints;

  // String snippetName;

  int? calloutArrowTypeIndex;
  ColorModel? calloutArrowColor;
  int? calloutArrowColorValue;

  bool animateArrow;

  bool autoPlay;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  // bool visible = true;

  TargetModel({
    required this.uid,
    // this.single = true,
    this.transformScale = 1.0,
    // this.transformTranslateX = 0.0,
    // this.transformTranslateY = 0.0,
    this.radiusPc,
    this.calloutDurationMs = 1500,
    this.calloutWidth = 400,
    this.calloutHeight = 85,
    this.calloutTopPc,
    this.calloutLeftPc,
    this.btnLocalTopPc, // initially shown directly over target
    this.btnLocalLeftPc,
    this.targetLocalPosLeftPc,
    this.targetLocalPosTopPc,
    this.showCover = true,
    this.showBtn = true,
    this.canResizeH = true,
    this.canResizeV = true,
    this.followScroll = true,
    this.calloutFillColorValue,
    this.calloutFillColor,
    this.calloutBorderColorValue,
    this.calloutBorderColor,
    this.calloutDecorationShape = MappableDecorationShapeEnum.rectangle,
    this.calloutBorderRadius = 30,
    this.calloutBorderThickness = 1,
    this.starPoints,
    // required this.snippetName,
    this.calloutArrowTypeIndex = 4, //ArrowTypeEnum.THIN.index,
    this.calloutArrowColorValue,
    this.calloutArrowColor,
    this.animateArrow = false,
    this.autoPlay = false,
  }) {
    if (calloutFillColor == null && calloutFillColorValue != null) {
      calloutFillColor = ColorModel.fromColor(Color(calloutFillColorValue!));
    } else {
      calloutFillColor ??= ColorModel.grey();
    }
    if (calloutBorderColor == null && calloutBorderColorValue != null) {
      calloutBorderColor = ColorModel.fromColor(Color(calloutBorderColorValue!));
    } else {
      calloutBorderColor ??= ColorModel.grey();
    }
    if (calloutArrowColor == null && calloutArrowColorValue != null) {
      calloutArrowColor = ColorModel.fromColor(Color(calloutArrowColorValue!));
    } else {
      calloutArrowColor ??= ColorModel.grey();
    }
  }

  // if target does not have a hotspot, callout will autoplay
  bool hasAHotspot() => btnLocalTopPc != null && btnLocalLeftPc != null;

  GlobalKey? get targetsWrapperGK => parentTargetsWrapperNode?.nodeWidgetGK;

  TargetsWrapperState? targetsWrapperState() {
    return targetsWrapperGK?.currentState as TargetsWrapperState?;
  }

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

  bool playingOrSelected() =>
      targetsWrapperState()?.widget.parentNode.playList.isNotEmpty ??
      false; // || (_bloc.state.aTargetIsSelected() && _bloc.state.selectedTarget!.uid == uid);

  double getScale({bool testing = false}) =>
      playingOrSelected() || testing ? max(transformScale, 0.01) : 1.0;

  // Offset getTranslate(CAPIState state, {bool testing = false}) {
  //   Size ivSize = TargetsWrapper.iwSize(wName);
  //   Offset translate =
  //       playingOrSelected(state) || testing ? Offset(transformTranslateX * ivSize.width, transformTranslateY * ivSize.height) : Offset.zero;
  //   return translate;
  // }

  double get radius {
    Size ivSize = targetsWrapperState()!.wrapperRect.size;
    return radiusPc != null ? radiusPc! * ivSize.width : 30.0;
  }

  ArrowTypeEnum getArrowType() {
    return ArrowTypeEnum.values[calloutArrowTypeIndex ?? ArrowTypeEnum.POINTY.index];
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

  void setCalloutColor(ColorModel? newColor) =>
      calloutFillColor = newColor ?? ColorModel.white();

  void setCalloutStarPoints(int? newValue) =>
      starPoints = newValue;

  Offset targetGlobalPos(
      {required Size wrapperSize, required Offset wrapperPos}) {
    // iv rect should always be measured
    Offset ivTopLeft = wrapperPos;
    Size ivSize = wrapperSize;

    // calc from matrix
    double scale = getScale();
    // Offset translate = getTranslate(state);

    double globalPosX = ivTopLeft.dx + /* translate.dx + */
        ((targetLocalPosLeftPc ?? 0.0) * ivSize.width * scale);
    double globalPosY = ivTopLeft.dy + /* translate.dy + */
        ((targetLocalPosTopPc ?? 0.0) * ivSize.height * scale);

    // in prod, target callout will be much smaller
    // if (bloc.state.isPlaying(name)) {
    //   globalPosX += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), ivSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), ivSize) * scale / 2;
    //   globalPosY += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), ivSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), ivSize) * scale / 2;
    // }
    return Offset(globalPosX, globalPosY);
  }

  Offset btnStackPos() {
    // iv rect should always be measured
    Size ivSize = targetsWrapperState()?.wrapperRect.size ?? fco.scrSize;

    double stackPosX = (btnLocalLeftPc ?? 0.0) * ivSize.width;
    double stackPosY = (btnLocalTopPc ?? 0.0) * ivSize.height;

    return Offset(stackPosX, stackPosY);
  }

  Offset targetStackPos() {
    Size ivSize = targetsWrapperState()!.wrapperRect.size;

    double stackPosX = (targetLocalPosLeftPc ?? 0.0) * ivSize.width;
    double stackPosY = (targetLocalPosTopPc ?? 0.0) * ivSize.height;

    return Offset(stackPosX, stackPosY);
  }

  void setTargetStackPosPc(Offset globalPos) {
    if (targetsWrapperState() == null) return;

    // iv rect should always be measured
    Offset ivTopLeft = targetsWrapperState()!.wrapperRect.topLeft;
    Size ivSize = targetsWrapperState()!.wrapperRect.size;

    double targetLocalPosTop = globalPos.dy - ivTopLeft.dy;
    double targetLocalPosLeft = globalPos.dx - ivTopLeft.dx;

    targetLocalPosTopPc = targetLocalPosTop / ivSize.height;
    targetLocalPosLeftPc = targetLocalPosLeft / ivSize.width;

    targetLocalPosTopPc = max(0, targetLocalPosTopPc!);
    targetLocalPosTopPc = min(targetLocalPosTopPc!, 1);
    targetLocalPosLeftPc = max(0, targetLocalPosLeftPc!);
    targetLocalPosLeftPc = min(targetLocalPosLeftPc!, 1);
  }

  void setBtnStackPosPc(Offset globalPos) {
    if (targetsWrapperState() == null) return;

    // iv rect should always be measured
    Offset ivTopLeft = targetsWrapperState()!.wrapperRect.topLeft;
    Size ivSize = targetsWrapperState()!.wrapperRect.size;

    btnLocalTopPc = (globalPos.dy - ivTopLeft.dy) / (ivSize.height);
    btnLocalLeftPc = (globalPos.dx - ivTopLeft.dx) / (ivSize.width);

    btnLocalTopPc = max(0, btnLocalTopPc!);
    btnLocalTopPc = min(btnLocalTopPc!, 1);
    btnLocalLeftPc = max(0, btnLocalLeftPc!);
    btnLocalLeftPc = min(btnLocalLeftPc!, 1);

    // fco.logger.i("${btnLocalLeftPc}, ${btnLocalTopPc}");
  }

  Offset getCalloutPos() => Offset(
        fco.scrW * (calloutLeftPc ?? .5),
        fco.scrH * (calloutTopPc ?? .5),
      );

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

  Future<void> changed_saveRootSnippet() async {
    SnippetRootNode? rootNode = parentTargetsWrapperNode?.rootNodeOfSnippet();
    if (rootNode != null) {
      fco.dismissAll(onlyToasts: true);
      // HydratedBloc.storage.write('flutter-content', rootNode.toJson());
      fco.showToast(
        removeAfterMs: 500,
        calloutConfig: CalloutConfigModel(
          cId: "saving-model",
          gravity: AlignmentEnum.topCenter,
          fillColor: ColorModel.yellow(),
          initialCalloutW: fco.scrW * .8,
          initialCalloutH: 40,
          scrollControllerName: null,
        ),
        calloutContent: Padding(
            padding: const EdgeInsets.all(10),
            child:
                fco.coloredText('saving changes...', color: Colors.blueAccent)),
      );
      await fco.cacheAndSaveANewSnippetVersion(
          snippetName: rootNode.name, rootNode: rootNode);
      fco.dismiss("saving-model");
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
