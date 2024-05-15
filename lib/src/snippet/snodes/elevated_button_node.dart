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
    super.buttonStyleGroup,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  });

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    ButtonStyle? btnStyle = buttonStyleGroup?.toButtonStyle(context);
    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? FC().namedHandler(onTapHandlerName!) : null;

    setParent(parentNode);
    possiblyHighlightSelectedNode();

    return Container(
      // container only for possble selection gk
      key: createNodeGK(),
      child: ElevatedButton(
        // if feature specified, must be a callout
        key: feature != null ? FC().setCalloutGk(feature!, GlobalKey()) : null,
        onPressed: onPressed,
        onLongPress: f != null ? () => f.call(context) : null,
        style: btnStyle,
        child: child?.toWidget(context, this),
      ),
    );
  }

  @override
  String toSource(BuildContext context) => '''ElevatedButton(
    onPressed: ${onTapHandlerName != null ? '(){Snippet.namedHandler(super.onTapHandlerName!)?.call(context);}' : 'null'},
    style: ${buttonStyleGroup?.toButtonStyleSource(context)},
    child: ${child?.toSource(context)},
  )''';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "ElevatedButton";
}
