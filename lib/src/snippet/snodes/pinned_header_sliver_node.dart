// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'pinned_header_sliver_node.mapper.dart';

@MappableClass()
class PinnedHeaderSliverNode extends SC with PinnedHeaderSliverNodeMappable {
  PinnedHeaderSliverNode({
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'PinnedHeaderSliver',
        webLink: 'https://api.flutter.dev/flutter/widgets/PinnedHeaderSliver-class.html',
        snode: this,
        name: 'fyi')
  ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "PinnedHeaderSliver";

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
      setParent(parentNode);
      return PinnedHeaderSliver(
            key: createNodeWidgetGK(),
            child: child?.buildFlutterWidget(context, this),
          );
  }
}
