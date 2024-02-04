// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/features.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
//
// class NodePropertyButtonAlignment extends StatefulWidget {
//   final String label;
//   final AlignmentEnum? alignment;
//   final Function(AlignmentEnum) onChangeF;
//
//   const NodePropertyButtonAlignment({required this.label, required this.alignment, required this.onChangeF, super.key});
//
//   @override
//   State<NodePropertyButtonAlignment> createState() => _NodePropertyButtonAlignmentState();
// }
//
// class _NodePropertyButtonAlignmentState extends State<NodePropertyButtonAlignment> {
//   late GlobalKey propertyBtnGK;
//
//   @override
//   void initState() {
//     super.initState();
//     propertyBtnGK = GlobalKey();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget textAlignLabel = widget.alignment != null
//         ? Text('alignment: ${widget.alignment!.name}', style: const TextStyle(color: Colors.white))
//         : const Text('alignment...', style: TextStyle(color: Colors.white));
//     return NodePropertyCalloutButton(
//       label: textAlignLabel,
//       calloutContents: (ctx) {
//         return IntrinsicWidth(
//           child: Column(
//               children: AlignmentEnum.values.map((v) {
//                 return RadioListTile<AlignmentEnum>(
//                   dense: true,
//                   value: v,
//                   groupValue: widget.alignment,
//                   tileColor: Colors.purple.shade50,
//                   title: v.toMenuItem(),
//                   toggleable: true,
//                   onChanged: (newValue) {
//                     if (newValue != null) {
//                       widget.onChangeF.call(newValue);
//                       Useful.afterMsDelayDo(500, () {
//                         Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//                       });
//                     }
//                   },
//                 );
//               }).toList()),
//         );
//       },
//       calloutSize: const Size(320, 180),
//     );
//   }
// }
