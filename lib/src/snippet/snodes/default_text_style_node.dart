// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';

import '../pnodes/groups/text_style_group.dart';

part 'default_text_style_node.mapper.dart';

@MappableClass()
class DefaultTextStyleNode extends SC with DefaultTextStyleNodeMappable {
  TextStyleGroup? textStyleGroup;
  TextAlignEnum? textAlign;

  // bool softWrap;

  DefaultTextStyleNode({
    this.textStyleGroup,
    this.textAlign,
    // this.softWrap = true,
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
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
          onIndexChange: (newValue) => refreshWithUpdate(() => TextAlignEnum.of(newValue)),
        ),
      ];

  // @override
  // String toSource(BuildContext context) {
  //   return child != null
  //       ? '''DefaultTextStyle.merge(
  //     style: ${textStyleGroup?.toSource(context)},
  //     textAlign: ${textAlign?.toSource()},
  //     child: ${child!.toSource(context)},
  //   )'''
  //       : 'const Offstage()';
  // }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);
      return child != null
              ? DefaultTextStyle.merge(
                  key: createNodeGK(),
                  style: textStyleGroup?.toTextStyle(context),
                  textAlign: textAlign?.flutterValue,
                  child: child!.toWidget(context, this),
                )
              : const Offstage();
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "named TextStyle",
  //           text: namedTextStyle ?? '',
  //           calloutSize: const Size(80, 200),
  //           onChangeF: (s) {
  //             namedTextStyle = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       NodePropertyButtonColor(
  //         label: "color",
  //         colorValue: textStyle?.colorValue,
  //         onChangeF: (newValue) {
  //           textStyle ??= TextStyleNodeProperty();
  //           textStyle!.colorValue = newValue;
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //       ),
  //       NodePropertyButtonEnum(
  //         label: 'theme.textStyle',
  //         menuItems: Material3TextSizeEnum.values.map((e) => e.toMenuItem(Theme.of(context))).toList(),
  //         originalEnumIndex: textStyle?.fontSizeName?.index ?? Material3TextSizeEnum.bodyM.index,
  //         onChangeF: (newOption) {
  //           textStyle ??= TextStyleNodeProperty();
  //           textStyle!.fontSizeName = Material3TextSizeEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: calloutSize,
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
  //       NodePropertyButtonStyleLineHeight(
  //           label: "line height",
  //           lineHeight: textStyle?.lineHeight,
  //           onChangeF: (newLH) {
  //             textStyle ??= TextStyleNodeProperty();
  //             textStyle!.lineHeight = newLH;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       NodePropertyButtonTextAlign(
  //         label: 'textAlign',
  //         textAlign: textAlign,
  //         onChangeF: (newTA) {
  //           textAlign = newTA;
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //       ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "DefaultTextStyle";
}
