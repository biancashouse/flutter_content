import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';

import 'border_side_properties.dart';

part 'outlined_border_properties.mapper.dart';

@MappableClass(discriminatorKey: 'outlinedBorder', includeSubClasses: [])
class OutlinedBorderProperties with OutlinedBorderPropertiesMappable {
  OutlinedBorderEnum? outlinedBorderType;
  BorderSideProperties? side;

  OutlinedBorderProperties({
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
