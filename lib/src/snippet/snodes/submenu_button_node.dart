// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';

part 'submenu_button_node.mapper.dart';

@MappableClass()
class SubmenuButtonNode extends MultiChildNode with SubmenuButtonNodeMappable {
  String itemLabel;

  // Node? child; always just use a Text(itemLabel)
  List<STreeNode> menuChildren;

  SubmenuButtonNode({
    this.itemLabel = 'label?',
    // this.child,
    required this.menuChildren,
  }) : super(children: menuChildren);

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'itemLabel',
          stringValue: itemLabel,
          onStringChange: (newValue) => refreshWithUpdate(() => itemLabel = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 70),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "label",
  //           text: itemLabel,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             itemLabel = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  String toSource(BuildContext context) => '''SubmenuButton(
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
  ''';

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    //Icon(Icons.info, size: 28, color: Colors.red);
    parent = parentNode;  // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    return SubmenuButton(
            key: nodeWidgetGK,      style: Useful.buttonStyle(36),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null; // Use the component's default.
          },
        ),
      ),
      menuChildren: super.children.map((child) => child.toWidget(context, this)).toList(),
      // child: child == null ? Text(itemLabel??'label?') : child?.toWidget(context, this),
      child: Text(itemLabel),
    );
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SubmenuButton";
}
