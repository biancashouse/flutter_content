// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_properties.dart';
import 'package:flutter_content/src/snippet/snodes/button_style_hook.dart';

part 'menu_item_button_node.mapper.dart';

@MappableClass()
class MenuItemButtonNode extends ButtonNode with MenuItemButtonNodeMappable {
  // String itemLabel;

  MenuItemButtonNode({
    // this.itemLabel = '',
    super.destinationRoutePathSnippetName,
    super.template,
    // super.destinationPanelOrPlaceholderName,
    // super.destinationSnippetName,
    required super.bsPropGroup,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  }) {
    assert((destinationRoutePathSnippetName != null) == (template != null),
        'You must specify a snippet template with the page path property');
  }

  // @override
  // List<PTreeNode> properties(BuildContext context, SNode? parentSNode) => [];
  // {
  //   return [
  //     if (child != null)
  //       StringPNode(
  //         snode: this,
  //         name: 'item label',
  //         stringValue: itemLabel,
  //         onStringChange: (newValue) =>
  //             refreshWithUpdate(context,() => itemLabel = newValue ?? ''),
  //         expands: false,
  //         calloutButtonSize: const Size(280, 20),
  //         calloutWidth: 280,
  //       ),
  //   ];
  // }

  @override
  ButtonStyle? defaultButtonStyle() => MenuItemButton.styleFrom();

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'MenuItemButton',
        webLink: 'https://api.flutter.dev/flutter/material/MenuItemButton-class.html',
        snode: this,
        name: 'fyi'),
    ...super.properties(context, parentSNode),
  ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    ScrollControllerName? scName = EditablePage.scName(context);
    try {
      setParent(parentNode); // propagating parents down from root
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      final gk = createNodeWidgetGK();
      return MenuItemButton(
            key: gk,
            onPressed: () {
              // if (destinationPanelOrPlaceholderName != null) {
              //   destinationSnippetName ??= '$destinationPanelOrPlaceholderName:default-snippet';
              //   capiBloc.add(CAPIEvent.setPanelOrPlaceholderSnippet(
              //     snippetName: destinationSnippetName!,
              //     panelName: destinationPanelOrPlaceholderName!,
              //   ));
              // } else
                if (destinationRoutePathSnippetName != null) {
                //context.goNamed(destinationRoutePathSnippetName!);
                onPressed(context, gk, scName);
              }
            },
            style: fco.buttonStyle(30),
            child: child?.toWidget(context, this),
          );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
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
