// import 'package:flutter/material.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/mappable_nodes/edgeinsets_node_property.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/mappable_nodes/edgeinsets_node_value.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/edge_insets_editor2.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
//
// import 'edge_insets_editor.dart';
//
// class NodePropertyButtonEdgeInsetsEditor extends StatefulWidget {
//   final String label;
//   final double originalValue;
//   final bool originalValueTop;
//   final bool originalValueBottom;
//   final bool originalValueLeft;
//   final bool originalValueRight;
//   final EdgeInsetsChangedF onChangedF;
//   final Size calloutSize;
//
//   const NodePropertyButtonEdgeInsetsEditor({
//     required this.label,
//     required this.originalValue,
//     required this.originalValueTop,
//     required this.originalValueBottom,
//     required this.originalValueLeft,
//     required this.originalValueRight,
//     required this.onChangedF,
//     required this.calloutSize,
//     super.key,
//   });
//
//   @override
//   State<NodePropertyButtonEdgeInsetsEditor> createState() => _NodePropertyButtonEdgeInsetsEditorState();
// }
//
// class _NodePropertyButtonEdgeInsetsEditorState extends State<NodePropertyButtonEdgeInsetsEditor> {
//   late GlobalKey propertyBtnGK;
//   // late double value;
//   late bool isTop;
//   late bool isBottom;
//   late bool isLeft;
//   late bool isRight;
//
//   @override
//   void initState() {
//     super.initState();
//     propertyBtnGK = GlobalKey();
//     // value = widget.originalValue;
//     isTop = widget.originalValueTop;
//     isLeft = widget.originalValueLeft;
//     isBottom = widget.originalValueBottom;
//     isRight = widget.originalValueRight;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return NodePropertyCalloutButton(label: Text('${widget.label}...', style: const TextStyle(color: Colors.white)),
//         calloutContents: (ctx)
//     {
//       return
//     },calloutSize
//     :
//     widget
//     .
//     calloutSize
//     ,
//     );
//   }
// }
