// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_properties.dart';

part 'outlined_button_node.mapper.dart';

@MappableClass()
class OutlinedButtonNode extends ButtonNode with OutlinedButtonNodeMappable {
  OutlinedButtonNode({
    super.destinationRoutePathSnippetName,
    super.template,
    super.destinationPanelOrPlaceholderName,
    super.destinationSnippetName,
    required super.bsPropsGroup,
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
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    ScrollControllerName? scName = EditablePage.scName(context);
    try {
      ButtonStyle? btnStyle = bsPropsGroup?.toButtonStyle(context, defaultButtonStyle());
      // possible handler
      void Function(BuildContext)? f = onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;
      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

      final gk = createNodeWidgetGK();

      return Container(
            // container only for possble selection gk
            key: gk,
            child: OutlinedButton(
              // if feature specified, must be a callout
              key: cid != null ? fco.setCalloutGk(cid!, GlobalKey()) : null,
              onPressed: ()=>onPressed(context, gk, scName),
              onLongPress: f != null ? () => f.call(context) : null,
              style: btnStyle,
              child: child?.toWidget(context, this),
            ),
          );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
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
