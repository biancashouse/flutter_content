import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

part 'enum_corner.mapper.dart';

@MappableEnum()
enum BadgePositionEnum {
  topLeft(BadgePosition.topStart),
  topRight(BadgePosition.topEnd),
  bottomLeft(BadgePosition.bottomStart),
  bottomRight(BadgePosition.bottomEnd);

  const BadgePositionEnum(this.flutterValue);

  final BadgePosition flutterValue;

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(120, 40),
        calloutSize: const Size(240, 200),
        scName: scName,
      );

  Widget toMenuItem() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 8,
          ),
          Container(
            width:30, height: 30,
            foregroundDecoration: const RotatedCornerDecoration.withColor(
              color: Color(0xffffd700),
              badgeSize: Size(12, 12),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      );

  static BadgePositionEnum? of(int? index) => index != null ? BadgePositionEnum.values.elementAtOrNull(index) : null;
}
