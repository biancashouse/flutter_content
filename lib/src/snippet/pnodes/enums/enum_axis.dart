import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/axis_editor.dart';

// const AlignmentEnum(this.flutterValue);
//
// final Alignment flutterValue;

part 'enum_axis.mapper.dart';

@MappableEnum()
enum AxisEnum  {
  horizontal(Axis.horizontal),
  vertical(Axis.vertical);

  const AxisEnum(this.flutterValue);

  final Axis flutterValue;

  String toSource() => 'Axis.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>

      AxisEditor(
        originalValue: AxisEnum.of(enumValueIndex),
        onChangedF: (AxisEnum? newValue) {onChangedF?.call(newValue?.index);},
      );

  // NodePropertyButtonEnum(
      //   label: 'axis',
      //   menuItems: values.map((e) => e.toMenuItem()).toList(),
      //   originalEnumIndex: enumValueIndex,
      //   onChangeF: (newIndex) {
      //     onChangedF?.call(newIndex);
      //     
      //   },
      //   wrap: true,
      //   calloutSize: const Size(200, 100),
      // );

  // @override
  // Axis toWidget({ThemeData? themeData}) {
  //   return switch (this) {
  //     AxisEnum.horizontal => Axis.horizontal,
  //     AxisEnum.vertical => Axis.vertical,
  //   };
  // }

  Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static AxisEnum? of(int? index) => index != null ? AxisEnum.values.elementAtOrNull(index) : null;
}
