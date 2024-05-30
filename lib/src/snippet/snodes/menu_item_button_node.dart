// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';
import 'package:go_router/go_router.dart';

part 'menu_item_button_node.mapper.dart';

@MappableClass()
class MenuItemButtonNode extends ButtonNode with MenuItemButtonNodeMappable {
  String itemLabel;

  MenuItemButtonNode({
    this.itemLabel = '',
    super.destinationRoutePathSnippetName,
    super.template,
    super.destinationPanelName,
    super.destinationSnippetName,
    super.buttonStyle,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  }) {
    assert((destinationRoutePathSnippetName != null) == (template != null), 'You must specify a snippet template with the page path property');
  }

  @override
  List<PTreeNode> properties(BuildContext context) {
    return [
      StringPropertyValueNode(
        snode: this,
        name: 'item label',
        stringValue: itemLabel,
        onStringChange: (newValue) => refreshWithUpdate(() => itemLabel = newValue ?? ''),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
      ),
    ];
  }

  @override
  ButtonStyle? defaultButtonStyle() => MenuItemButton.styleFrom();

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    possiblyHighlightSelectedNode();
    return MenuItemButton(
      key: createNodeGK(),
      onPressed: () {
        if (destinationPanelName != null) {
          destinationSnippetName ??= '$destinationPanelName:default-snippet';
          capiBloc.add(CAPIEvent.setPanelSnippet(
            snippetName: destinationSnippetName!,
            panelName: destinationPanelName!,
          ));
        } else if (destinationRoutePathSnippetName != null) {
          context.goNamed(destinationRoutePathSnippetName!);
        }
      },
      style: Useful.buttonStyle(30),
      child: Text(itemLabel.isEmpty ? 'new item' : itemLabel),
    );
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
