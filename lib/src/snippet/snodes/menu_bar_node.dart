import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'menu_bar_node.mapper.dart';

@MappableClass()
class MenuBarNode extends MC with MenuBarNodeMappable {
  double? width;
  double? height;

  MenuBarNode({
    this.width,
    this.height,
    required super.children,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => const [];

  @override
  String toSource(BuildContext context) => '''MenuBar(
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
  ''';

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    try {
      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      // List<Widget> menuBarChildren = super.children.map((child) =>
      //         child.toWidget(context, this)).toList();
      try {
            return PreferredSizeMenuBar(
              MenuBar(
                key: createNodeWidgetGK(),
                children: super.children.map((child) =>
                    child.toWidget(context, this)).toList(),
              ),
              width ?? fco.scrW,
              height ?? 60,
            );
          } catch (e) {
            fco.logger.i('MenuBarNode.toWidget() failed!');
            return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
      }
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  @override
  bool canBeDeleted() => false;

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "MenuBar";
}

class PreferredSizeMenuBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double width;
  final double height;
  final MenuBar menuBar;

  const PreferredSizeMenuBar(this.menuBar, this.width, this.height,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return menuBar;
  }

  @override
  Size get preferredSize => Size(width, height);
}
