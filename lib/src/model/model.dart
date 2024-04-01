// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'model.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class AppModel {
//   BranchName currentBranchName;
//   Map<BranchName, BranchModel> branches;
//   EncodedJson? clipboard;
//   AppModel({
//     this.currentBranchName = 'dev',
//     this.branches = const {},
//     this.clipboard,
//   });
//
//   factory AppModel.fromJson(Map<String, dynamic> data) =>
//       _$AppModelFromJson(data);
//
//   Map<String, dynamic> toJson() => _$AppModelToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class BranchModel {
//   BranchName name;
//   VersionId? latestVersionId;
//
//   EncodedSnippetJson? initialVersion;
//
//   List<VersionId>
//       undos; // on app startup, an undo is performed to set the current state
//   List<VersionId> redos;
//   List<VersionId> discardeds;
//
//   BranchModel({
//     required this.name,
//     this.latestVersionId,
//     this.initialVersion,
//     this.undos = const [],
//     this.redos = const [],
//     this.discardeds = const [],
//   });
//
//   factory BranchModel.fromJson(Map<String, dynamic> data) =>
//       _$BranchModelFromJson(data);
//
//   Map<String, dynamic> toJson() => _$BranchModelToJson(this);
// }
//
// @JsonSerializable()
// class CAPIModel {
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   // int? lastModified;
//   // Map<String, TargetModel> TargetModels;
//   // Map<String, TargetGroupModel> TargetGroupModels;
//   // Map<SnippetName, EncodedSnippetJson> snippetEncodedJsons;
//
//   // String? jsonRootDirectoryNode;
//   CAPIModel({
//     // this.lastModified,
//     // this.TargetModels = const {},
//     // this.TargetGroupModels = const {},
//     // this.snippetEncodedJsons = const {},
//     // this.jsonRootDirectoryNode,
//   });
//
//   factory CAPIModel.fromJson(Map<String, dynamic> data) =>
//       _$CAPIModelFromJson(data);
//
//   Map<String, dynamic> toJson() => _$CAPIModelToJson(this);
// }
//
// @JsonSerializable()
// class TargetGroupModel {
//   List<TargetModel> targets;
//
//   TargetGroupModel(this.targets);
//
//   factory TargetGroupModel.fromJson(Map<String, dynamic> data) =>
//       _$TargetGroupModelFromJson(data);
//
//   Map<String, dynamic> toJson() => _$TargetGroupModelToJson(this);
//
//   TargetGroupModel clone() {
//     var cloneJson = toJson();
//     TargetGroupModel clonedITC = TargetGroupModel.fromJson(cloneJson);
//     return clonedITC;
//   }
// }
//
// // const List<String> textAlignments = ["l", "c", "r", "j"];
//
// @JsonSerializable()
// class TargetModel {
//   TargetModelId uid;
//   double transformScale;
//   // double transformTranslateX;
//   // double transformTranslateY;
//   TargetsWrapperName wName;
//   //
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   GlobalKey? targetsWrapperGK;
//
//   // bool single;
//   double? targetLocalPosLeftPc;
//   double? targetLocalPosTopPc;
//   double? radiusPc;
//   double? btnLocalTopPc;
//   double? btnLocalLeftPc;
//   double? calloutTopPc;
//   double? calloutLeftPc;
//   bool showBtn;
//   bool canResizeH;
//   bool canResizeV;
//   double calloutWidth;
//   double calloutHeight;
//   int calloutDurationMs;
//   int? calloutFillColorValue;
//   int? calloutBorderColorValue;
//   DecorationShapeEnum calloutDecorationShape;
//   double calloutBorderRadius;
//   double calloutBorderThickness;
//   int? starPoints;
//   String snippetName;
//
//   int? calloutArrowTypeIndex;
//   int? calloutArrowColorValue;
//
//   bool animateArrow;
//
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   // late CAPIBloc _bloc;
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   // late GlobalKey _gk;
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   // late GlobalKey _overridingGK;
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   // late FocusNode _textFocusNode;
//   // @JsonKey(includeFromJson: false, includeToJson: false)
//   // late FocusNode _imageUrlFocusNode;
//
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   bool visible = true;
//
//   TargetModel({
//     required this.uid,
//     required this.wName,
//     // this.single = true,
//     this.transformScale = 1.0,
//     // this.transformTranslateX = 0.0,
//     // this.transformTranslateY = 0.0,
//     this.radiusPc,
//     this.calloutDurationMs = 1500,
//     this.calloutWidth = 400,
//     this.calloutHeight = 85,
//     this.calloutTopPc,
//     this.calloutLeftPc,
//     this.btnLocalTopPc, // initially shown directly over target
//     this.btnLocalLeftPc,
//     this.showBtn = true,
//     this.canResizeH = true,
//     this.canResizeV = true,
//     this.calloutFillColorValue,
//     this.calloutBorderColorValue,
//     this.calloutDecorationShape = DecorationShapeEnum.rectangle,
//     this.calloutBorderRadius = 30,
//     this.calloutBorderThickness = 1,
//     this.starPoints,
//     required this.snippetName,
//     this.calloutArrowTypeIndex = 1, // ArrowType.POINTY.index,
//     this.calloutArrowColorValue,
//     this.animateArrow = false,
//   }) {
//     // textColorValue ??= Colors.blue[900]!.value;
//     calloutFillColorValue ??= Colors.grey.value;
//     // fontWeightIndex = FontWeight.normal.index;
//   }
//
//   TargetsWrapperState? get targetWrapperState => targetsWrapperGK?.currentState as TargetsWrapperState;
//
//   /// https://gist.github.com/pskink/aa0b0c80af9a986619845625c0e87a67
//   Matrix4 composeMatrix({
//     double scale = 1,
//     double rotation = 0,
//     double translateX = 0,
//     double translateY = 0,
//     double anchorX = 0,
//     double anchorY = 0,
//   }) {
//     final double c = cos(rotation) * scale;
//     final double s = sin(rotation) * scale;
//     final double dx = translateX - c * anchorX + s * anchorY;
//     final double dy = translateY - s * anchorX - c * anchorY;
//
//     //  ..[0]  = c       # x scale
//     //  ..[1]  = s       # y skew
//     //  ..[4]  = -s      # x skew
//     //  ..[5]  = c       # y scale
//     //  ..[10] = 1       # diagonal "one"
//     //  ..[12] = dx      # x translation
//     //  ..[13] = dy      # y translation
//     //  ..[15] = 1       # diagonal "one"
//     return Matrix4(c, s, 0, 0, -s, c, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
//   }
//
//   bool playingOrSelected() => targetWrapperState?.widget.parentNode.playList.isNotEmpty??false; // || (_bloc.state.aTargetIsSelected() && _bloc.state.selectedTarget!.uid == uid);
//
//   double getScale({bool testing = false}) => playingOrSelected() || testing ? transformScale : 1.0;
//
//   // Offset getTranslate(CAPIState state, {bool testing = false}) {
//   //   Size ivSize = TargetsWrapper.iwSize(wName);
//   //   Offset translate =
//   //       playingOrSelected(state) || testing ? Offset(transformTranslateX * ivSize.width, transformTranslateY * ivSize.height) : Offset.zero;
//   //   return translate;
//   // }
//
//   double get radius {
//     Size ivSize = targetWrapperState!.wrapperSize;
//     return radiusPc != null ? radiusPc! * ivSize.width : 30.0;
//   }
//
//   ArrowType getArrowType() {
//     return ArrowType.values[calloutArrowTypeIndex ?? ArrowType.POINTY.index];
//   }
//
//   // CAPIBloc get bloc => _bloc;
//
//   // Color textColor() => textColorValue == null ? Colors.blue[900]! : Color(textColorValue!);
//
//   // FocusNode textFocusNode() => _textFocusNode;
//   //
//   // FocusNode imageUrlFocusNode() => _imageUrlFocusNode;
//
//   Color calloutColor() => calloutFillColorValue == null
//       ? Colors.white
//       : Color(calloutFillColorValue!);
//
//   void setCalloutColor(Color? newColor) =>
//       calloutFillColorValue = newColor?.value;
//
//   Offset targetGlobalPos({required Size wrapperSize, required Offset wrapperPos}) {
//     // iv rect should always be measured
//     Offset ivTopLeft = wrapperPos;
//     Size ivSize = wrapperSize;
//
//     // calc from matrix
//     double scale = getScale();
//     // Offset translate = getTranslate(state);
//
//     double globalPosX = ivTopLeft.dx + /* translate.dx + */
//         ((targetLocalPosLeftPc ?? 0.0) * ivSize.width * scale);
//     double globalPosY = ivTopLeft.dy + /* translate.dy + */
//         ((targetLocalPosTopPc ?? 0.0) * ivSize.height * scale);
//
//     // in prod, target callout will be much smaller
//     // if (bloc.state.isPlaying(name)) {
//     //   globalPosX += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), ivSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), ivSize) * scale / 2;
//     //   globalPosY += bloc.state.CC_TARGET_SIZE_OUTER(!bloc.state.isPlaying(name), ivSize) * scale / 2 - bloc.state.CC_TARGET_SIZE(bloc.state.isPlaying(name), ivSize) * scale / 2;
//     // }
//     return Offset(globalPosX, globalPosY);
//   }
//
//   Offset btnStackPos() {
//     // iv rect should always be measured
//     Size ivSize = targetWrapperState!.wrapperSize;
//
//     double stackPosX = (btnLocalLeftPc ?? 0.0) * ivSize.width;
//     double stackPosY = (btnLocalTopPc ?? 0.0) * ivSize.height;
//
//     return Offset(stackPosX, stackPosY);
//   }
//
//   Offset targetStackPos() {
//     Size ivSize = targetWrapperState!.wrapperSize;
//
//     double stackPosX = (targetLocalPosLeftPc ?? 0.0) * ivSize.width;
//     double stackPosY = (targetLocalPosTopPc ?? 0.0) * ivSize.height;
//
//     return Offset(stackPosX, stackPosY);
//   }
//
//   void setTargetStackPosPc(Offset globalPos) {
//     // iv rect should always be measured
//     Offset ivTopLeft = targetWrapperState!.wrapperPos;
//     Size ivSize = targetWrapperState!.wrapperSize;
//
//     double targetLocalPosTop = globalPos.dy - ivTopLeft.dy;
//     double targetLocalPosLeft = globalPos.dx - ivTopLeft.dx;
//
//     targetLocalPosTopPc = targetLocalPosTop / ivSize.height;
//     targetLocalPosLeftPc = targetLocalPosLeft / ivSize.width;
//
//     targetLocalPosTopPc = max(0, targetLocalPosTopPc!);
//     targetLocalPosTopPc = min(targetLocalPosTopPc!, 1);
//     targetLocalPosLeftPc = max(0, targetLocalPosLeftPc!);
//     targetLocalPosLeftPc = min(targetLocalPosLeftPc!, 1);
//   }
//
//   void setBtnStackPosPc(Offset globalPos) {
//     // iv rect should always be measured
//     Offset ivTopLeft = targetWrapperState!.wrapperPos;
//     Size ivSize = targetWrapperState!.wrapperSize;
//
//     btnLocalTopPc = (globalPos.dy - ivTopLeft.dy) / (ivSize.height);
//     btnLocalLeftPc = (globalPos.dx - ivTopLeft.dx) / (ivSize.width);
//   }
//
//   Offset getCalloutPos() => Offset(
//         Useful.scrW * (calloutLeftPc ?? .5),
//         Useful.scrH * (calloutTopPc ?? .5),
//       );
//
//   // setTextCalloutPos(Offset newGlobalPos) {
//   //   calloutTopPc = newGlobalPos.dy / Useful.scrH;
//   //   calloutLeftPc = newGlobalPos.dx / Useful.scrW;
//   // }
//
//   // void init(
//   //   CAPIBloc bloc,
//   //   // GlobalKey gk,
//   //   // FocusNode textFocusNode,
//   //   // FocusNode imageUrlFocusNode,
//   // ) {
//   //   _bloc = bloc;
//   //   // _gk = gk;
//   //   // _textFocusNode = textFocusNode;
//   //   // _imageUrlFocusNode = imageUrlFocusNode;
//   //   // _transientMatrix = Matrix4.identity();
//   // }
//
//   // GlobalKey gk() => _gk;
//
//   // GlobalKey generateNewGK() => _gk = GlobalKey();
//
//   factory TargetModel.fromJson(Map<String, dynamic> data) =>
//       _$TargetModelFromJson(data);
//
//   // @override
//   // String toString() {
//   //   Matrix4 m4 = recordedM4list.isNotEmpty ? Matrix4.fromList(recordedM4list) : Matrix4.identity();
//   //   return "${m4.toString()}";
//   // }
//
//   Map<String, dynamic> toJson() => _$TargetModelToJson(this);
//
//   @override
//   bool operator ==(Object other) => other is TargetModel && other.uid == uid;
//
//   @override
//   int get hashCode {
//     return uid;
//   }
//
//   TargetModel clone() {
//     var cloneJson = toJson();
//     TargetModel clonedTC = TargetModel.fromJson(cloneJson);
//     // clonedTC._bloc = this._bloc;
//     // clonedTC._gk = this._gk;
//     // clonedTC._textFocusNode = this._textFocusNode;
//     // clonedTC._imageUrlFocusNode = this._imageUrlFocusNode;
//     // clonedTC._transientMatrix = this._transientMatrix;
//     // clonedTC._rect = this._rect;
//     clonedTC.visible = visible;
//     return clonedTC;
//   }
// }
