import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class CAPIModel {
  String? appName;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  // int? lastModified;
  Map<String, TargetConfig> targetConfigs;
  Map<String, TargetGroupConfig> targetGroupConfigs;
  Map<SnippetName, EncodedSnippetJson> snippetEncodedJsons;

  // String? jsonRootDirectoryNode;
  String? jsonClipboard;

  CAPIModel({
    this.appName,
    // this.lastModified,
    this.targetConfigs = const {},
    this.targetGroupConfigs = const {},
    this.snippetEncodedJsons = const {},
    // this.jsonRootDirectoryNode,
    this.jsonClipboard,
  });

  factory CAPIModel.fromJson(Map<String, dynamic> data) => _$CAPIModelFromJson(data);

  Map<String, dynamic> toJson() => _$CAPIModelToJson(this);
}

@JsonSerializable()
class TargetGroupConfig {
  List<TargetConfig> targets;

  TargetGroupConfig(this.targets);

  factory TargetGroupConfig.fromJson(Map<String, dynamic> data) => _$TargetGroupConfigFromJson(data);

  Map<String, dynamic> toJson() => _$TargetGroupConfigToJson(this);

  TargetGroupConfig clone() {
    var cloneJson = this.toJson();
    TargetGroupConfig clonedITC = TargetGroupConfig.fromJson(cloneJson);
    return clonedITC;
  }
}

// const List<String> textAlignments = ["l", "c", "r", "j"];

@JsonSerializable()
class TargetConfig {
  int uid;

  double transformScale;
  double transformTranslateX;
  double transformTranslateY;

  TargetGroupWrapperName wName;
  bool single;
  double? targetLocalPosLeftPc;
  double? targetLocalPosTopPc;
  double radius;
  double? btnLocalTopPc;
  double? btnLocalLeftPc;
  double? calloutTopPc;
  double? calloutLeftPc;
  bool showBtn;
  double calloutWidth;
  double calloutHeight;
  int calloutDurationMs;
  int? calloutColorValue;
  String snippetName;

  int? arrowType;
  bool animateArrow;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  // late CAPIBloc _bloc;
  // @JsonKey(includeFromJson: false, includeToJson: false)
  // late GlobalKey _gk;
  // @JsonKey(includeFromJson: false, includeToJson: false)
  // late GlobalKey _overridingGK;
  // @JsonKey(includeFromJson: false, includeToJson: false)
  // late FocusNode _textFocusNode;
  // @JsonKey(includeFromJson: false, includeToJson: false)
  // late FocusNode _imageUrlFocusNode;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool visible = true;

