import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'generic_single_child_node.mapper.dart';

@MappableClass()
class GenericSingleChildNode extends SC with GenericSingleChildNodeMappable {
  String
      propertyName; // Widget property name, such as title, body, leading,bottom etc
  GenericSingleChildNode({
    required this.propertyName,
    super.child,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => const [];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) => fco.coloredText(
      'GenericSingleChildNode - Use toWidgetProperty() instead of toWidget() !',
      fontSize: 36);

  Widget? toWidgetProperty(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      if (child == null) return null;
      try {
        Widget? childWidget = child?.toWidget(context, this);
        if (childWidget == null) {
          throw (Exception(
              'Failed to create widget for property: $propertyName'));
        }
        return childWidget;
      } catch (e) {
        fco.logger.i('snippetRoot.toWidget() failed!');
        return Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg: e.toString());
      }
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  PreferredSizeWidget? toPreferredSizeWidgetProperty(
      BuildContext context, double preferredH, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      if (child == null) return null;
      try {
        PreferredSizeWidget? childWidget = PreferredSize(
          key: createNodeWidgetGK(),
          preferredSize: Size.fromHeight(preferredH),
          child: child?.toWidget(context, this) ?? Placeholder(),
        );
        return childWidget;
      } catch (e) {
        fco.logger.i('snippetRoot.toWidget() failed!');
        return PreferredSize(
            preferredSize: Size.fromHeight(preferredH),
            child: Error(
              key: createNodeWidgetGK(),
              FLUTTER_TYPE,
              color: Colors.red,
              size: 16,
              errorMsg: e.toString(),
            ));
      }
    } catch (e) {
      return PreferredSize(
          preferredSize: Size.fromHeight(preferredH),
          child: Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg: e.toString(),
          ));
    }
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE =
      "SingleChildProperty"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
