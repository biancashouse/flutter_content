// // ignore_for_file: constant_identifier_names
//
// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
//
// part 'enum_arrow_type.mapper.dart';
//
// @MappableEnum()
// enum ArrowTypeEnum  {
//   NONE(ArrowTypeEnum.NONE),
//   POINTY(ArrowTypeEnum.POINTY),
//   VERY_THIN(ArrowTypeEnum.VERY_THIN),
//   VERY_THIN_REVERSED(ArrowTypeEnum.VERY_THIN_REVERSED),
//   THIN(ArrowTypeEnum.THIN),
//   THIN_REVERSED(ArrowTypeEnum.THIN_REVERSED),
//   MEDIUM(ArrowTypeEnum.MEDIUM),
//   MEDIUM_REVERSED(ArrowTypeEnum.MEDIUM_REVERSED),
//   LARGE(ArrowTypeEnum.LARGE),
//   LARGE_REVERSED(ArrowTypeEnum.LARGE_REVERSED),
//   // HUGE,
//   // HUGE_REVERSED
//   ;
//
//   const ArrowTypeEnum(this.flutterValue);
//
//   final ArrowType flutterValue;
//
//   String toSource() => name;
//
//   static Widget propertyNodeContents({
//     int? enumValueIndex,
//     required SNode snode,
//     required String label,
//     ValueChanged<int?>? onChangedF,
//     required ScrollControllerName? scName,
//   }) =>
//       PropertyButtonEnum(
//         label: label,
//         menuItems: values.map((e) => e.toMenuItem()).toList(),
//         originalEnumIndex: enumValueIndex,
//         onChangeF: (newIndex) {
//           onChangedF?.call(newIndex);
//         },
//         wrap: true,
//         calloutButtonSize: const Size(120, 80),
//         calloutSize: Size(260, values.length * 50),
//         scName: scName,
//       );
//
//   Widget toMenuItem() => fco.coloredText(name, color: Colors.white);
//
//   static ArrowTypeEnum? of(int? index) => index != null ? ArrowTypeEnum.values.elementAtOrNull(index) : null;
// }
