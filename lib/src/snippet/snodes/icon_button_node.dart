// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
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
    super.buttonStyleGroup,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  });

  // List<Widget> _iconPropertyButton(BuildContext context) => [
  //       InputDecorator(
  //         decoration: InputDecoration(
  //           labelText: 'button icon',
  //           labelStyle: Useful.enclosureLabelTextStyle,
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
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    // ButtonStyle? btnStyle = buttonStyle?.toButtonStyle(context);
    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? SnippetPanel.namedHandler(onTapHandlerName!) : null;
    // possible callout
    Feature? feature = calloutConfigGroup?.contentSnippetName;
    setParent(parentNode);

    IconButton button = IconButton(
      // if feature specified, must be a callout
      key: feature != null ? FC().setCalloutGk(feature, GlobalKey()) : null,
      onPressed: () async {
        if (feature != null) {
          //Widget contents = SnippetPanel(sName: calloutConfig!.contentSnippetName!);
          Future.delayed(
            const Duration(seconds: 1),
            () => Callout.showOverlay(
                targetGkF: () => FC().getCalloutGk(feature),
                boxContentF: (_) => SnippetPanel(
                      panelName: calloutConfigGroup!.contentSnippetName!,
                      snippetName: BODY_PLACEHOLDER,
                      allowButtonCallouts: false,
                    ),
                calloutConfig: CalloutConfig(
                  feature: feature,
                  //contents,
                  initialTargetAlignment: calloutConfigGroup!.targetAlignment != null
                      ? calloutConfigGroup!.targetAlignment!.flutterValue
                      : AlignmentEnum.bottomRight.flutterValue,
                  initialCalloutAlignment: calloutConfigGroup!.targetAlignment != null
                      ? calloutConfigGroup!.targetAlignment!.oppositeEnum.flutterValue
                      : AlignmentEnum.topLeft.flutterValue,
                  suppliedCalloutW: 200,
                  suppliedCalloutH: 150,
                  arrowType: calloutConfigGroup!.arrowType?.flutterValue ?? ArrowType.POINTY,
                  finalSeparation: 100,
                  barrier: CalloutBarrier(
                    opacity: 0.1,
                    onTappedF: () async {
                      Callout.dismiss(feature);
                    },
                  ),
                  color: calloutConfigGroup?.color ?? Colors.white,
                )),
          );
        }
      },
      style: buttonStyleGroup?.toButtonStyle(context),
      icon: child?.toWidget(context, this) ?? const Icon(Icons.warning, color: Colors.red),
    );

    possiblyHighlightSelectedNode();

    return Container(
      // container only for possble selection gk
      key: createNodeGK(),
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

  @override
  String toSource(BuildContext context) {
    return '''IconButton(
    onPressed: null,
    style: ${buttonStyleGroup?.toButtonStyleSource(context)},
    child: ${child?.toSource(context) ?? const Text(
              "missing IconButton child!",
              style: TextStyle(color: Colors.red),
            )},
  )''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "IconButton";
}
