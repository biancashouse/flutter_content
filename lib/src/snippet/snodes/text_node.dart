// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';

import '../pnodes/groups/text_style_group.dart';

part 'text_node.mapper.dart';

@MappableClass()
class TextNode extends CL with TextNodeMappable {
  String text;
  TextStyleGroup? textStyleGroup;
  TextAlignEnum? textAlign;

  TextNode({
    this.text = '',
    this.textStyleGroup,
    this.textAlign,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'text',
          // options: ['aardvark', 'blah', 'apple', 'oranges', 'bananas', 'grapes', 'coconut'],
          nameOnSeparateLine: true,
          expands: true,
          numLines: 3,
          stringValue: text,
          onStringChange: (newValue) {
            refreshWithUpdate(() => text = newValue??'');
          },
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 300,
        ),
        TextStylePropertyGroup(
          snode: this,
          name: 'textStyle',
          textStyleGroup: textStyleGroup,
          onGroupChange: (newValue) => refreshWithUpdate(() => textStyleGroup = newValue),
        ),
        EnumPropertyValueNode<TextAlignEnum?>(
          snode: this,
          name: 'textAlign',
          valueIndex: textAlign?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => textAlign = TextAlignEnum.of(newValue)),
        ),
      ];

  // @override
  // List<PTreeNode> properties() => [ PropertyGroup(snode: this,
  //       toString: 'Text properties',
  //
  //       children: [
  //         StringPropertyValueNode(
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
  //           textStyleGroup: textStyleGroup,
  //           onGroupChange: (newValue) => textStyleGroup = newValue,
  //
  //         ),
  //         StringPropertyValueNode(
  //           toString: 'namedTextStyle',
  //           stringValue: namedTextStyle,
  //           onStringChange: (newValue) => namedTextStyle = newValue,
  //           expands: false,
  //           calloutSize: const Size(200, 64),
  //         ),
  //         EnumPropertyValueNode<TextAlignEnum?>(
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
  //             labelStyle: Useful.enclosureLabelTextStyle,
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
  //                             labelStyle: Useful.enclosureLabelTextStyle,
  //                             border: const OutlineInputBorder(),
  //                             // isDense: false,
  //                           ),
  //                           child: Checkbox(
  //                             value: textStyle?.fontStyle == FontStyleEnum.italic,
  //                             fillColor: const WidgetStatePropertyAll(Colors.purple),
  //                             onChanged: (bool? isChecked) {
  //                               debugPrint("checked: $isChecked");
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
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    TextStyle? ts = textStyleGroup?.toTextStyle(context);
    try {
      Text t = Text(
        key: createNodeGK(),
        text,
        style: ts,
        textAlign: textAlign?.flutterValue,
      );
      return t;
    } catch (e) {
      debugPrint('cannot render $FLUTTER_TYPE!');
    }
    return const Icon(Icons.error, color: Colors.redAccent);
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
