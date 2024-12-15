// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'filled_button_node.mapper.dart';

@MappableClass()
class FilledButtonNode extends ButtonNode with FilledButtonNodeMappable {
  FilledButtonNode({
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
  ButtonStyle? defaultButtonStyle() => FilledButton.styleFrom();
  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    ScrollControllerName? scName = EditablePage.name(context);
    try {
      ButtonStyle? btnStyle = buttonStyle?.toButtonStyle(context, defaultButtonStyle());

      //buttonStyle?.toButtonStyle(context);
      // possible handler
      void Function(BuildContext)? f = onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;

      setParent(parentNode);
    ScrollControllerName? scName = EditablePage.name(context);
    possiblyHighlightSelectedNode(scName);

      final gk = createNodeGK();

      return Container(
            // container only for possble selection gk
            key: gk,
            child: FilledButton(
              // if feature specified, must be a callout
              key: feature != null ? fco.setCalloutGk(feature!, GlobalKey()) : null,
              onPressed: ()=>onPressed(context, gk, scName),
              onLongPress: f != null ? () => f.call(context) : null,
              style: btnStyle,
              child: child?.toWidget(context, this),
            ),
          );
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''FilledButton(
  //   onPressed: null,
  //   style: ${buttonStyle?.toButtonStyleSource(context)},
  //   child: ${child?.toSource(context) ?? const Text(
  //             "missing FilledButton child!",
  //             style: TextStyle(color: Colors.red),
  //           )},
  // )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "FilledButton";
}