  TargetConfig({
    required this.uid,
    required this.wName,
    this.single = true,
    this.transformScale = 1.0,
    this.transformTranslateX = 0.0,
    this.transformTranslateY = 0.0,
    this.radius = 30,
    this.calloutDurationMs = 1500,
    this.calloutWidth = 400,
    this.calloutHeight = 85,
    this.calloutTopPc,
    this.calloutLeftPc,
    this.btnLocalTopPc, // initially shown directly over target
    this.btnLocalLeftPc,
    this.showBtn = true,
    this.calloutColorValue,
    required this.snippetName,
    this.arrowType = 1, // ArrowType.POINTY.index,
    this.animateArrow = false,
  }) {
    // textColorValue ??= Colors.blue[900]!.value;
    calloutColorValue ??= Colors.grey.value;
    // fontWeightIndex = FontWeight.normal.index;
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

  bool playingOrSelected(CAPIState state) =>
      state.playList.isNotEmpty; // || (_bloc.state.aTargetIsSelected() && _bloc.state.selectedTarget!.uid == uid);

  double getScale(CAPIState state, {bool testing = false}) => playingOrSelected(state) || testing ? transformScale : 1.0;

  Offset getTranslate(CAPIState state, {bool testing = false}) {
    Size ivSize = TargetGroupWrapper.iwSize(wName);
    Offset translate =
        playingOrSelected(state) || testing ? Offset(transformTranslateX * ivSize.width, transformTranslateY * ivSize.height) : Offset.zero;
    return translate;
  }

  ArrowType getArrowType() {
    return ArrowType.values[arrowType ?? ArrowType.POINTY.index];
  }

  // CAPIBloc get bloc => _bloc;

  // Color textColor() => textColorValue == null ? Colors.blue[900]! : Color(textColorValue!);

  // FocusNode textFocusNode() => _textFocusNode;
  //
  // FocusNode imageUrlFocusNode() => _imageUrlFocusNode;

  Color calloutColor() => calloutColorValue == null ? Colors.white : Color(calloutColorValue!);

  void setCalloutColor(Color? newColor) => calloutColorValue = newColor?.value;

  Offset targetGlobalPos(CAPIState state) {
    // iv rect should always be measured
    Offset ivTopLeft = TargetGroupWrapper.iwPos(wName);
    Size ivSize = TargetGroupWrapper.iwSize(wName);

    // calc from matrix
    double scale = getScale(state);
    Offset translate = getTranslate(state);

    double globalPosX = ivTopLeft.dx + translate.dx + ((targetLocalPosLeftPc ?? 0.0) * ivSize.width * scale);
    double globalPosY = ivTopLeft.dy + translate.dy + ((targetLocalPosTopPc ?? 0.0) * ivSize.height * scale);

    // in prod, target callout will be much smaller
    // if (bloc.state.isPlaying(name)) {
    //   globalPosX += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), ivSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), ivSize) * scale / 2;
    //   globalPosY += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), ivSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), ivSize) * scale / 2;
    // }
    return Offset(globalPosX, globalPosY);
  }

  Offset btnStackPos() {
    // iv rect should always be measured
    Size ivSize = TargetGroupWrapper.iwSize(wName);

    double stackPosX = (btnLocalLeftPc ?? 0.0) * ivSize.width;
    double stackPosY = (btnLocalTopPc ?? 0.0) * ivSize.height;

    return Offset(stackPosX, stackPosY);
  }

  Offset targetStackPos() {
    // iv rect should always be measured
    Size ivSize = TargetGroupWrapper.iwSize(wName);

    double stackPosX = (targetLocalPosLeftPc ?? 0.0) * ivSize.width;
    double stackPosY = (targetLocalPosTopPc ?? 0.0) * ivSize.height;

    return Offset(stackPosX, stackPosY);
  }

  void setTargetStackPosPc(Offset globalPos) {
    // iv rect should always be measured
    Offset ivTopLeft = TargetGroupWrapper.iwPos(wName);
    Size ivSize = TargetGroupWrapper.iwSize(wName);

    targetLocalPosTopPc = (globalPos.dy - ivTopLeft.dy) / (ivSize.height);
    targetLocalPosLeftPc = (globalPos.dx - ivTopLeft.dx) / (ivSize.width);
  }

  void setBtnStackPosPc(Offset globalPos) {
    // iv rect should always be measured
    Offset ivTopLeft = TargetGroupWrapper.iwPos(wName);
    Size ivSize = TargetGroupWrapper.iwSize(wName);

    btnLocalTopPc = (globalPos.dy - ivTopLeft.dy) / (ivSize.height);
    btnLocalLeftPc = (globalPos.dx - ivTopLeft.dx) / (ivSize.width);
  }

  Offset getCalloutPos() => Offset(
        Useful.scrW * (calloutLeftPc ?? .5),
        Useful.scrH * (calloutTopPc ?? .5),
      );

  // setTextCalloutPos(Offset newGlobalPos) {
  //   calloutTopPc = newGlobalPos.dy / Useful.scrH;
  //   calloutLeftPc = newGlobalPos.dx / Useful.scrW;
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

  factory TargetConfig.fromJson(Map<String, dynamic> data) => _$TargetConfigFromJson(data);

  // @override
  // String toString() {
  //   Matrix4 m4 = recordedM4list.isNotEmpty ? Matrix4.fromList(recordedM4list) : Matrix4.identity();
  //   return "${m4.toString()}";
  // }

  Map<String, dynamic> toJson() => _$TargetConfigToJson(this);

  @override
  bool operator ==(Object other) => other is TargetConfig && other.uid == uid;

  @override
  int get hashCode {
    return uid;
  }

  TargetConfig clone() {
    var cloneJson = this.toJson();
    TargetConfig clonedTC = TargetConfig.fromJson(cloneJson);
    // clonedTC._bloc = this._bloc;
    // clonedTC._gk = this._gk;
    // clonedTC._textFocusNode = this._textFocusNode;
    // clonedTC._imageUrlFocusNode = this._imageUrlFocusNode;
    // clonedTC._transientMatrix = this._transientMatrix;
    // clonedTC._rect = this._rect;
    clonedTC.visible = this.visible;
    return clonedTC;
  }
}
