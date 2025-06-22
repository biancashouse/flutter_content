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
  List<PNode> properties(BuildContext context, SNode? parentSNode) => const [];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) => fco.coloredText('GenericMultiChildNode - Use toWidgetProperty() instead of toWidget() !', fontSize: 36);

  List<Widget>? toWidgetProperty(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      List<Widget> childWidgets = children.map((node) => node.toWidget(context, this)).toList();
      return childWidgets;
    } catch (e) {
      fco.logger.e('', error:e);
      return [];
    }
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE = "MultiChildProperty"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
