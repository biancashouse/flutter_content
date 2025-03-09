// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'center_node.mapper.dart';

@MappableClass()
class CenterNode extends SC with CenterNodeMappable {
  CenterNode({
    super.child,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => const [];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Center";

  // @override
  // String toSource(BuildContext context) {
  //   return '''Center(
  //     child: ${child?.toSource(context)}
  //     )''';
  // }

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    // try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

      return Center(
            key: createNodeWidgetGK(),
            child: child?.toWidget(context, this),
          );
    // } catch (e) {
    //   return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    // }
  }
}
