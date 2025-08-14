// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/text_style_pnodes.dart';
import 'package:flutter_content/src/snippet/snodes/text_style_hook.dart';

part 'textspan_node.mapper.dart';

@MappableClass()
class TextSpanNode extends InlineSpanNode with TextSpanNodeMappable {
  String? text;
  String? webLink;

  // bool isRootTextSpan;
  @MappableField(hook: TextStyleHook())
  TextStyleProperties tsPropGroup;
  List<InlineSpanNode>? children;

  TextSpanNode({
    this.text,
    this.webLink,
    // this.isRootTextSpan = false,
    required this.tsPropGroup,
    this.children,
  });

  @override
  TextStyleProperties? textStyleProperties() => tsPropGroup;

  @override
  void setTextStyleProperties(TextStyleProperties newProps) =>
      tsPropGroup = newProps;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    var textStyleName = fco.findTextStyleName(fco.appInfo, tsPropGroup);
    textStyleName = textStyleName != null ? ': $textStyleName' : '';
    return [
      FlutterDocPNode(
          buttonLabel: 'TextSpan',
          webLink: 'https://api.flutter.dev/flutter/painting/TextSpan-class.html',
          snode: this,
          name: 'fyi'),
      StringPNode(
        snode: this,
        name: 'text',
        numLines: 6,
        stringValue: text,
        onStringChange: (newValue) =>
            refreshWithUpdate(context, () => text = newValue),
        calloutButtonSize: const Size(280, 70),
        calloutWidth: 300,
      ),
      StringPNode(
        snode: this,
        name: 'webLink',
        nameOnSeparateLine: true,
        expands: true,
        numLines: 3,
        stringValue: webLink,
        onStringChange: (newValue) {
          refreshWithUpdate(context, () => webLink = newValue ?? '');
        },
        calloutButtonSize: const Size(280, 70),
        calloutWidth: 300,
      ),
      TextStylePNode /*Group*/(
        snode: this,
        name: 'textStyle',
        textStyleProperties: tsPropGroup,
        onGroupChange: (newValue, refreshPTree) {
          refreshWithUpdate(context, () {
            tsPropGroup = newValue;
            if (refreshPTree) {
              forcePropertyTreeRefresh(context);
            }
          });
        },
      ),
    ];
  }

  @override
  InlineSpan toInlineSpan(BuildContext context) {
    // TextStyle? test_ts = textStyle?.toTextStyle(context);
    // var parentNode = getParent();
    // fco.logger.d('parent is ${parentNode.toString()}');
    // start with possible named style, or DefaultTextStyle
    // TextStyle? ts = textStyleProperties?.toTextStyle(context)
    //     ?? DefaultTextStyle.of(context).style;
    // merge with individual text style properties
    // if (textStyleProperties != null) {
    // ts = ts.merge(
    //   TextStyle(
    //     color: textStyleProperties?.colorValue != null ? Color(textStyleProperties!.colorValue!) : null,
    //     fontFamily: textStyleProperties?.fontFamily != null ? textStyleProperties!.fontFamily! : null,
    //     fontSize: textStyleProperties?.fontSize != null ? textStyleProperties!.fontSize! : null,
    //   ),
    // );
    // ts.merge(textStyleProperties?.toTextStyle(context));
    // }
    try {
      TextStyle? ts = tsPropGroup.toTextStyle(context);
      if (ts != null && webLink != null) {
        ts = ts.copyWith(
          //decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1,
        );
      }
      return TextSpan(
        text: text ?? "",
        recognizer: webLink != null && (fco.snippetBeingEdited == null) ? WebLinkTapGestureRecognizer(webLink!) : null,
        style: ts,
        children: children
            ?.map<InlineSpan>(
                (inlinespanNode) => inlinespanNode.toInlineSpan(context))
            .toList(),
      );
    } catch (e) {
      fco.logger.i('cannot render $FLUTTER_TYPE!');
      return WidgetSpan(
          child: Error(
              key: createNodeWidgetGK(), FLUTTER_TYPE, errorMsg: e.toString()));
    }
  }

  // @override
  // String toSource(
  //   BuildContext context, {
  //   bool isRoot = false,
  // }) {
  //   String? textStyleSrc = textStyle?.toSource(context);
  //   return '''TextSpan(
  //       text: ${text ?? ""},
  //       style: ${isRoot ? 'DefaultTextStyle.of(context).style.merge($textStyleSrc)' : textStyleSrc},
  //       children: ${children?.map<String>((inlinespanNode) => inlinespanNode.toSource(context, isRoot: false)).toList()},
  //     )''';
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "text",
  //           text: text,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             text = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       SizedBox(height: 20),
  //       NodePropertyButtonText(
  //           label: "named TextStyle",
  //           text: namedTextStyle ?? '',
  //           calloutSize: const Size(80, 200),
  //           onChangeF: (s) {
  //             namedTextStyle = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       SizedBox(height: 30),
  //       Text('or custom style...\n'),
  //       Row(
  //         children: [
  //           SizedBox(
  //             width: 80,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'lineHeight',
  //               originalS: (textStyle?.lineHeight ?? 1.0).toString(),
  //               onChangedF: (newLH) {
  //                 textStyle ??= TextStyleNodeProperty();
  //                 textStyle!.lineHeight = double.tryParse(newLH);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           const SizedBox(width: 10),
  //           SizedBox(
  //             width: 100,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'letterSpacing',
  //               originalS: (textStyle?.letterSpacing ?? 1.0).toString(),
  //               onChangedF: (newLS) {
  //                 textStyle ??= TextStyleNodeProperty();
  //                 textStyle!.letterSpacing = double.tryParse(newLS);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           const SizedBox(width: 10),
  //           Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Container(
  //                 width: 60,
  //                 height: 40,
  //                 child: InputDecorator(
  //                   decoration: InputDecoration(
  //                     labelText: 'italic',
  //                     labelStyle: FCO.enclosureLabelTextStyle,
  //                     border: const OutlineInputBorder(),
  //                     // isDense: false,
  //                   ),
  //                 ),
  //               ),
  //               Checkbox(
  //                 value: textStyle?.fontStyle == FontStyleEnum.italic,
  //                 fillColor: const WidgetStatePropertyAll(Colors.purple),
  //                 onChanged: (bool? isChecked) {
  //                   fco.logger.i("checked: $isChecked");
  //                   textStyle ??= TextStyleNodeProperty();
  //                   textStyle!.fontStyle = (isChecked ?? false) ? FontStyleEnum.italic : null;
  //                   bloc.add(const CAPIEvent.forceRefresh());
  //                 },
  //               )
  //             ],
  //           ),
  //         ],
  //       ),
  //       NodePropertyButtonFontFamily(
  //         label: 'font family',
  //         menuBgColor: textStyle?.colorValue == Colors.white.value ? Colors.black : Colors.white,
  //         originalFontFamily: textStyle?.fontFamily,
  //         onChangeF: (newFamily) {
  //           textStyle ??= TextStyleNodeProperty();
  //           textStyle!.fontFamily = newFamily;
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //       ),
  //       NodePropertyButtonEnum(
  //         label: 'theme.textStyle',
  //         menuItems: Material3TextSizeEnum.values
  //             .map((e) => e.toMenuItem(Theme.of(context), colorValue: textStyle?.colorValue, fontFamily: textStyle?.fontFamily))
  //             .toList(),
  //         originalEnumIndex: textStyle?.fontSizeName?.index ?? Material3TextSizeEnum.bodyM.index,
  //         onChangeF: (newOption) {
  //           textStyle ??= TextStyleNodeProperty();
  //           textStyle!.fontSizeName = Material3TextSizeEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: Material3TextSizeEnum.calloutSize,
  //       ),
  //       NodePropertyButtonEnum(
  //         label: 'fontWeight',
  //         menuItems: FontWeightEnum.values.map((e) => e.toMenuItem()).toList(),
  //         originalEnumIndex: textStyle?.fontWeight?.index ?? FontWeightEnum.normal_400.index,
  //         onChangeF: (newOption) {
  //           textStyle ??= TextStyleNodeProperty();
  //           textStyle!.fontWeight = FontWeightEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: FontWeightEnum.calloutSize,
  //       ),
  //       NodePropertyButtonColor(
  //         label: "color",
  //         colorValue: textStyle?.colorValue,
  //         onChangeF: (newValue) {
  //           textStyle ??= TextStyleNodeProperty();
  //           textStyle!.colorValue = newValue;
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //       ),
  //     ];

  // @override
  // List<Widget> siblingCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   if (parentNode is TextSpanNode) {
  //     List<Type> candidateTypes = [TextSpanNode, WidgetSpanNode];
  //     return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  //   } else {
  //     return super.siblingCandidates(context, parentNode, action, onPressed);
  //   }
  // }
  //
  // @override
  // List<Widget> childCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [TextSpanNode, WidgetSpanNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  @override
  bool canBeDeleted() => children == null || children!.isEmpty;

  @override
  List<Widget> menuAnchorWidgets_WrapWith(NodeAction action,
      bool? skipHeading,
      ScrollControllerName? scName,) {
    return [
      ...super.menuAnchorWidgets_Heading(action, scName),
      menuItemButton("TextSpan", TextSpanNode, action, scName),
    ];
  }

  @override
  List<Type> replaceWithRecommendations() =>
      [TextSpanNode, if (getParent() is TextSpanNode) WidgetSpanNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TextSpan";
}


class WebLinkTapGestureRecognizer extends TapGestureRecognizer {
  // one for each webLink
  static final _recognizers = <String, WebLinkTapGestureRecognizer>{};

  static WebLinkTapGestureRecognizer createWebLinkRecognizer(String webLink) {
    WebLinkTapGestureRecognizer? recognizer = _recognizers[webLink];
    if (recognizer == null) {
      _recognizers[webLink] = recognizer = WebLinkTapGestureRecognizer(webLink);
    }
    return recognizer;
  }

  final String webLink;

  WebLinkTapGestureRecognizer(this.webLink) {
    onTap = () async {
      if (await canLaunchUrlString(webLink)) {
        launchUrlString(webLink);
      }
    };
  }

  static void destroyAll() {
    for (final recognizer in _recognizers.values) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }
}
