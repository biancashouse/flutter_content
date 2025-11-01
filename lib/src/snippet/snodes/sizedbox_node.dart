import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'sizedbox_node.mapper.dart';

@MappableClass()
class SizedBoxNode extends SC with SizedBoxNodeMappable {
  double? width;
  double? height;
  bool? expand;

  SizedBoxNode({this.width, this.height, this.expand, super.child});

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'SizedBox',
      webLink: 'https://api.flutter.dev/flutter/widgets/SizedBox-class.html',
      snode: this,
      name: 'fyi',
    ),
    FYIPNode(
      label: "Constraint Imposed on Child: 'Tight' in specified dimensions",
      msg: "forces its child to be a specific, fixed size.",
      snode: this,
      name: 'fyi',
    ),
    if (!(expand ?? false))
      DecimalPNode(
        snode: this,
        name: 'width',
        decimalValue: width,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => width = newValue),
        calloutButtonSize: const Size(80, 20),
      ),
    if (!(expand ?? false))
      DecimalPNode(
        snode: this,
        name: 'height',
        decimalValue: height,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => height = newValue),
        calloutButtonSize: const Size(80, 20),
      ),
    FYIPNode(
      label: "Creates a box that will become as large as its parent allows.",
      msg:
          "const SizedBox.expand({super.key, super.child})\n"
          "    : width = double.infinity,\n"
          "      height = double.infinity;",
      snode: this,
      name: 'fyi',
    ),
    BoolPNode(
      snode: this,
      name: 'expand',
      boolValue: expand,
      onBoolChange: (newValue) =>
          refreshWithUpdate(context, () => expand = newValue),
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    // var targetGK = nodeWidgetGK;

    try {
      return expand??false
          ? SizedBox.expand(
        key: createNodeWidgetGK(),
        child: child?.buildFlutterWidget(context, this),
      )
          : SizedBox(
        // key: targetGK,
        key: createNodeWidgetGK(),
        width: width,
        height: height,
        child: child?.buildFlutterWidget(context, this),
      );
    } catch (e) {
      print(e);
      return  Placeholder(key: createNodeWidgetGK());
    }

  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SizedBox";
}
