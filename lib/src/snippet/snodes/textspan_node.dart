// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import '../pnodes/groups/text_style_group.dart';

part 'textspan_node.mapper.dart';

@MappableClass()
class TextSpanNode extends InlineSpanNode with TextSpanNodeMappable {
  String? text;

  // bool isRootTextSpan;
  TextStyleGroup? textStyleGroup;
  List<InlineSpanNode>? children;

  TextSpanNode({
    this.text,
    // this.isRootTextSpan = false,
    this.textStyleGroup,
    this.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'text',
          numLines: 6,
          stringValue: text,
          onStringChange: (newValue) => refreshWithUpdate(() => text = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 300,
        ),
        // BoolPropertyValueNode(
        //   snode: this,
        //   name: 'isRootTextSpan',
        //   boolValue: isRootTextSpan,
        //   onBoolChange: (newValue) => refreshWithUpdate(() => isRootTextSpan = newValue ?? false),
        // ),
        TextStylePropertyGroup(
          snode: this,
          name: 'textStyle',
          textStyleGroup: textStyleGroup,
          onGroupChange: (newValue) => refreshWithUpdate(() => textStyleGroup = newValue),
        ),
      ];

  @override
  InlineSpan toInlineSpan(BuildContext context) {
    // TextStyle? test_ts = textStyle?.toTextStyle(context);
    // var parentNode = getParent();
    // print('parent is ${parentNode.toString()}');
    // start with possible named style, or DefaultTextStyle
    // TextStyle? ts = textStyleGroup?.toTextStyle(context)
    //     ?? DefaultTextStyle.of(context).style;
    // merge with individual text style properties
    // if (textStyleGroup != null) {
      // ts = ts.merge(
      //   TextStyle(
      //     color: textStyleGroup?.colorValue != null ? Color(textStyleGroup!.colorValue!) : null,
      //     fontFamily: textStyleGroup?.fontFamily != null ? textStyleGroup!.fontFamily! : null,
      //     fontSize: textStyleGroup?.fontSize != null ? textStyleGroup!.fontSize! : null,
      //   ),
      // );
      // ts.merge(textStyleGroup?.toTextStyle(context));
    // }
    try {
      return TextSpan(
        text: text ?? "",
        style: textStyleGroup?.toTextStyle(context),
        children: children?.map<InlineSpan>((inlinespanNode) => inlinespanNode.toInlineSpan(context)).toList(),
      );
    } catch (e) {
      fco.logi('cannot render $FLUTTER_TYPE!');
      return  WidgetSpan(child: Error(key: createNodeGK(), FLUTTER_TYPE, errorMsg: e.toString()));
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
  //                   fco.logi("checked: $isChecked");
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
  List<Widget> menuAnchorWidgets_WrapWith(VoidCallback enterEditModeF, exitEditModeF,NodeAction action, bool? skipHeading) {
    return [
      ...super.menuAnchorWidgets_Heading(action),
      menuItemButton(enterEditModeF, exitEditModeF,"TextSpan", TextSpanNode, action),
    ];
  }

  @override
  List<Type> replaceWithRecommendations() => [TextSpanNode, if (getParent() is TextSpanNode) WidgetSpanNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TextSpan";
}
