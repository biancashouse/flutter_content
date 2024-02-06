// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:get_it/get_it.dart';

import '../pnodes/groups/text_style_group.dart';

part 'textspan_node.mapper.dart';

@MappableClass()
class TextSpanNode extends InlineSpanNode with TextSpanNodeMappable {
  String? text;
  bool isRootTextSpan;
  TextStyleGroup? textStyleGroup;
  String? namedTextStyle;
  List<InlineSpanNode>? children;

  TextSpanNode({
    this.text,
    this.isRootTextSpan = false,
    this.textStyleGroup,
    this.namedTextStyle,
    this.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'text',
          stringValue: text,
          onStringChange: (newValue) => refreshWithUpdate(() => text = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(300, 240),
        ),
        BoolPropertyValueNode(
          snode: this,
          name: 'isRootTextSpan',
          boolValue: isRootTextSpan,
          onBoolChange: (newValue) => refreshWithUpdate(() => isRootTextSpan = newValue ?? false),
        ),
        TextStylePropertyGroup(
          snode: this,
          name: 'textStyle',
          textStyleGroup: textStyleGroup,
          onGroupChange: (newValue) => refreshWithUpdate(() => textStyleGroup = newValue),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'namedTextStyle',
          stringValue: namedTextStyle,
          options: FlutterContent.I.namedStyles.keys.toList(),
          onStringChange: (newValue) => refreshWithUpdate(() => namedTextStyle = newValue),
          calloutButtonSize: const Size(280, 20),
          calloutSize: const Size(280, 70),
        ),
      ];

  @override
  InlineSpan toInlineSpan(
    BuildContext context, {
    bool isRoot = false,
  }) {
    // TextStyle? test_ts = textStyle?.toTextStyle(context);
    try {
      return TextSpan(
        text: text ?? "",
        style: isRoot
            ? DefaultTextStyle.of(context).style.merge(textStyleGroup?.toTextStyle(context, namedTextStyle: namedTextStyle))
            : textStyleGroup?.toTextStyle(context, namedTextStyle: namedTextStyle),
        children: children?.map<InlineSpan>((inlinespanNode) => inlinespanNode.toInlineSpan(context, isRoot: false)).toList(),
      );
    } catch (e) {
      print('cannot render $FLUTTER_TYPE!');
    }
    return const WidgetSpan(child: Icon(Icons.error, color: Colors.redAccent));
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
  //                     labelStyle: Useful.enclosureLabelTextStyle,
  //                     border: const OutlineInputBorder(),
  //                     // isDense: false,
  //                   ),
  //                 ),
  //               ),
  //               Checkbox(
  //                 value: textStyle?.fontStyle == FontStyleEnum.italic,
  //                 fillColor: const MaterialStatePropertyAll(Colors.purple),
  //                 onChanged: (bool? isChecked) {
  //                   print("checked: $isChecked");
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
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TextSpan";
}
