import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/wrapper/transformable_scaffold.dart';

part 'transformable_scaffold_node.mapper.dart';

@MappableClass(discriminatorKey: 'tsc')
class TransformableScaffoldNode extends STreeNode with TransformableScaffoldNodeMappable {
  ScaffoldNode scaffold;

  TransformableScaffoldNode({
    required this.scaffold,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) {
    // print("ContainerNode.properties()...");
    return [];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    parent = parentNode;  // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    return TransformableScaffold(suppliedScaffold: scaffold.toWidget(context, this));
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TransformableScaffold";
}
