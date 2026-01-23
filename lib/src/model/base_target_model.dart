import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'alignment_model.dart';
import 'size_model.dart';

abstract class TargetConfigModel {
  TargetId uid;

  // must update the calloutConfig whenever we update this TargetConfig,
  // otherwise fco.refresh won't show the changes
  @JsonKey(includeFromJson: false, includeToJson: false)
  CalloutConfig? calloutConfig;

   SizeModel? calloutSize;

  int calloutDurationMs;

  // decoration
  UpTo6Colors? calloutFillColors;
  UpTo6Colors? calloutBorderColors;
  DecorationShapeEnum? calloutDecorationShapeEnum;
  double? calloutBorderRadius;
  double? calloutBorderThickness;
  int? starPoints;

  double transformScale;

  TargetPointerTypeEnum? targetPointerTypeEnum;
  ColorModel? bubbleOrTargetPointerColor;
  bool? animatePointer;

  bool autoPlay;

  bool canResizeH;
  bool canResizeV;

  bool followScroll;

  TargetConfigModel({
    required this.uid,
    this.calloutSize,
    this.calloutDurationMs = 1500,
    this.calloutFillColors,
    this.calloutBorderColors,
    this.calloutDecorationShapeEnum,
    this.calloutBorderRadius,
    this.calloutBorderThickness,
    this.starPoints,
    // required this.snippetName,
    this.targetPointerTypeEnum,
    this.bubbleOrTargetPointerColor,
    this.animatePointer = false,
    // this.tcSeparation,
    this.autoPlay = false,
    this.canResizeH = true,
    this.canResizeV = true,
    this.transformScale = 1.0,
    this.followScroll = true,
  });

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

  String get contentCId => '$uid';

  // for now, assumes a single fill color
  Color bgColor() => calloutFillColors?.color1?.flutterValue ?? Colors.white;

  Color borderColor() =>
      calloutBorderColors?.color1?.flutterValue ?? Colors.grey;

  void setCalloutFillColor(ColorModel? newColor) =>
      calloutFillColors = UpTo6Colors(color1: newColor ?? ColorModel.white());

  void setCalloutStarPoints(int? newValue) => starPoints = newValue;

  void removeContentCallout({bool skipOnDismiss = false}) =>
      fco.dismiss(contentCId, skipOnDismiss: skipOnDismiss);

  bool isShowingContentCallout() => fco.anyPresent([contentCId]);

  void hideContentCallout() => fco.hide(contentCId);

  void unhideContentCallout() => fco.unhide(contentCId);

  void refreshContentCallout() => fco.rebuild(contentCId);

  void saveParentSnippet(SnippetRootNode? rootNode) {
    if (rootNode != null) {
      fco.dismissAll(onlyToasts: true);
      // HydratedBloc.storage.write('flutter-content', rootNode.toJson());
      fco.showToast(
        removeAfterMs: 1500,
        msg: 'saving changes...',
        gravity: Alignment.topCenter,
        bgColor: Colors.yellow,
        textColor: Colors.black,
      );
      // fco.modelRepo.saveNewVersionOfSnippet(rootNode);
      fco.appInfo.cachedSnippetInfo(rootNode.name)?.notifyChange(rootNode);
      fco.dismissToast(Alignment.topCenter);
    }
  }
}
