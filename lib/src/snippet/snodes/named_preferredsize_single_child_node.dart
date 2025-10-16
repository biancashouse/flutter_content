import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'named_preferredsize_single_child_node.mapper.dart';

@MappableClass()
class NamedPS extends SC
    with NamedPSMappable {
  String propertyName;

  NamedPS({
    required this.propertyName,
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'SizedBox',
      webLink:
          'https://api.flutter.dev/flutter/widgets/PreferredSize-class.html',
      snode: this,
      name: 'fyi',
    ),
  ];

  PreferredSizeWidget? buildPreferredSizeFlutterWidget(
    BuildContext context,
    SNode? parentNode) {
    try {
      var psChildWidget = child?.buildFlutterWidget(context, this);
      setParent(parentNode);
      if (psChildWidget is! PreferredSizeWidget) {
        return PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg: '($propertyName) this node child property requires a PreferredSizeWidget!\nActually is a ${child.runtimeType}',
          ),
        );  
      }
      return psChildWidget;
    } catch (e) {
      return PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString(),
        ),
      );
    }
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE =
      "PreferredSizePropertyWidget"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
