// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/main_axis_size_editor.dart';

part 'enum_main_axis_size.mapper.dart';

@MappableEnum()
enum MainAxisSizeEnum {
  min(MainAxisSize.min),
  max(MainAxisSize.max);

  const MainAxisSizeEnum(this.flutterValue);

  final MainAxisSize flutterValue;

  String toSource() => 'MainAxisSize.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      MainAxisSizeEditor(
        originalValue: MainAxisSizeEnum.of(enumValueIndex),
        onChangedF: (MainAxisSizeEnum? newValue) {
          onChangedF?.call(newValue?.index);
        },
      );

  Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static MainAxisSizeEnum? of(int? index) => index != null ? MainAxisSizeEnum.values.elementAtOrNull(index) : null;
}
