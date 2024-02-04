// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'tabbarview_node.mapper.dart';

@MappableClass()
class TabBarViewNode extends MultiChildNode with TabBarViewNodeMappable {
  TabBarViewNode({
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    parent = parentNode; // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    SnippetPanelState? spState = SnippetPanel.of(context);
    int numTabNodes = spState?.tabC?.length ?? 0;
    List<Widget> childWidgets = children.map((node) => node.toWidget(context, this)).toList();
    try {
      if (numTabNodes != children.length) {
        throw Exception('TabBar and TabBarView do not have matching number of children!');
      } else {
        return TabBarView(
          key: nodeWidgetGK,
          controller: spState!.tabC,
          children: childWidgets,
        );
      }
    } catch (e) {
      print('TabBarViewNode.toWidget() failed!');
      return Material(
        textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(Icons.error, color: Colors.redAccent),
              hspacer(10),
              Useful.coloredText(e.toString()),
            ],
          ),
        ),
      );
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TabBarView";
}
