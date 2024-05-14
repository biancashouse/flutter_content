// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:go_router/go_router.dart';

part 'menu_item_button_node.mapper.dart';

@MappableClass()
class MenuItemButtonNode extends CL with MenuItemButtonNodeMappable {
  String itemLabel;
  String? destinationPanelName;
  String? destinationSnippetName;
  String? destinationPageName; // go routeer route name

  MenuItemButtonNode({
    this.itemLabel = '',
    this.destinationPanelName,
    this.destinationSnippetName,
    this.destinationPageName,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) {
    List<String> allSnippets = FC().snippetInfoCache.keys.toList()..sort();
    List<PanelName> allPanelNames = FC().panelGkMap.keys.toList();
    return [
      StringPropertyValueNode(
        snode: this,
        name: 'item label',
        stringValue: itemLabel,
        onStringChange: (newValue) => refreshWithUpdate(() => itemLabel = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
      ),
      StringPropertyValueNode(
        snode: this,
        name: 'Snippet Name',
        stringValue: destinationSnippetName,
        onStringChange: (newValue) => refreshWithUpdate(() => destinationSnippetName = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
        options: allSnippets,
      ),
      StringPropertyValueNode(
        snode: this,
        name: 'Panel Name',
        stringValue: destinationPanelName,
        onStringChange: (newValue) => refreshWithUpdate(() => destinationPanelName = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
        options: allPanelNames,
      ),
      StringPropertyValueNode(
        snode: this,
        name: 'Page Name',
        stringValue: destinationPageName,
        onStringChange: (newValue) => refreshWithUpdate(() => destinationPageName = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
        options: allPanelNames,
      ),
    ];
  }

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
        } else if (destinationPageName != null) {
          context.goNamed(destinationPageName!);
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
