// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'text_button_node.mapper.dart';

@MappableClass()
class TextButtonNode extends ButtonNode with TextButtonNodeMappable {
  TextButtonNode({
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
      child: TextButton(
        // if feature specified, must be a callout
        key: feature != null ? FC().setCalloutGk(feature!, GlobalKey()) : null,
        onPressed: onPressed,
        onLongPress: f != null ? () => f.call(context) : null,
        style: btnStyle,
        child: child?.toWidget(context, this) ?? const Text('empty'),
      ),
    );
  }

  @override
  String toSource(BuildContext context) {
    return '''TextButton(
    onPressed: null,
    style: ${buttonStyleGroup?.toButtonStyleSource(context)},
    child: ${child?.toSource(context) ?? const Text(
              "missing TextButton child!",
              style: TextStyle(color: Colors.red),
            )},
  )''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Text";
}
