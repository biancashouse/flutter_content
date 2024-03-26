// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/directory_tree_node_widget.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/fs_directory_tree_node_widget.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
//
// part 'fs_bucket_node.mapper.dart';
//
// @MappableClass()
// class FSBucketNode extends CL with FSBucketNodeMappable {
//   String? name;
//   GenericSingleChildNode root;
//
//   FSBucketNode({
//     this.name,
//     required this.root,
//   });
//
//   @override
//   List<PTreeNode> createPropertiesList(BuildContext context) =>
//       [
//         StringPropertyValueNode(
//           snode: this,
//           name: 'name',
//           stringValue: name ?? 'bucket name?',
//           onStringChange: (newValue) =>
//               refreshWithUpdate(() => name = newValue),
//           calloutButtonSize: const Size(280, 70),
//           calloutSize: const Size(280, 70),
//         ),
//       ];
//
//   @override
//   String toSource(BuildContext context) => "";
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     setParent(parentNode);
//     possiblyHighlightSelectedNode();
//
//     var rootWidget = root.toWidgetProperty(context, this);
//
//     return SingleChildScrollView(
//       key: createNodeGK(),
//       padding: const EdgeInsets.all(10),
//       child: rootWidget,
//     );
//   }
//
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
//   @override
//   Widget? logoSrc() => null;
//
//   static const String FLUTTER_TYPE = "FSBucket";
// }
