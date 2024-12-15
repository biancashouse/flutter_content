import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'generic_single_child_node.mapper.dart';

@MappableClass()
class GenericSingleChildNode extends SC with GenericSingleChildNodeMappable {
  String propertyName; // Widget property name, such as title, body, leading,bottom etc
  GenericSingleChildNode({
    required this.propertyName,
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => const [];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) => fco.coloredText('GenericSingleChildNode - Use toWidgetProperty() instead of toWidget() !', fontSize: 36);

  Widget? toWidgetProperty(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
    ScrollControllerName? scName = EditablePage.name(context);
    possiblyHighlightSelectedNode(scName);
      if (child == null) return null;
      try {
            Widget? childWidget = child?.toWidget(context, this);
            if (childWidget == null) throw(Exception('Failed to create widget for property: $propertyName'));
            return childWidget;
          } catch (e) {
            fco.logi('snippetRoot.toWidget() failed!');
            return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
          }
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE = "SingleChildProperty"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
