// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

part 'tabbarview_node.mapper.dart';

@MappableClass()
class TabBarViewNode extends MC with TabBarViewNodeMappable {
  String tabBarName;

  TabBarViewNode({
    required this.tabBarName,
    required super.children,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'TabBarView',
            webLink:
                'https://api.flutter.dev/flutter/material/TabBarView-class.html',
            snode: this,
            name: 'fyi'),
        StringPNode(
          snode: this,
          name: 'TabBar name',
          stringValue: tabBarName,
          skipHelperText: true,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => tabBarName = newValue!),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 400,
          numLines: 1,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      {bool showTriangle = false}) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      SnippetPanelState? spState = SnippetPanel.of(context);
      TabBarNode? tabBarNode = spState?.tabBars[tabBarName];
      if (tabBarNode == null) {
        return Placeholder();
      }
      int numTabNodes = tabBarNode.tabC?.length ?? 0;
      List<Widget> childWidgets = children
          .map((node) => TabBarViewPage(child: node.toWidget(context, this)))
          .toList();
      try {
        if (numTabNodes != children.length) {
          throw Exception(
              'TabBar and TabBarView do not have matching number of children!');
        } else {
          return TabBarView(
            key: createNodeWidgetGK(),
            controller: tabBarNode.tabC,
            children: childWidgets,
          );
        }
      } catch (e) {
        fco.logger.i('TabBarViewNode.toWidget() failed!');
        return Error(
            key: createNodeWidgetGK(), FLUTTER_TYPE, errorMsg: e.toString());
      }
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
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
