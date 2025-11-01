import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/abstract_scrollview_node.dart';

import '../pnodes/fyi_pnodes.dart';

part 'custom_scrollview_node.mapper.dart';

@MappableClass()
class CustomScrollViewNode extends ScrollViewNode with CustomScrollViewNodeMappable {
  List<SNode> slivers;

  CustomScrollViewNode({
    required this.slivers,
    super.axis,
    super.shrinkWrap,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'CustomScrollView',
      webLink:
          'https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html',
      snode: this,
      name: 'fyi',
    ),
    ...super.propertyNodes(context, parentSNode),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);

    return CustomScrollView(
      slivers: slivers
          .map((childNode) => childNode.buildFlutterWidget(context, this))
          .toList(),
    );
  }

  @override
  List<Widget> menuAnchorWidgets_Append(
      BuildContext context,
      NodeAction action,
      bool? skipHeading,
      ScrollControllerName? scName,
      ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action, scName),
      menuItemButton(context, "SliverAppBar", SliverAppBarNode, action, scName),
      menuItemButton(context, "SliverList.list", SliverListListNode, action, scName),
      menuItemButton(context, "SliverToBoxAdapter", SliverToBoxAdapterNode, action, scName),
      menuItemButton(context, "SliverResizingHeader", SliverResizingHeaderNode, action, scName),
      menuItemButton(context, "SliverFloatingHeader", SliverFloatingHeaderNode, action, scName),
    ];
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "CustomScrollView";
}
