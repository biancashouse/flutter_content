import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_arrow_type.dart';

part 'callout_config_group.mapper.dart';

@MappableClass()
class CalloutConfigGroup with CalloutConfigGroupMappable {
  String? contentSnippetName;
  AlignmentEnum? targetAlignment;
  // AlignmentEnum? calloutAlignment;
  double? calloutTop;
  double? calloutLeft;
  int? colorValue;
  ArrowTypeEnum? arrowType;
  Color? arrowColor;
  double? separation;
  bool resizableH;
  bool resizableV;
  bool closeOnBarrierTap;
  bool showCloseButton;
  double? closeAfterMs;

  CalloutConfigGroup({
    this.contentSnippetName,
    this.targetAlignment,
    // this.calloutAlignment,
    this.calloutTop,
    this.calloutLeft,
    this.colorValue,
    this.arrowType,
    this.arrowColor,
    this.separation,
    this.resizableH = true,
    this.resizableV = true,
    this.closeOnBarrierTap = true,
    this.showCloseButton = false,
    this.closeAfterMs,
  });


  // // @override
  // String toSource(BuildContext context) {
  //   CAPIBloc bloc = FlutterContent().capiBloc;
  //   return '';
  // }
}
