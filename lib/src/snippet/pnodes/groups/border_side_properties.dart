import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'border_side_properties.mapper.dart';

@MappableClass(discriminatorKey: 'side', includeSubClasses: [])
class BorderSideProperties with BorderSidePropertiesMappable {
  double? width;
  ColorModel? color;

  BorderSideProperties({
    this.width,
    this.color,
  });

  BorderSide toBorderSide() {
    return BorderSide(
      width: width ?? 1.0,
      color: color?.flutterValue ?? Colors.black,
    );
  }

  String toSource(BuildContext context) {
    return 'BorderSide(width:$width, color:$color)';
  }
}
