// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'sliverlist_list_node.mapper.dart';

@MappableClass()
class SliverListListNode extends MC with SliverListListNodeMappable {
  SliverListListNode({required super.children});

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'SliverList.list',
      webLink: 'https://api.flutter.dev/flutter/widgets/SliverList-class.html',
      snode: this,
      name: 'fyi',
    ),
  ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SliverList.list";

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);

    return SliverList.list(
      key: createNodeWidgetGK(),
      children: children
          .map((childNode) => childNode.buildFlutterWidget(context, this))
          .toList(),
    );
  }
}
