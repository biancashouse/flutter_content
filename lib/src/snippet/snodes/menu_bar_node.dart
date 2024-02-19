import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';

part 'menu_bar_node.mapper.dart';

@MappableClass()
class MenuBarNode extends MC with MenuBarNodeMappable {
  MenuBarNode({
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => const [];

  @override
  String toSource(BuildContext context) => '''MenuBar(
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
  ''';

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    List<Widget> menuBarChildren = super.children.map((child) => child.toWidget(context, this)).toList();
    if (menuBarChildren.isEmpty) {
      return Text('new MenuBar');
    } else {
      return MenuBar(
        key: createNodeGK(),
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "MenuBar";
}
