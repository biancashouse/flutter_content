// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
//
// part 'enum_alignment.mapper.dart';
//
// @MappableEnum()
// enum AlignmentEnumModel   {
//   topLeft(Alignment.topLeft),
//   topCenter(Alignment.topCenter),
//   topRight(Alignment.topRight),
//   centerLeft(Alignment.centerLeft),
//   center(Alignment.center),
//   centerRight(Alignment.centerRight),
//   bottomLeft(Alignment.bottomLeft),
//   bottomCenter(Alignment.bottomCenter),
//   bottomRight(Alignment.bottomRight);
//
//   const AlignmentEnumModel(this.flutterValue);
//
//   final Alignment flutterValue;
//
//   AlignmentEnumModel get oppositeAlignment => switch (this) {
//         AlignmentEnumModel.topLeft => AlignmentEnumModel.bottomRight,
//         AlignmentEnumModel.topCenter => AlignmentEnumModel.bottomCenter,
//         AlignmentEnumModel.topRight => AlignmentEnumModel.bottomLeft,
//         AlignmentEnumModel.centerLeft => AlignmentEnumModel.centerRight,
//         AlignmentEnumModel.center => AlignmentEnumModel.center,
//         AlignmentEnumModel.centerRight => AlignmentEnumModel.centerLeft,
//         AlignmentEnumModel.bottomLeft => AlignmentEnumModel.topRight,
//         AlignmentEnumModel.bottomCenter => AlignmentEnumModel.topCenter,
//         AlignmentEnumModel.bottomRight => AlignmentEnumModel.topLeft,
//       };
//
//   /// for flutter_content usage
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
//         calloutButtonSize: const Size(120, 40),
//         calloutSize: const Size(240, 200),
//         scName: scName,
//       );
//
//   Widget toMenuItem() => Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const SizedBox(
//             width: 8,
//           ),
//           Container(
//             width: 30,
//             height: 30,
//             alignment: flutterValue,
//             decoration: const ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(color: Colors.white, width: 1),
//                 borderRadius: BorderRadius.all(Radius.circular(6)),
//               ),
//             ),
//             child: Container(
//               width: 10,
//               height: 10,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//         ],
//       );
//
//   String toSource() => 'Alignment.$name';
//
//   static AlignmentEnumModel? of(int? index) => index != null ? AlignmentEnumModel.values.elementAtOrNull(index) : null;
// }
