import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'widgetspan_node.mapper.dart';

@MappableClass()
class WidgetSpanNode extends InlineSpanNode with WidgetSpanNodeMappable {
  STreeNode? child;

  WidgetSpanNode({
    this.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => const [];

  @override
  InlineSpan toInlineSpan(BuildContext context, {bool isRoot = false}) {
    try {
      return WidgetSpan(
        child: child != null ? child!.toWidget(context, this) : fco.boxChild(child: const Text("missing child!"), bgColor: Colors.red),
      );
    } catch (e) {
      fco.logi('cannot render $FLUTTER_TYPE!');
    }
    return  WidgetSpan(child: fco.errorIcon(Colors.red));
  }

  @override
  String toSource(
    BuildContext context, {
    bool isRoot = false,
  }) {
    return '''WidgetSpan(
      child: ${child != null}
      ? ${child!.toSource(context)}
      : ${fco.boxChild(child: const Text("missing child!"), bgColor: Colors.red)},
  )''';
  }

  @override
  List<Widget> menuAnchorWidgets_WrapWith(NodeAction action, bool? skipHeading) {
    return [
      ...super.menuAnchorWidgets_Heading(action),
      menuItemButton("TextSpan", TextSpanNode, action),
    ];
  }

  @override
  List<Type> replaceWithOnly() => [TextSpanNode, WidgetSpan];

  @override
  List<Type> wrapCandidates() => [TextSpanNode];

  @override
  List<Type> wrapWithOnly() => [TextSpanNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "WidgetSpan";
}
