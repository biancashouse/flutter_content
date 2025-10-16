// ignore_for_file: constant_identifier_names
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'widgetspan_node.mapper.dart';

@MappableClass()
class WidgetSpanNode extends InlineSpanNode with WidgetSpanNodeMappable {
  SNode? child;

  WidgetSpanNode({
    this.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'WidgetSpan',
            webLink:
                'https://api.flutter.dev/flutter/painting/WidgetSpan-class.html',
            snode: this,
            name: 'fyi')
      ];

  @override
  InlineSpan toInlineSpan(BuildContext context, {bool isRoot = false}) {
    try {
      return WidgetSpan(
        child: child != null
            ? child!.buildFlutterWidget(context, this)
            : fco.boxChild(
                child: const Text("missing child!"), bgColor: Colors.red),
      );
    } catch (e) {
      fco.logger.i('cannot render $FLUTTER_TYPE!');
      return WidgetSpan(
          child: Error(
              key: createNodeWidgetGK(), FLUTTER_TYPE, errorMsg: e.toString()));
    }
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
  bool canAppendAChild() => child == null;

  @override
  List<Widget> menuAnchorWidgets_WrapWith(BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(context, action, scName),
      menuItemButton(context, "TextSpan", TextSpanNode, action, scName),
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
