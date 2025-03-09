import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'inlinespan_node.mapper.dart';

const List<Type> inlinespanSubClasses = [TextSpanNode, WidgetSpanNode];

@MappableClass(discriminatorKey: 'is', includeSubClasses: inlinespanSubClasses)
abstract class InlineSpanNode extends SNode with InlineSpanNodeMappable {
  InlineSpanNode();

  InlineSpan toInlineSpan(BuildContext context) {
    // superclasses must override
    throw UnimplementedError();
  }

  // String toSource(
  //   BuildContext context, {
  //   bool isRoot = false,
  // });

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) => const Text('InlineSpan is a Node!');
}
