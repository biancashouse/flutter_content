import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'border_side_properties.mapper.dart';

@MappableClass(discriminatorKey: 'side', includeSubClasses: [])
class BorderSideProperties with BorderSidePropertiesMappable {
  double? width;
  int? colorValue;

  BorderSideProperties({
    this.width,
    this.colorValue,
  });

  BorderSide toBorderSide() {
    return BorderSide(
      width: width ?? 1.0,
      color: colorValue != null ? Color(colorValue!) : Colors.black,
    );
  }

  String toSource(BuildContext context) {
    return 'BorderSide(width:$width, color:$colorValue)';
  }
}
