// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'intrinsic_height_node.mapper.dart';

@MappableClass()
class IntrinsicHeightNode extends SC with IntrinsicHeightNodeMappable {
  IntrinsicHeightNode({
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'Center',
        webLink: 'https://api.flutter.dev/flutter/widgets/Center-class.html',
        snode: this,
        name: 'fyi')
  ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "IntrinsicHeight";

  // @override
  // String toSource(BuildContext context) {
  //   return '''Center(
  //     child: ${child?.toSource(context)}
  //     )''';
  // }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    // try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

      return Center(
            key: createNodeWidgetGK(),
            child: child?.buildFlutterWidget(context, this),
          );
    // } catch (e) {
    //   return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    // }
  }
}
