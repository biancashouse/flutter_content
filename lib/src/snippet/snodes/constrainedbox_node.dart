import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'constrainedbox_node.mapper.dart';

@MappableClass()
class ConstrainedBoxNode extends SC with ConstrainedBoxNodeMappable {
  double? minWidth;
  double? minHeight;
  double? maxWidth;
  double? maxHeight;

  ConstrainedBoxNode({
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'ConstrainedBox',
      webLink:
          'https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html',
      snode: this,
      name: 'fyi',
    ),
      DecimalPNode(
        snode: this,
        name: 'minWidth',
        decimalValue: minWidth,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => minWidth = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      DecimalPNode(
        snode: this,
        name: 'minHeight',
        decimalValue: minHeight,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => minHeight = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      DecimalPNode(
        snode: this,
        name: 'maxWidth',
        decimalValue: maxWidth,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => maxWidth = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      DecimalPNode(
        snode: this,
        name: 'maxHeight',
        decimalValue: maxHeight,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => maxHeight = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    // var targetGK = nodeWidgetGK;

    try {
      return ConstrainedBox(
        // key: targetGK,
        key: createNodeWidgetGK(),
        constraints: BoxConstraints(
          minWidth: minWidth != null ? minWidth! : 0.0,
          minHeight: minHeight != null ? minHeight! : 0.0,
          maxWidth: maxWidth != null ? maxWidth! : double.infinity,
          maxHeight: maxHeight != null ? maxHeight! : double.infinity,
        ),
        child: child?.buildFlutterWidget(context, this),
      );
    } catch (e) {
      print(e);
      return Placeholder(key: createNodeWidgetGK());
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "ConstrainedBox";
}
