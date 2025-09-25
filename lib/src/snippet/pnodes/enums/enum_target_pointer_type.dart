// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_target_pointer_type.mapper.dart';

@MappableEnum()
enum TargetPointerTypeEnum  {
  NONE(TargetPointerType.none()),
  POINTY(TargetPointerType.bubble()),
  VERY_THIN(TargetPointerType.very_thin_line()),
  VERY_THIN_REVERSED(TargetPointerType.very_thin_reversed_line()),
  THIN(TargetPointerType.thin_line()),
  THIN_REVERSED(TargetPointerType.thin_reversed_line()),
  MEDIUM(TargetPointerType.medium_line()),
  MEDIUM_REVERSED(TargetPointerType.medium_reversed_line()),
  LARGE(TargetPointerType.large_line()),
  LARGE_REVERSED(TargetPointerType.large_reversed_line()),
  ;

  const TargetPointerTypeEnum(this.targetPointerType);

  final TargetPointerType targetPointerType;

  String toSource() => name;

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
        calloutButtonSize: const Size(120, 80),
        calloutSize: Size(260, values.length * 50),
        scName: scName,
      );

  Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static TargetPointerTypeEnum? of(int? index) => index != null ? TargetPointerTypeEnum.values.elementAtOrNull(index) : null;
}
