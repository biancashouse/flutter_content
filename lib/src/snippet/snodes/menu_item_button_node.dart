// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'menu_item_button_node.mapper.dart';

@MappableClass()
class MenuItemButtonNode extends ButtonNode with MenuItemButtonNodeMappable {
  // String itemLabel;

  MenuItemButtonNode({
    // this.itemLabel = '',
    super.destinationRoutePathSnippetName,
    super.template,
    super.destinationPanelOrPlaceholderName,
    super.destinationSnippetName,
    super.buttonStyle,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  }) {
    assert((destinationRoutePathSnippetName != null) == (template != null),
        'You must specify a snippet template with the page path property');
  }

  // @override
  // List<PTreeNode> properties(BuildContext context) => [];
  // {
  //   return [
  //     if (child != null)
  //       StringPropertyValueNode(
  //         snode: this,
  //         name: 'item label',
  //         stringValue: itemLabel,
  //         onStringChange: (newValue) =>
  //             refreshWithUpdate(() => itemLabel = newValue ?? ''),
  //         expands: false,
  //         calloutButtonSize: const Size(280, 20),
  //         calloutWidth: 280,
  //       ),
  //   ];
  // }

  @override
  ButtonStyle? defaultButtonStyle() => MenuItemButton.styleFrom();

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      possiblyHighlightSelectedNode();
      final gk = createNodeGK();
      return MenuItemButton(
            key: gk,
            onPressed: () {
              if (destinationPanelOrPlaceholderName != null) {
                destinationSnippetName ??= '$destinationPanelOrPlaceholderName:default-snippet';
                capiBloc.add(CAPIEvent.setPanelOrPlaceholderSnippet(
                  snippetName: destinationSnippetName!,
                  panelName: destinationPanelOrPlaceholderName!,
                ));
              } else if (destinationRoutePathSnippetName != null) {
                //context.goNamed(destinationRoutePathSnippetName!);
                onPressed(context, gk);
              }
            },
            style: fco.buttonStyle(30),
            child: child?.toWidget(context, this),
          );
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  @override
  String toSource(BuildContext context) {
    return '''MenuItemButton(
      )''';
  }

  @override
  List<Type> replaceWithOnly() => [SubmenuButton];

  @override
  List<Type> wrapCandidates() => [SubmenuButtonNode, MenuBarNode];

  @override
  List<Type> wrapWithOnly() => [MenuBarNode, SubmenuButtonNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "MenuItemButton";
}
