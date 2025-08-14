// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/text_style_pnodes.dart';
import 'package:flutter_content/src/snippet/snodes/text_style_hook.dart';

import '../pnodes/groups/text_style_properties.dart';

part 'text_node.mapper.dart';

// class TextStyleHook extends MappingHook {
//   const TextStyleHook();
//
//   @override
//   Object? beforeDecode(Object? value) {
//     return value ?? {'tsPropGroup': TextStyleProperties().toJson()};
//   }
// }

@MappableClass()
class TextNode extends CL with TextNodeMappable {
  String text;
  String? webLink;
  @MappableField(hook: TextStyleHook())
  TextStyleProperties tsPropGroup;

  // always store group, even if its props are all null
  TextAlignEnum? textAlign;

  TextNode({
    this.text = '',
    this.webLink,
    required this.tsPropGroup,
    this.textAlign,
  }) {
    // fco.logger.i('TextNode(uid:$uid) created');
  }

  @override
  TextStyleProperties? textStyleProperties() => tsPropGroup;

  @override
  void setTextStyleProperties(TextStyleProperties newProps) =>
      tsPropGroup = newProps;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    // fco.logger.i('textStyleName is "$textStyleName"');
    return [
      FlutterDocPNode(
          buttonLabel: 'Text',
          webLink: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
          snode: this,
          name: 'fyi'),
      StringPNode(
        snode: this,
        name: 'text',
        // options: ['aardvark', 'blah', 'apple', 'oranges', 'bananas', 'grapes', 'coconut'],
        nameOnSeparateLine: true,
        expands: true,
        numLines: 3,
        stringValue: text,
        onStringChange: (newValue) {
          refreshWithUpdate(context, () => text = newValue ?? '');
        },
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
      // if (parentSNode is! TabBarNode)
      //   StringPNode(
      //     snode: this,
      //     name: 'textStyle name',
      //     stringValue: textStyleName,
      //     onStringChange: (newValue) {
      //       refreshWithUpdate(context,() => textStyleName = newValue);
      //     },
      //     options: fco.namedTextStyles.keys.toList(),
      //     calloutButtonSize: const Size(280, 70),
      //     calloutWidth: 280,
      //   ),
      if (parentSNode is! TabBarNode && parentSNode is! ButtonNode)
        TextStylePNode /*Group*/ (
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
      if (parentSNode is TabBarNode)
        FYIPNode(
            label: "TabBar text styling...",
            msg: "for text styling, see\nparent TabBar's labelStyle",
            snode: this,
            name: 'fyi'),
      if (parentSNode is ButtonNode)
        FYIPNode(
            label: "Button text styling...",
            msg:
                "for text styling, see parent Button's\nButtonStyle, which has a TextStyle",
            snode: this,
            name: 'fyi'),
      if (parentSNode is! ButtonNode && parentSNode?.getParent() is! AppBarNode)
        EnumPNode<TextAlignEnum?>(
          snode: this,
          name: 'textAlign',
          valueIndex: textAlign?.index,
          onIndexChange: (newValue) => refreshWithUpdate(
              context, () => textAlign = TextAlignEnum.of(newValue)),
        ),
    ];
  }

  // @override
  // List<PTreeNode> properties() => [ PropertyGroup(snode: this,
  //       toString: 'Text properties',
  //
  //       children: [
  //         StringPNode(
  //             toString: 'text',
  //             labelOnSeparateLine: true,
  //             stringValue: text,
  //             onStringChange: (newValue) {
  //               text = newValue;
  //               bloc.add(const CAPIEvent.forceRefresh());
  //             },
  //             calloutSize: const Size(200, 240)),
  //         TextStylePropertyGroup(snode: this,
  //           toString: 'textStyle',
  //           textStyleProperties: textStyleProperties,
  //           onGroupChange: (newValue) => textStyleProperties = newValue,
  //
  //         ),
  //         StringPNode(
  //           toString: 'namedTextStyle',
  //           stringValue: namedTextStyle,
  //           onStringChange: (newValue) => namedTextStyle = newValue,
  //           expands: false,
  //           calloutSize: const Size(200, 64),
  //         ),
  //         EnumPNode<TextAlignEnum?>(
  //           toString: 'textAlign',
  //           valueIndex: textAlign?.index,
  //           onIndexChange: (newValue) {
  //             textAlign = TextAlignEnum.of(newValue);
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           },
  //         ),
  //       ],
  //     );

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "text",
  //           text: text,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             text = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "named TextStyle",
  //           text: namedTextStyle ?? '',
  //           calloutSize: const Size(220, 100),
  //           onChangeF: (s) {
  //             namedTextStyle = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       NodePropertyButtonEnum(
  //         label: 'textAlign',
  //         menuItems: TextAlignEnum.values.map((e) => e.toMenuItem()).toList(),
  //         originalEnumIndex: textAlign?.index ?? 0,
  //         onChangeF: (newOption) {
  //           textAlign = TextAlignEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: const Size(220, 100),
  //       ),
  //       const SizedBox(height: 20),
  //       SizedBox(
  //         width: 330,
  //         child: InputDecorator(
  //           decoration: InputDecoration(
  //             labelText: 'textStyle',
  //             labelStyle: FCO.enclosureLabelTextStyle,
  //             border: const OutlineInputBorder(),
  //           ), // isDense: false,
  //           child: IntrinsicHeight(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   //width: 60, height: 40,
  //                   child: Row(
  //                     children: [
  //                       SizedBox(
  //                         width: 90,
  //                         height: 40,
  //                         child: DecimalEditor(
  //                           label: 'lineHeight',
  //                           originalS: (textStyle?.lineHeight ?? 1.0).toString(),
  //                           onChangedF: (newLH) {
  //                             textStyle ??= TextStyleNodeProperty();
  //                             textStyle!.lineHeight = double.tryParse(newLH);
  //                             bloc.add(const CAPIEvent.forceRefresh());
  //                           },
  //                         ),
  //                       ),
  //                       const SizedBox(width: 10),
  //                       SizedBox(
  //                         width: 90,
  //                         height: 40,
  //                         child: DecimalEditor(
  //                           label: 'letterSpacing',
  //                           originalS: (textStyle?.letterSpacing ?? 1.0).toString(),
  //                           onChangedF: (newLS) {
  //                             textStyle ??= TextStyleNodeProperty();
  //                             textStyle!.letterSpacing = double.tryParse(newLS);
  //                             bloc.add(const CAPIEvent.forceRefresh());
  //                           },
  //                         ),
  //                       ),
  //                       const SizedBox(width: 10),
  //                       SizedBox(
  //                         width: 60,
  //                         height: 40,
  //                         child: InputDecorator(
  //                           decoration: InputDecoration(
  //                             labelText: 'italic',
  //                             labelStyle: FCO.enclosureLabelTextStyle,
  //                             border: const OutlineInputBorder(),
  //                             // isDense: false,
  //                           ),
  //                           child: Checkbox(
  //                             value: textStyle?.fontStyle == FontStyleEnum.italic,
  //                             fillColor: const WidgetStatePropertyAll(Colors.purple),
  //                             onChanged: (bool? isChecked) {
  //                               fco.logger.i("checked: $isChecked");
  //                               textStyle ??= TextStyleNodeProperty();
  //                               textStyle!.fontStyle = (isChecked ?? false) ? FontStyleEnum.italic : null;
  //                               bloc.add(const CAPIEvent.forceRefresh());
  //                             },
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 NodePropertyButtonFontFamily(
  //                   label: 'font family',
  //                   menuBgColor: textStyle?.colorValue == Colors.white.value ? Colors.purple : Colors.white,
  //                   originalFontFamily: textStyle?.fontFamily,
  //                   onChangeF: (newFamily) {
  //                     textStyle ??= TextStyleNodeProperty();
  //                     textStyle!.fontFamily = newFamily;
  //                     bloc.add(const CAPIEvent.forceRefresh());
  //                   },
  //                 ),
  //                 NodePropertyButtonEnum(
  //                   label: 'theme.textStyle',
  //                   menuItems: Material3TextSizeEnum.values
  //                       .map((e) => e.toMenuItem(Theme.of(context), colorValue: textStyle?.colorValue, fontFamily: textStyle?.fontFamily))
  //                       .toList(),
  //                   originalEnumIndex: textStyle?.fontSizeName?.index ?? Material3TextSizeEnum.bodyM.index,
  //                   onChangeF: (newOption) {
  //                     textStyle ??= TextStyleNodeProperty();
  //                     textStyle!.fontSizeName = Material3TextSizeEnum.values[newOption];
  //                     bloc.add(const CAPIEvent.forceRefresh());
  //                   },
  //                   calloutSize: Material3TextSizeEnum.calloutSize,
  //                 ),
  //                 NodePropertyButtonEnum(
  //                   label: 'fontWeight',
  //                   menuItems: FontWeightEnum.values.map((e) => e.toMenuItem()).toList(),
  //                   originalEnumIndex: textStyle?.fontWeight?.index ?? FontWeightEnum.normal_400.index,
  //                   onChangeF: (newOption) {
  //                     textStyle ??= TextStyleNodeProperty();
  //                     textStyle!.fontWeight = FontWeightEnum.values[newOption];
  //                     bloc.add(const CAPIEvent.forceRefresh());
  //                   },
  //                   calloutSize: FontWeightEnum.calloutSize,
  //                 ),
  //                 NodePropertyButtonColor(
  //                   label: "color",
  //                   colorValue: textStyle?.colorValue,
  //                   onChangeF: (newValue) {
  //                     textStyle ??= TextStyleNodeProperty();
  //                     textStyle!.colorValue = newValue;
  //                     bloc.add(const CAPIEvent.forceRefresh());
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode,
      ) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

    late Text t;
    final ts = tsPropGroup.toTextStyle(context);
    try {
      t = Text(
        key: createNodeWidgetGK(),
        text,
        style: ts,
        textAlign: textAlign?.flutterValue,
      );
      return webLink != null
          ? InkWell(
              onTap: () async {
                if (await canLaunchUrlString(webLink!)) {
                launchUrlString(webLink!);
                }
              },
              child: t,
            )
          : t;
    } catch (e) {
      fco.logger.i('cannot render $FLUTTER_TYPE!');
      return Error(
          key: createNodeWidgetGK(), FLUTTER_TYPE, errorMsg: e.toString());
    }
  }

// @override
// String toSource(BuildContext context) {
//   return '''Text(
//       $text,
//       style: ${textStyle?.toSource(context, namedTextStyle: namedTextStyle)},
//       textAlign: ${textAlign?.toSource()},
//     )''';
// }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Text";
}
