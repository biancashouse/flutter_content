import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';
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
  String? destinationPanelOrPlaceholderName;
  String? destinationSnippetName;

  // when navigating to path, which is also used as the page's snippet name
  String? destinationRoutePathSnippetName;
  SnippetTemplateEnum? template;

  String?
      onTapHandlerName; // client supplied onTap (list of handlers supplied to FlutterContentApp)
  CalloutConfigGroup? calloutConfigGroup;

  ChipNode({
    this.label = 'chip-name?',
    this.labelStyle,
    this.labelPadding,
    this.bgColorValue,
    this.disabledColorValue,
    this.selectedColorValue,
    this.enabled = false,
    this.destinationPanelOrPlaceholderName,
    this.destinationSnippetName,
    this.destinationRoutePathSnippetName,
    this.template,
    this.onTapHandlerName,
    this.calloutConfigGroup,
  });

  String? getTapHandlerName() => onTapHandlerName;

  void setTapHandlerName(String newName) => onTapHandlerName = newName;

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'label',
          expands: false,
          numLines: 1,
          stringValue: label,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => label = newValue ?? ''),
          calloutButtonSize: const Size(300, 20),
          calloutWidth: 300,
        ),
        TextStylePropertyGroup(
          snode: this,
          name: 'labelStyle',
          textStyleGroup: labelStyle,
          onGroupChange: (newValue) =>
              refreshWithUpdate(() => labelStyle = newValue),
        ),
        PropertyGroup(
          snode: this,
          name: 'padding',
          children: [
            EdgeInsetsPropertyValueNode(
              snode: this,
              name: 'labelPadding',
              eiValue: labelPadding ?? EdgeInsetsValue(),
              onEIChangedF: (newValue) =>
                  refreshWithUpdate(() => labelPadding = newValue),
            ),
          ],
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'b/g color',
          tooltip: "The chip's b/g color.",
          colorValue: bgColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => bgColorValue = newValue),
          calloutButtonSize: const Size(130, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'disabled color',
          tooltip: "The color to use for an unselected chip.",
          colorValue: disabledColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => disabledColorValue = newValue),
          calloutButtonSize: const Size(130, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'selected color',
          tooltip: 'The color for a selected chip.',
          colorValue: selectedColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => selectedColorValue = newValue),
          calloutButtonSize: const Size(130, 20),
        ),
        BoolPropertyValueNode(
          snode: this,
          name: 'enabled',
          boolValue: enabled,
          onBoolChange: (newValue) =>
              refreshWithUpdate(() => enabled = newValue ?? true),
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
                refreshWithUpdate(
                    () => destinationRoutePathSnippetName = newValue);
              },
              options: fco.pagePaths,
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
              stringValue: destinationPanelOrPlaceholderName,
              onStringChange: (newValue) {
                refreshWithUpdate(() => destinationPanelOrPlaceholderName = newValue);
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
          onStringChange: (newValue) =>
              refreshWithUpdate(() => onTapHandlerName = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    TextStyle? ts = labelStyle?.toTextStyle(context);

    // possible handler
    void Function(BuildContext)? f =
        onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;

    setParent(parentNode);
    possiblyHighlightSelectedNode();

    return InkWell(
      onTap: () => onPressed(context),
      child: Chip(
        key: createNodeGK(),
        label: Text(label),
        // onLongPress: f != null ? () => f.call(context) : null,
        labelStyle: ts,
      ),
    );
  }

  Feature? get feature => calloutConfigGroup?.contentSnippetName;

  void onPressed(BuildContext context) {
    if (onTapHandlerName != null) {
      fco.namedVoidCallbacks[onTapHandlerName]?.call(context);
    } else if (feature != null) {
      // possible callout
      // Widget contents = SnippetPanel.getWidget(calloutConfig!.contentSnippetName!, context);
      Future.delayed(
        const Duration(seconds: 1),
            () => fca.showOverlay(
            targetGkF: () => fco.getCalloutGk(feature),
            calloutContent: SnippetPanel.fromSnippet(
              panelName: calloutConfigGroup!.contentSnippetName!,
              snippetName: BODY_PLACEHOLDER,
              // allowButtonCallouts: false,
            ),
            calloutConfig: CalloutConfig(
              cId: feature!,
              initialTargetAlignment:
              calloutConfigGroup!.targetAlignment != null ? calloutConfigGroup!.targetAlignment!.flutterValue : AlignmentEnum.bottomRight.flutterValue,
              initialCalloutAlignment: calloutConfigGroup!.targetAlignment != null
                  ? calloutConfigGroup!.targetAlignment!.oppositeEnum.flutterValue
                  : AlignmentEnum.topLeft.flutterValue,
              initialCalloutW: 200,
              initialCalloutH: 150,
              arrowType: calloutConfigGroup!.arrowType?.flutterValue ?? ArrowType.POINTY,
              finalSeparation: 100,
              barrier: CalloutBarrier(
                opacity: 0.1,
                onTappedF: () async {
                  Callout.dismiss(feature!);
                },
              ),
              fillColor: calloutConfigGroup?.colorValue != null ? Color(calloutConfigGroup!.colorValue!) : Colors.white,
            )),
      );
    } else if (destinationRoutePathSnippetName != null) {
      fco.addRoute(newPath: destinationRoutePathSnippetName!, template: SnippetTemplateEnum.empty);
      context.go(destinationRoutePathSnippetName!);
      // create a GoRoute and load or create snippet with pageName
    } else if (destinationPanelOrPlaceholderName != null && destinationSnippetName != null) {
      destinationSnippetName ??= '$destinationPanelOrPlaceholderName:default-snippet';
      capiBloc.add(CAPIEvent.setPanelOrPlaceholderSnippet(
        snippetName: destinationSnippetName!,
        panelName: destinationPanelOrPlaceholderName!,
      ));
    }
  }

  // void onPressed(BuildContext context) {
  //   if (onTapHandlerName != null) {
  //     FCO.namedVoidCallbacks[onTapHandlerName]?.call();
  //   } else if (destinationRoutePathSnippetName != null) {
  //     FCO.addRoute(
  //         newPath: destinationRoutePathSnippetName!,
  //         template: SnippetTemplateEnum.empty);
  //     context.go(destinationRoutePathSnippetName!);
  //     // create a GoRoute and load or create snippet with pageName
  //   } else if (destinationPanelOrPlaceholderName != null && destinationSnippetName != null) {
  //     // if panel found, load snippet into it (may need to create empty snippet)
  //     //TODO
  //   }
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Chip";
}
