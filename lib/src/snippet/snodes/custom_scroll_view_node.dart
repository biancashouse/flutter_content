import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';

import '../pnodes/fyi_pnodes.dart';

part 'custom_scroll_view_node.mapper.dart';

@MappableClass()
class CustomScrollViewNode extends MC with CustomScrollViewNodeMappable {
  AxisEnum axis;
  bool? shrinkWrap;

  CustomScrollViewNode({
    this.axis = AxisEnum.vertical,
    this.shrinkWrap = false,
    required super.children,
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
    EnumPNode<AxisEnum?>(
      snode: this,
      name: 'axis',
      valueIndex: axis.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => axis = AxisEnum.of(newValue) ?? AxisEnum.vertical,
      ),
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);

    return CustomScrollView(
      slivers: children
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
