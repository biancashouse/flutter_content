import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/edgeinsets_node_value.dart';

part 'singlechildscrollview_node.mapper.dart';

@MappableClass()
class SingleChildScrollViewNode extends SC with SingleChildScrollViewNodeMappable {
  EdgeInsetsValue? padding;

  SingleChildScrollViewNode({
    this.padding,
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
    PropertyGroup(
      snode: this,
      name: 'padding',
      children: [
        EdgeInsetsPropertyValueNode(
          snode: this,
          name: 'padding',
          eiValue: padding,
          onEIChangedF: (newValue) => refreshWithUpdate(() => padding = newValue),
        ),
      ],
    ),
  ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    var targetGK = nodeWidgetGK;
    return SingleChildScrollView(
      key: targetGK,
      padding: padding?.toEdgeInsets(),
      child: child?.toWidget(context, this),
    );
  }

  // @override
  // String toSource(BuildContext context) {
  //   // return '''SingleChildScrollView(
  //   //       padding: padding?.toEdgeInsets(),
  //   //     child: ${child?.toSource(context)},
  //   //   )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SingleChildScrollView";
}
