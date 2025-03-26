import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/color_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/edge_insets_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/text_style_pnodes.dart';
import 'package:go_router/go_router.dart';

part 'chip_node.mapper.dart';

@MappableClass()
class ChipNode extends CL with ChipNodeMappable {
  String label;
  TextStyleProperties labelTSPropGroup;
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

  // client supplied onTap (list of handlers supplied to FlutterContentApp)
  String? onTapHandlerName;
  CalloutConfigProperties? calloutConfigGroup;

  ChipNode({
    this.label = 'chip-name?',
    required this.labelTSPropGroup,
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
  TextStyleProperties? textStyleProperties() => labelTSPropGroup;

  @override
  void setTextStyleProperties(TextStyleProperties newProps) =>
      labelTSPropGroup = newProps;

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) {
    var textStyleName = fco.findTextStyleName(labelTSPropGroup);
    textStyleName = textStyleName != null ? ': $textStyleName' : '';
    return [
      FlutterDocPNode(
          buttonLabel: 'Chip',
          webLink: 'https://api.flutter.dev/flutter/material/Chip-class.html',
          snode: this,
          name: 'fyi'),
      StringPNode(
        snode: this,
        name: 'label',
        expands: false,
        numLines: 1,
        stringValue: label,
        onStringChange: (newValue) =>
            refreshWithUpdate(context, () => label = newValue ?? ''),
        calloutButtonSize: const Size(300, 20),
        calloutWidth: 300,
      ),
      TextStylePNode /*Group*/ (
        snode: this,
        name: 'textStyle$textStyleName',
        textStyleProperties: labelTSPropGroup,
        onGroupChange: (newValue, refreshPTree) {
          refreshWithUpdate(context, () {
            labelTSPropGroup = newValue;
            if (refreshPTree) {
              forcePropertyTreeRefresh(context);
            }
          });
        },
      ),
      PNode /*Group*/ (
        snode: this,
        name: 'padding',
        children: [
          EdgeInsetsPNode(
            snode: this,
            name: 'labelPadding',
            eiValue: labelPadding ?? EdgeInsetsValue(),
            onEIChangedF: (newValue) =>
                refreshWithUpdate(context, () => labelPadding = newValue),
          ),
        ],
      ),
      ColorPNode(
        snode: this,
        name: 'b/g color',
        tooltip: "The chip's b/g color.",
        colorValue: bgColorValue,
        onColorIntChange: (newValue) =>
            refreshWithUpdate(context, () => bgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPNode(
        snode: this,
        name: 'disabled color',
        tooltip: "The color to use for an unselected chip.",
        colorValue: disabledColorValue,
        onColorIntChange: (newValue) =>
            refreshWithUpdate(context, () => disabledColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPNode(
        snode: this,
        name: 'selected color',
        tooltip: 'The color for a selected chip.',
        colorValue: selectedColorValue,
        onColorIntChange: (newValue) =>
            refreshWithUpdate(context, () => selectedColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      BoolPNode(
        snode: this,
        name: 'enabled',
        boolValue: enabled,
        onBoolChange: (newValue) =>
            refreshWithUpdate(context, () => enabled = newValue ?? true),
      ),
      PNode /*Group*/ (
        snode: this,
        name: 'goto Page...',
        children: [
          StringPNode(
            snode: this,
            name: 'destination Route Path',
            stringValue: destinationRoutePathSnippetName,
            onStringChange: (newValue) {
              refreshWithUpdate(
                  context, () => destinationRoutePathSnippetName = newValue);
            },
            options: fco.pageList,
            calloutButtonSize: const Size(280, 70),
            calloutWidth: 280,
          ),
        ],
      ),
      PNode /*Group*/ (
        snode: this,
        name: 'show Snippet in Panel...',
        children: [
          StringPNode(
            snode: this,
            name: 'destination Panel Name',
            stringValue: destinationPanelOrPlaceholderName,
            onStringChange: (newValue) {
              refreshWithUpdate(
                  context, () => destinationPanelOrPlaceholderName = newValue);
            },
            calloutButtonSize: const Size(280, 70),
            calloutWidth: 280,
          ),
          StringPNode(
            snode: this,
            name: 'destination Snippet Name',
            stringValue: destinationSnippetName,
            onStringChange: (newValue) {
              refreshWithUpdate(
                  context, () => destinationSnippetName = newValue);
            },
            calloutButtonSize: const Size(280, 70),
            calloutWidth: 280,
          )
        ],
      ),
      StringPNode(
        snode: this,
        name: 'onTapHandlerName',
        stringValue: onTapHandlerName,
        onStringChange: (newValue) =>
            refreshWithUpdate(context, () => onTapHandlerName = newValue),
        calloutButtonSize: const Size(280, 70),
        calloutWidth: 280,
      ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      {bool showTriangle = false}) {
    ScrollControllerName? scName = EditablePage.scName(context);
    try {
      // possible handler
      // void Function(BuildContext)? f =
      //         onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;

      setParent(parentNode);
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);

      GlobalKey gk = createNodeWidgetGK();

      return InkWell(
        onTap: () => onPressed(context, gk, scName),
        child: Chip(
          key: gk,
          label: Text(label),
          // onLongPress: f != null ? () => f.call(context) : null,
          labelStyle: labelTSPropGroup.toTextStyle(context),
        ),
      );
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  CalloutId? get feature => calloutConfigGroup?.cid;

  void onPressed(
    BuildContext context,
    GlobalKey gk,
    ScrollControllerName? scName,
  ) {
    if (onTapHandlerName != null) {
      fco.namedCallbacks[onTapHandlerName!]?.call(context, gk);
    } else if (feature != null) {
      // possible callout
      // Widget contents = SnippetPanel.getWidget(calloutConfig!.contentSnippetName!, context);
      Future.delayed(
        const Duration(seconds: 1),
        () => fco.showOverlay(
          targetGkF: () => fco.getCalloutGk(feature),
          calloutContent: SnippetPanel.fromSnippet(
            panelName: calloutConfigGroup!.cid!,
            snippetName: BODY_PLACEHOLDER,
            // allowButtonCallouts: false,
            scName: scName,
          ),
          calloutConfig: CalloutConfig(
            cId: feature!,
            initialTargetAlignment: calloutConfigGroup!.targetAlignment != null
                ? calloutConfigGroup!.targetAlignment!.flutterValue
                : AlignmentEnum.bottomRight.flutterValue,
            initialCalloutAlignment: calloutConfigGroup!.targetAlignment != null
                ? calloutConfigGroup!.targetAlignment!.oppositeEnum.flutterValue
                : AlignmentEnum.topLeft.flutterValue,
            initialCalloutW: 200,
            initialCalloutH: 150,
            arrowType:
                calloutConfigGroup!.arrowType?.flutterValue ?? ArrowType.POINTY,
            finalSeparation: 100,
            barrier: CalloutBarrierConfig(
              opacity: 0.1,
              onTappedF: () async {
                fco.dismiss(feature!);
              },
            ),
            fillColor: calloutConfigGroup?.colorValue != null
                ? Color(calloutConfigGroup!.colorValue!)
                : Colors.white,
            scrollControllerName: scName,
          ),
        ),
      );
    } else if (destinationRoutePathSnippetName != null) {
      fco.addSubRoute(
          newPath: destinationRoutePathSnippetName!,
          template: SnippetTemplateEnum.empty);
      context.replace(destinationRoutePathSnippetName!);
      // create a GoRoute and load or create snippet with pageName
    } else if (destinationPanelOrPlaceholderName != null &&
        destinationSnippetName != null) {
      destinationSnippetName ??=
          '$destinationPanelOrPlaceholderName:default-snippet';
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
