// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'tabbarview_node.mapper.dart';

@MappableClass()
class TabBarViewNode extends MC with TabBarViewNodeMappable {
  TabBarViewNode({
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
      possiblyHighlightSelectedNode();
      SnippetPanelState? spState = SnippetPanel.of(context);
      int numTabNodes = spState?.tabC?.length ?? 0;
      List<Widget> childWidgets = children
          .map((node) => TabBarViewPage(child: node.toWidget(context, this)))
          .toList();
      try {
        if (numTabNodes != children.length) {
          throw Exception(
              'TabBar and TabBarView do not have matching number of children!');
        } else {
          return TabBarView(
            key: createNodeGK(),
            controller: spState!.tabC,
            children: childWidgets,
          );
        }
      } catch (e) {
        fco.logi('TabBarViewNode.toWidget() failed!');
        return Error(key: createNodeGK(), FLUTTER_TYPE, errorMsg: e.toString());
      }
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE,
          color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  @override
  List<Type> replaceWithOnly() => [TabBarViewNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TabBarView";
}

class TabBarViewPage extends StatefulWidget {
  final Widget child;

  const TabBarViewPage({required this.child, super.key});

  @override
  State<TabBarViewPage> createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage>
    with AutomaticKeepAliveClientMixin<TabBarViewPage> {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
