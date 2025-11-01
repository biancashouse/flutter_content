// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'interactiveviewer_node.mapper.dart';

@MappableClass()
class InteractiveViewerNode extends SC with InteractiveViewerNodeMappable {
  double? maxScale;
  double? minScale;
  bool? scaleEnabled;

  InteractiveViewerNode({
    super.child,
    this.maxScale,
    this.minScale,
    this.scaleEnabled,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'InteractiveViewer',
      webLink:
          'https://api.flutter.dev/flutter/widgets/InteractiveViewer-class.html',
      snode: this,
      name: 'fyi',
    ),
    FYIPNode(
      label:
          "The user can transform the child by dragging to pan or pinching to zoom",
      msg: '',
      snode: this,
      name: 'fyi',
    ),
    DecimalPNode(
      snode: this,
      name: 'minScale',
      decimalValue: minScale,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => minScale = newValue),
      calloutButtonSize: const Size(80, 20),
    ),
    DecimalPNode(
      snode: this,
      name: 'maxScale',
      decimalValue: maxScale,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => maxScale = newValue),
      calloutButtonSize: const Size(80, 20),
    ),
  ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "InteractiveViewer";

  // @override
  // String toSource(BuildContext context) {
  //   return '''InteractiveViewer(
  //     child: ${child?.toSource(context)}
  //     )''';
  // }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    // try {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

    return InteractiveViewer(
      key: createNodeWidgetGK(),
      minScale: minScale ?? 0.8,
      maxScale: maxScale ?? 2.5,
      child:
          child?.buildFlutterWidget(context, this) ??
          Icon(Icons.warning, color: Colors.yellow),
    );
    // } catch (e) {
    //   return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    // }
  }
}
