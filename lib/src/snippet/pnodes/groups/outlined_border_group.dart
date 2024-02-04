import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';

import 'border_side_group.dart';

part 'outlined_border_group.mapper.dart';

@MappableClass(discriminatorKey: 'outlinedBorder', includeSubClasses: [])
class OutlinedBorderGroup with OutlinedBorderGroupMappable {
  OutlinedBorderEnum? outlinedBorderType;
  BorderSideGroup? side;

  OutlinedBorderGroup({
    this.side,
    this.outlinedBorderType,
  });

  OutlinedBorder? toOutlinedBorder({double? radius}) {
    return outlinedBorderType?.toFlutterWidget(
      nodeSide: side,
      nodeRadius: radius,
    );
  }
  String toSource(BuildContext context) {
    return ''; //'''BorderSide(width:$width, color:$colorValue)';
  }
}
