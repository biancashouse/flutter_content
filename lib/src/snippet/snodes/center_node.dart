// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'center_node.mapper.dart';

@MappableClass()
class CenterNode extends SC with CenterNodeMappable {
  CenterNode({
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'Center',
        webLink: 'https://api.flutter.dev/flutter/widgets/Center-class.html',
        snode: this,
        name: 'fyi'),
    FYIPNode(
        label: "Constraint Imposed on Child: 'Loose' --> 'Tight' (when sizing).",
        msg: "Passes loose constraints, but if the child returns a fixed size, Center makes its own size tight to its parent, then sets the child's position. \n\n"
            "It tends to fill its parent because its underlying render object first tries to be as big as its parent allows (by passing loose constraints down), "
            "then centers its child within that space.\n\n"
            "The child doesn't fill the Center, but the Center widget itself usually expands to fill its parent area.",
        snode: this,
        name: 'fyi'),
  ];

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
