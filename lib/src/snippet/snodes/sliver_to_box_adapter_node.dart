// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'sliver_to_box_adapter_node.mapper.dart';

@MappableClass()
class SliverToBoxAdapterNode extends SC with SliverToBoxAdapterNodeMappable {
  SliverToBoxAdapterNode({
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'SliverToBoxAdapter',
        webLink: 'https://api.flutter.dev/flutter/widgets/SliverToBoxAdapter-class.html',
        snode: this,
        name: 'fyi')
  ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SliverToBoxAdapter";

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
      setParent(parentNode);
      return SliverToBoxAdapter(
            key: createNodeWidgetGK(),
            child: child?.buildFlutterWidget(context, this),
          );
  }
}
