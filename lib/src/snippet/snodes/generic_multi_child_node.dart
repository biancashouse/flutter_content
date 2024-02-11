import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'generic_multi_child_node.mapper.dart';

@MappableClass()
class GenericMultiChildNode extends MC with GenericMultiChildNodeMappable {
  String propertyName; // Widget property name, such as actions
  GenericMultiChildNode({
    required this.propertyName,
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => const [];

  @override
  Widget toWidget(BuildContext context, STreeNode parentNode) => Useful.coloredText('GenericMultiChildNode - Use toWidgetProperty() instead of toWidget() !', fontSize: 36);

  @override
  List<Widget>? toWidgetProperty(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode(context);
    List<Widget> childWidgets = children.map((node) => node.toWidget(context, this)).toList();
    return childWidgets;
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE = "MultiChildProperty"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
