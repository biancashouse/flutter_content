// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'icon_button_node.mapper.dart';

@MappableClass()
class IconButtonNode extends ButtonNode with IconButtonNodeMappable {
  int? iconCodePoint;
  String? iconFontFamily;
  String? iconFontPackage;
  int? iconColor;
  double? iconSize;

  IconButtonNode({
    this.iconCodePoint,
    this.iconFontFamily,
    this.iconFontPackage,
    this.iconColor,
    this.iconSize,
    super.destinationRoutePathSnippetName,
    super.template,
    super.destinationPanelOrPlaceholderName,
    super.destinationSnippetName,
    super.buttonStyle,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  });

  // List<Widget> _iconPropertyButton(BuildContext context) => [
  //       InputDecorator(
  //         decoration: InputDecoration(
  //           labelText: 'button icon',
  //           labelStyle: FCO.enclosureLabelTextStyle,
  //           border: const OutlineInputBorder(),
  //         ), // isDense: false,
  //         child: Icon(Icons.more_horiz,
  //             // IconData(
  //             //   iconCodePoint ?? Icons.question_mark.codePoint,
  //             //   fontFamily: iconFontFamily,
  //             //   fontPackage: iconFontPackage,
  //             // ),
  //             size: iconSize,
  //             color: Color(iconColor ?? Colors.red.value)),
  //       ),
  //     ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       Container(
  //         width: 320,
  //         color: Colors.white,
  //         padding: const EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Column(
  //               children: [
  //                 ..._iconPropertyButton(context),
  //                 const SizedBox(height: 16),
  //                 ...super.nodePropertyEditors(context),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ];

  @override
  ButtonStyle? defaultButtonStyle() => IconButton.styleFrom();

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    ScrollControllerName? scName = EditablePage.name(context);
    // ButtonStyle? btnStyle = buttonStyle?.toButtonStyle(context);
    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? fco.namedHandler(onTapHandlerName!) : null;
    setParent(parentNode);

    final gk = createNodeGK();

    ButtonStyle? btnStyle = buttonStyle?.toButtonStyle(context, defaultButtonStyle());

    IconButton button = IconButton(
      // if feature specified, must be a callout
      key: feature != null ? fco.setCalloutGk(feature!, GlobalKey()) : null,
      onPressed: ()=>onPressed(context, gk, scName),
      style: btnStyle,
      icon: child?.toWidget(context, this) ?? const Icon(Icons.warning, color: Colors.red),
    );

    // possiblyHighlightSelectedNode(scName);

    return Container(
      // container only for possble selection gk
      key: gk,
      child: kDebugMode
          ? GestureDetector(
              onLongPress: f != null
                  ? () {
                      f.call(context);
                    }
                  : null,
              child: button)
          : button,
    );
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''IconButton(
  //   onPressed: null,
  //   style: ${buttonStyle?.toButtonStyleSource(context)},
  //   child: ${child?.toSource(context) ?? const Text(
  //             "missing IconButton child!",
  //             style: TextStyle(color: Colors.red),
  //           )},
  // )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "IconButton";
}
