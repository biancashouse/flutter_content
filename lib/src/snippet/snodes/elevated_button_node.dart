// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'elevated_button_node.mapper.dart';

@MappableClass()
class ElevatedButtonNode extends ButtonNode with ElevatedButtonNodeMappable {
  ElevatedButtonNode({
    super.destinationRoutePathSnippetName,
    super.template,
    super.destinationPanelOrPlaceholderName,
    super.destinationSnippetName,
    super.buttonStyle,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  });

  @override
  ButtonStyle? defaultButtonStyle() => ElevatedButton.styleFrom();

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    ButtonStyle? btnStyle = buttonStyle?.toButtonStyle(context, defaultButtonStyle());
    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? FContent().namedHandler(onTapHandlerName!) : null;

    setParent(parentNode);
    possiblyHighlightSelectedNode();

    return Container(
      // container only for possble selection gk
      key: createNodeGK(),
      child: ElevatedButton(
        // if feature specified, must be a callout
        key: feature != null ? FContent().setCalloutGk(feature!, GlobalKey()) : null,
        onPressed: ()=>onPressed(context),
        onLongPress: () => f?.call(context),
        style: btnStyle,
        child: child?.toWidget(context, this),
      ),
    );
  }

  // @override
  // String toSource(BuildContext context) => '''ElevatedButton(
  //   onPressed: ${onTapHandlerName != null ? '(){Snippet.namedHandler(super.onTapHandlerName!)?.call(context);}' : 'null'},
  //   style: ${buttonStyle?.toButtonStyle(context, defaultButtonStyle())},
  //   child: ${child?.toSource(context)},
  // )''';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "ElevatedButton";
}
