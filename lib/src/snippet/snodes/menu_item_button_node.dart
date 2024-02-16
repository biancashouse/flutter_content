// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';

part 'menu_item_button_node.mapper.dart';

@MappableClass()
class MenuItemButtonNode extends CL with MenuItemButtonNodeMappable {
  String itemLabel;
  String? destinationPanelName;
  String? destinationSnippetName;

  MenuItemButtonNode({
    this.itemLabel = '',
    this.destinationPanelName,
    this.destinationSnippetName,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) {
    List<String> allSnippets = FC().snippetsMap.keys.toList()..sort();
    List<PanelName> allPanelNames = FC().panelGkMap.keys.toList();
    return [
      StringPropertyValueNode(
        snode: this,
        name: 'item label',
        stringValue: itemLabel,
        onStringChange: (newValue) => refreshWithUpdate(() => itemLabel = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutSize: const Size(280, 80),
      ),
      StringPropertyValueNode(
        snode: this,
        name: 'snippet Name',
        stringValue: destinationSnippetName,
        onStringChange: (newValue) => refreshWithUpdate(() => destinationSnippetName = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutSize: const Size(280, 80),
        options: allSnippets,
      ),
      StringPropertyValueNode(
        snode: this,
        name: 'panel Name',
        stringValue: destinationPanelName,
        onStringChange: (newValue) => refreshWithUpdate(() => destinationPanelName = newValue),
        expands: false,
        calloutButtonSize: const Size(280, 20),
        calloutSize: const Size(280, 80),
        options: allPanelNames,
      ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);  // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    return MenuItemButton(
      key: createNodeGK(),
      onPressed: () {
        if (destinationPanelName != null) {
          destinationSnippetName ??= '$destinationPanelName:default-snippet';
          capiBloc.add(CAPIEvent.setPanelSnippet(
            snippetName: destinationSnippetName!,
            panelName: destinationPanelName!,
          ));
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
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "MenuItemButton";
}
