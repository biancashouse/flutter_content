import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';

part 'center_node.mapper.dart';

@MappableClass()
class CenterNode extends SingleChildNode with CenterNodeMappable {
  CenterNode({
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => const [];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Center";

  @override
  String toSource(BuildContext context) {
    return '''Center(
      child: ${child?.toSource(context)}
      )''';
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode(context);
    return Center(
      key: nodeWidgetGK,
      child: child?.toWidget(context, this),
    );
  }
}
