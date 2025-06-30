// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_properties.dart';
import 'package:flutter_content/src/snippet/snodes/button_style_hook.dart';

part 'text_button_node.mapper.dart';

@MappableClass()
class TextButtonNode extends ButtonNode with TextButtonNodeMappable {
  TextButtonNode({
    super.destinationRoutePathSnippetName,
    super.template,
    // super.destinationPanelOrPlaceholderName,
    // super.destinationSnippetName,
    required super.bsPropGroup,
    super.onTapHandlerName,
    super.calloutConfig,
    super.child,
  });

  @override
  ButtonStyle? defaultButtonStyle() => TextButton.styleFrom();

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'TextButton',
        webLink: 'https://api.flutter.dev/flutter/material/TextButton-class.html',
        snode: this,
        name: 'fyi'),
    ...super.properties(context, parentSNode),
  ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    try {
      ButtonStyle? btnStyle = bsPropGroup.toButtonStyle(context, defaultButtonStyle:defaultButtonStyle());
      // possible handler
      void Function(BuildContext)? f = onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;

      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

      final gk = createNodeWidgetGK();

      return Container(
            // container only for possble selection gk
            key: gk,
            child: TextButton(
              // if feature specified, must be a callout
              key: cid != null ? fco.setCalloutGk(cid!, GlobalKey()) : null,
              onPressed: ()=>onPressed(context, gk, scName),
              onLongPress: ()=>f?.call(context),
              style: btnStyle,
              child: child?.toWidget(context, this) ?? const Text('empty'),
            ),
          );
    } catch (e) {
     return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''TextButton(
  //   onPressed: null,
  //   style: ${buttonStyle?.toButtonStyleSource(context)},
  //   child: ${child?.toSource(context) ?? const Text(
  //             "missing TextButton child!",
  //             style: TextStyle(color: Colors.red),
  //           )},
  // )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TextButton";
}
