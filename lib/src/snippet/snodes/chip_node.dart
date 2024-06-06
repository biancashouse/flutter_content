import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_group.dart';
import 'package:go_router/go_router.dart';

part 'chip_node.mapper.dart';

@MappableClass()
class ChipNode extends CL with ChipNodeMappable {
  String label;
  TextStyleGroup? labelStyle;
  EdgeInsetsValue? labelPadding;
  int? bgColorValue;
  int? disabledColorValue;
  int? selectedColorValue;
  bool enabled;

  // when populating a panel with a snippet
  String? destinationPanelName;
  String? destinationSnippetName;

  // when navigating to path, which is also used as the page's snippet name
  String? destinationRoutePathSnippetName;
  SnippetTemplateEnum? template;

  String? onTapHandlerName; // client supplied onTap (list of handlers supplied to MaterialSPA)

  ChipNode({
    this.label = 'chip-name?',
    this.labelStyle,
    this.labelPadding,
    this.bgColorValue,
    this.disabledColorValue,
    this.selectedColorValue,
    this.enabled = false,
    this.destinationPanelName,
    this.destinationSnippetName,
    this.destinationRoutePathSnippetName,
    this.template,
    this.onTapHandlerName,
  });

  String? getTapHandlerName() => onTapHandlerName;

  void setTapHandlerName(String newName) => onTapHandlerName = newName;

  @override
  List<PTreeNode> properties(BuildContext context) =>
      [
        StringPropertyValueNode(
          snode: this,
          name: 'label',
          expands: false,
          numLines: 1,
          stringValue: label,
          onStringChange: (newValue) => refreshWithUpdate(() => label = newValue ?? ''),
          calloutButtonSize: const Size(300, 20),
          calloutWidth: 300,
        ),
        TextStylePropertyGroup(
          snode: this,
          name: 'labelStyle',
          textStyleGroup: labelStyle,
          onGroupChange: (newValue) => refreshWithUpdate(() => labelStyle = newValue),
        ),
        PropertyGroup(
          snode: this,
          name: 'padding',
          children: [
            EdgeInsetsPropertyValueNode(
              snode: this,
              name: 'labelPadding',
              eiValue: labelPadding ?? EdgeInsetsValue(),
              onEIChangedF: (newValue) => refreshWithUpdate(() => labelPadding = newValue),
            ),
          ],
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'b/g color',
          tooltip: "The chip's b/g color.",
          colorValue: bgColorValue,
          onColorIntChange: (newValue) => refreshWithUpdate(() => bgColorValue = newValue),
          calloutButtonSize: const Size(130, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'disabled color',
          tooltip: "The color to use for an unselected chip.",
          colorValue: disabledColorValue,
          onColorIntChange: (newValue) => refreshWithUpdate(() => disabledColorValue = newValue),
          calloutButtonSize: const Size(130, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'selected color',
          tooltip: 'The color for a selected chip.',
          colorValue: selectedColorValue,
          onColorIntChange: (newValue) => refreshWithUpdate(() => selectedColorValue = newValue),
          calloutButtonSize: const Size(130, 20),
        ),
        BoolPropertyValueNode(
          snode: this,
          name: 'enabled',
          boolValue: enabled,
          onBoolChange: (newValue) => refreshWithUpdate(() => enabled = newValue ?? true),
        ),
        PropertyGroup(
          snode: this,
          name: 'goto Page...',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'destination Route Path',
              stringValue: destinationRoutePathSnippetName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationRoutePathSnippetName = newValue);
              },
              options: FC().pagePaths,
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            ),
          ],
        ),
        PropertyGroup(
          snode: this,
          name: 'show Snippet in Panel...',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'destination Panel Name',
              stringValue: destinationPanelName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationPanelName = newValue);
              },
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            ),
            StringPropertyValueNode(
              snode: this,
              name: 'destination Snippet Name',
              stringValue: destinationSnippetName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationSnippetName = newValue);
              },
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            )
          ],
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'onTapHandlerName',
          stringValue: onTapHandlerName,
          onStringChange: (newValue) => refreshWithUpdate(() => onTapHandlerName = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    TextStyle? ts = labelStyle?.toTextStyle(context);

    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? FC().namedHandler(onTapHandlerName!) : null;

    setParent(parentNode);
    possiblyHighlightSelectedNode();

    return Chip(
      key: createNodeGK(),
      label: Text(label),
      // onPressed: () => onPressed(context),
      // onLongPress: f != null ? () => f.call(context) : null,
      labelStyle: ts,
    );
  }

  void onPressed(BuildContext context) {
    if (onTapHandlerName != null) {
      FC().namedVoidCallbacks[onTapHandlerName]?.call();
    } else if (destinationRoutePathSnippetName != null) {
      FC().addRoute(newPath: destinationRoutePathSnippetName!, template: SnippetTemplateEnum.empty);
      context.go(destinationRoutePathSnippetName!);
      // create a GoRoute and load or create snippet with pageName
    } else if (destinationPanelName != null && destinationSnippetName != null) {
      // if panel found, load snippet into it (may need to create empty snippet)
      //TODO
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Chip";
}
