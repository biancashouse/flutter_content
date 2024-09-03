import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gap/gap.dart';

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
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    if (child == null) return null;
    try {
      Widget? childWidget = child?.toWidget(context, this);
      if (childWidget == null) throw(Exception('Failed to create widget for property: $propertyName'));
      return childWidget;
    } catch (e) {
      fco.logi('snippetRoot.toWidget() failed!');
      return Material(
        textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              fco.errorIcon(Colors.red),
              const Gap(10),
              fco.coloredText(e.toString()),
            ],
          ),
        ),
      );
    }
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE = "SingleChildProperty"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
