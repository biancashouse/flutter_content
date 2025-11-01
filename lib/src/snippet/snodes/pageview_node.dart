import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/abstract_scrollview_node.dart';

import '../pnodes/fyi_pnodes.dart';

part 'pageview_node.mapper.dart';

@MappableClass()
abstract class PageViewNode extends MC with PageViewNodeMappable {
  PageViewNode({required super.children});

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'PageView',
      webLink: 'https://api.flutter.dev/flutter/widgets/PageView-class.html',
      snode: this,
      name: 'fyi',
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    return PageView(
      key: createNodeWidgetGK(),
      children: children
          .map((childNode) => childNode.buildFlutterWidget(context, this))
          .toList(),
    );
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "PageView";
}
