// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/integer_editor.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
//
// class NodePropertyButtonInteger extends StatefulWidget {
//   final String label;
//   final String? helperText;
//   final String? originalValue;
//   final Function(String) onChangeF;
//   final Size calloutSize;
//
//   const NodePropertyButtonInteger({
//     required this.label,
//     this.helperText,
//     required this.originalValue,
//     required this.onChangeF,
//     required this.calloutSize,
//     super.key,
//   });
//
//   @override
//   State<NodePropertyButtonInteger> createState() => _NodePropertyButtonIntegerState();
// }
//
// class _NodePropertyButtonIntegerState extends State<NodePropertyButtonInteger> {
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
//     Widget label = widget.originalValue != null
//         ? Text('${widget.label}: ${widget.originalValue}', style: const TextStyle(color: Colors.white))
//         : Text('${widget.label}...', style: const TextStyle(color: Colors.white));
//     return NodePropertyCalloutButton(
//       labelWidget: label,
//       calloutButtonSize: const Size(72, 36),
//       calloutContents: (ctx) {
//         return Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Center(
//             child: IntegerEditor(
//               label: widget.label,
//               helperText: widget.helperText,
//               originalS: widget.originalValue?.toString() ?? '',
//               onChangedF: (s) {
//                 widget.onChangeF.call(s);
//               },
//               onDoneF: () {
//                 Useful.afterMsDelayDo(500, () {
//                   Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//                 });
//               },
//             ),
//           ),
//         );
//       },
//       calloutSize: widget.calloutSize,
//     );
//   }
// }
