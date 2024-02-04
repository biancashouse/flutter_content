// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/features.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
//
// class NodePropertyButtonRadioMenu2<T> extends StatefulWidget {
//   final String label;
//   final List<Widget> menuItems;
//   final List<T> values;
//   final dynamic originalValue;
//   final ValueChanged<T?> onChangeF;
//   final bool wrap;
//   final Size calloutSize;
//
//   const NodePropertyButtonRadioMenu2({
//     required this.label,
//     required this.menuItems,
//     required this.values,
//     required this.originalValue,
//     required this.onChangeF,
//     this.wrap = false,
//     required this.calloutSize,
//     super.key,
//   });
//
//   @override
//   State<NodePropertyButtonRadioMenu2> createState() => _NodePropertyButtonRadioMenu2State();
// }
//
// class _NodePropertyButtonRadioMenu2State<T> extends State<NodePropertyButtonRadioMenu2> {
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
//     int selection = widget.values.indexOf(widget.originalValue);
//     return NodePropertyCalloutButton(
//       label: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Useful.whiteText('${widget.label}: '),
//           selection == -1 ? Useful.whiteText('...') : widget.menuItems[selection],
//         ],
//       ),
//       calloutContents: (ctx) =>
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Wrap(
//                   children: widget.values
//                       .asMap()
//                       .entries
//                       .map((entry) {
//                     int i = entry.key;
//                     return !widget.wrap
//                         ? RadioListTile<T>(
//                       dense: true,
//                       visualDensity: VisualDensity.standard,
//                       value: widget.values[i],
//                       groupValue: widget.originalValue,
//                       tileColor: Colors.purple.shade50,
//                       title: widget.menuItems[i],
//                       toggleable: true,
//                       activeColor: Colors.white,
//                       // contentPadding: EdgeInsets.zero,
//                       onChanged: (option) {
//                         widget.onChangeF(option);
//                         Useful.afterMsDelayDo(500, () {
//                           Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//                         });
//                       },
//                     )
//                         : Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Radio<T>(
//                             visualDensity: VisualDensity.standard,
//                             value: widget.values[i],
//                             groupValue: widget.originalValue,
//                             toggleable: true,
//                             activeColor: Colors.white,
//                             // contentPadding: EdgeInsets.zero,
//                             onChanged: (dynamic option) {
//                                 widget.onChangeF.call(option);
//                                 Useful.afterMsDelayDo(500, () {
//                                   Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//                                 });
//                             },
//                           ),
//                           widget.menuItems[i],
//                         ],
//                       ),
//                     );
//                   }).toList()),
//             ),
//           ),
//       calloutSize: widget.calloutSize,
//     );
//   }
// }
