import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gap/gap.dart';

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
  List<PTreeNode> properties(BuildContext context) => const [];

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
      return const Text('new MenuBar');
    } else {
      try {
        return PreferredSizeMenuBar(
          MenuBar(
            key: createNodeGK(),
            children: super.children.map((child) => child.toWidget(context, this)).toList(),
          ),
          width ?? fco.scrW,
          height ?? 60,
        );
      } catch (e) {
        debugPrint('MenuBarNode.toWidget() failed!');
        return Material(
          textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                fco.errorIcon(Colors.red),
                Gap(10),
                fco.coloredText(e.toString()),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "MenuBar";
}

class PreferredSizeMenuBar extends StatelessWidget implements PreferredSizeWidget {
  final double width;
  final double height;
  final MenuBar menuBar;
  const PreferredSizeMenuBar(this.menuBar, this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return menuBar;
  }

  @override
  Size get preferredSize => Size(width,height );
}
