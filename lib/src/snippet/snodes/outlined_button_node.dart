// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'outlined_button_node.mapper.dart';

@MappableClass()
class OutlinedButtonNode extends ButtonNode with OutlinedButtonNodeMappable {
  OutlinedButtonNode({
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
  String? getTapHandlerName() => onTapHandlerName;

  @override
  void setTapHandlerName(String newName) => onTapHandlerName = newName;

  @override
  ButtonStyle? defaultButtonStyle() => OutlinedButton.styleFrom();

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    ButtonStyle? btnStyle = buttonStyle?.toButtonStyle(context, defaultButtonStyle());
    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;
    setParent(parentNode);
    possiblyHighlightSelectedNode();

    final gk = createNodeGK();

    return Container(
      // container only for possble selection gk
      key: gk,
      child: OutlinedButton(
        // if feature specified, must be a callout
        key: feature != null ? fco.setCalloutGk(feature!, GlobalKey()) : null,
        onPressed: ()=>onPressed(context, gk),
        onLongPress: f != null ? () => f.call(context) : null,
        style: btnStyle,
        child: child?.toWidget(context, this),
      ),
    );
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''OutlinedButton(
  //   onPressed: () {},
  //   style: ${buttonStyle?.toButtonStyleSource(context)},
  //   child: ${child?.toSource(context) ?? const Text(
  //             "missing OutlinedButton child!",
  //             style: TextStyle(color: Colors.red),
  //           )},
  // )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "OutlinedButton";
}
