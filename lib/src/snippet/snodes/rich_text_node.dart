// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_direction.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_overflow.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'rich_text_node.mapper.dart';

@MappableClass()
class RichTextNode extends CL with RichTextNodeMappable {
  TextAlignEnum? textAlign;
  TextDirectionEnum? textDirection;
  bool? softWrap;
  TextOverflowEnum? overflow;
  double? textScaleFactor;
  InlineSpanNode text; //child

  RichTextNode({
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    required this.text,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'RichText',
        webLink:
        'https://api.flutter.dev/flutter/widgets/RichText-class.html',
        snode: this,
        name: 'fyi'),
    EnumPNode<TextAlignEnum?>(
          snode: this,
          name: 'textAlign',
          valueIndex: textAlign?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(context,() => TextAlignEnum.of(newValue)),
        ),
        BoolPNode(
          snode: this,
          name: 'softWrap',
          boolValue: softWrap ?? true,
          onBoolChange: (newValue) =>
              refreshWithUpdate(context,() => softWrap = newValue),
        ),
        EnumPNode<TextOverflowEnum?>(
          snode: this,
          name: 'overflow',
          valueIndex: overflow?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(context,() => TextOverflowEnum.of(newValue)),
        ),
        DecimalPNode(
          snode: this,
          name: 'textScaleFactor',
          decimalValue: textScaleFactor,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => textScaleFactor = newValue),
          calloutButtonSize: const Size(140, 30),
        ),
        EnumPNode<TextDirectionEnum?>(
          snode: this,
          name: 'textDirection',
          valueIndex: textDirection?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(context,() => TextDirectionEnum.of(newValue)),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    try {
      TextSpan rootTextSpan = (text.toInlineSpan(context)) as TextSpan;
      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      RichText rt = RichText(
        key: createNodeWidgetGK(),
        text: rootTextSpan,
        textAlign: textAlign?.flutterValue ?? TextAlign.start,
        textDirection: textDirection?.flutterValue ?? TextDirection.ltr,
        textScaler: TextScaler.linear(textScaleFactor ?? 1.0),
        softWrap: softWrap ?? true,
        overflow: overflow?.flutterValue ?? TextOverflow.clip,
      );
      return rt;
    } catch (e) {
      fco.logger.i('cannot render $FLUTTER_TYPE!');
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE,
          color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  // @override
  // String toSource(BuildContext context) {
  //   String rootTextSpan = text.toSource(context, isRoot:true);
  //   return '''RichText(
  //     text: $rootTextSpan},
  //     textAlign: ${textAlign?.flutterValue ?? TextAlign.start},
  //     textDirection: ${textDirection?.flutterValue ?? TextDirection.ltr},
  //     softWrap: ${softWrap ?? true},
  //     overflow: ${overflow?.flutterValue ?? TextOverflow.clip},
  //     textScaler: TextScaler.linear(${textScaleFactor ?? 1.0}),
  //   )''';
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) {
  //   return [
  //     NodePropertyButtonEnum(
  //       label: 'textAlign',
  //       menuItems: TextAlignEnum.values.map((e) => e.toMenuItem()).toList(),
  //       originalEnumIndex: textAlign?.index??0,
  //       onChangeF: (newOption) {
  //         textAlign = TextAlignEnum.values[newOption];
  //         bloc.add(const CAPIEvent.forceRefresh());
  //       },
  //       calloutSize: calloutSize,
  //     ),
  //     NodePropertyButtonEnum(
  //       label: 'textDirection',
  //       menuItems: TextDirectionEnum.values.map((e) => e.toMenuItem()).toList(),
  //       originalEnumIndex: textDirection?.index,
  //       onChangeF: (newOption) {
  //         textDirection = TextDirectionEnum.values[newOption];
  //         bloc.add(const CAPIEvent.forceRefresh());
  //       },
  //       calloutSize: TextDirectionEnum.calloutSize,
  //     ),
  //     NodePropertyButtonEnum(
  //       label: 'overflow',
  //       menuItems: TextOverflowEnum.values.map((e) => e.toMenuItem()).toList(),
  //       originalEnumIndex: overflow?.index,
  //       onChangeF: (newOption) {
  //         overflow = TextOverflowEnum.values[newOption];
  //         bloc.add(const CAPIEvent.forceRefresh());
  //       },
  //       calloutSize: TextOverflowEnum.calloutSize,
  //     ),
  //     const SizedBox(height: 10),
  //     SizedBox(
  //       width: 110,
  //       height: 40,
  //       child: DecimalEditor(
  //         label: 'textScaleFactor',
  //         originalS: (textScaleFactor ?? 1.0).toString(),
  //         onChangedF: (newTSF) {
  //           textScaleFactor = double.tryParse(newTSF);
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //       ),
  //     ),
  //   ];
  // }

  TextAlignEnum? getTextAlign() => textAlign;

  setTextAlign(TextAlignEnum newTA) => textAlign = newTA;

  // @override
  // List<Widget> childCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [TextSpanNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }
  //
  // @override
  // List<Type> addChildOnly() => [TextSpanNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "RichText";
}
