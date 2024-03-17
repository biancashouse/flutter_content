// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
// import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
// import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';
//
// part 'target_button_node.mapper.dart';
//
// @MappableClass()
// class TargetButtonNode extends ButtonNode with TargetButtonNodeMappable {
//   String name;
//   AlignmentEnum? playButtonAlignment;
//
//   TargetButtonNode({
//     required this.name,
//     this.playButtonAlignment,
//     super.buttonStyleGroup,
//     super.onTapHandlerName,
//     super.calloutConfigGroup,
//     super.child,
//   });
//
//   @override
//   List<PTreeNode> createPropertiesList(BuildContext context) => [
//         StringPropertyValueNode(
//           snode: this,
//           name: 'text',
//           stringValue: name,
//           onStringChange: (newValue) =>
//               refreshWithUpdate(() => name = newValue),
//           calloutButtonSize: const Size(280, 70),
//           calloutSize: const Size(280, 140),
//         ),
//         EnumPropertyValueNode<AlignmentEnum?>(
//           snode: this,
//           name: 'alignment',
//           valueIndex: playButtonAlignment?.index,
//           onIndexChange: (newValue) => refreshWithUpdate(
//               () => playButtonAlignment = AlignmentEnum.of(newValue)),
//         ),
//       ...super.createPropertiesList(context),
//       ];
//
//   // @override
//   // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
//   //       NodePropertyButtonText(
//   //           label: "Snppet Name",
//   //           text: snippetName,
//   //           calloutSize: const Size(600, 200),
//   //           onChangeF: (s) {
//   //             snippetName = s;
//   //             bloc.add(const CAPIEvent.forceRefresh());
//   //           }),
//   //     ];
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     setParent(parentNode);
//     if (name.isNotEmpty) {
//       return SingleTargetWrapper(
//         name: name,
//         child: super.child?.toWidget(context, this) ??
//             const Icon(
//               Icons.question_mark,
//               color: Colors.orangeAccent,
//             ),
//       );
//     } else {
//       return child?.toWidget(context, this) ??
//           const Icon(
//             Icons.warning,
//             color: Colors.red,
//             size: 24,
//           );
//     }
//   }
//
//   @override
//   String toSource(BuildContext context) {
//     return child?.toSource(context) ??
//         'Icon(Icons.warning, color: Colors.red, size: 24,)';
//   }
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
//   @override
//   Widget? logoSrc() => const Icon(Icons.messenger);
//
//   static const String FLUTTER_TYPE = "TargetWrapper";
// }
