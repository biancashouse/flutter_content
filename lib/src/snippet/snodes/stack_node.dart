// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_clip.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stack_fit.dart';
import 'package:gap/gap.dart';

part 'stack_node.mapper.dart';

@MappableClass()
class StackNode extends MC with StackNodeMappable {
  StackFitEnum fit;
  ClipEnum clipBehavior;
  AlignmentEnum alignment;

  StackNode({
    this.fit = StackFitEnum.loose,
    this.clipBehavior = ClipEnum.hardEdge,
    this.alignment = AlignmentEnum.topLeft,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        EnumPropertyValueNode<StackFitEnum?>(
          snode: this,
          name: 'fit',
          valueIndex: fit.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => fit = StackFitEnum.of(newValue) ?? StackFitEnum.loose),
        ),
        EnumPropertyValueNode<ClipEnum?>(
          snode: this,
          name: 'clipBehavior',
          valueIndex: clipBehavior.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => clipBehavior = ClipEnum.of(newValue) ?? ClipEnum.hardEdge),
        ),
        EnumPropertyValueNode<AlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => alignment = AlignmentEnum.of(newValue) ?? AlignmentEnum.topLeft),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    try {
      return LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxHeight == double.infinity
              ? Row(
                  children: [
                    fco.errorIcon(Colors.red),
                    Gap(10),
                    const Text('Stack has infinite\nmaxHeight constraint!\nWrap in a SizedBox?'),
                  ],
                )
              : Stack(
                  key: createNodeGK(),
                  fit: fit.flutterValue,
                  clipBehavior: clipBehavior.flutterValue,
                  alignment: alignment.flutterValue,
                  children: children.map((node) => node.toWidget(context, this)).toList(),
                );
        },
      );
    } catch (e) {
      fco.logi('cannot render $FLUTTER_TYPE!');
    }
    return fco.errorIcon(Colors.red);
  }

  @override
  String toSource(BuildContext context) {
    return '''Stack(
        fit: ${fit.toSource()},
        clipBehavior: ${clipBehavior.toSource()},
        alignment: ${alignment.toSource()},
        children: ${children.map((node) => node.toSource(context)).toList()},
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       const SizedBox(width: 10, height: 10),
  //       Container(
  //         color: Colors.purple,
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           children: [
  //             FCO.coloredText('stackFit:', color: Colors.white),
  //             const SizedBox(width: 10),
  //             StackFitEditor(
  //               originalValue: fit,
  //               onChangedF: (newValue) {
  //                 fit = newValue ?? StackFitEnum.loose;
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(width: 10, height: 10),
  //       Container(
  //         color: Colors.purple,
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           children: [
  //             FCO.coloredText('clipBehavior:', color: Colors.white),
  //             const SizedBox(width: 10),
  //             StackClipEditor(
  //               originalValue: clipBehavior,
  //               onChangedF: (newValue) {
  //                 clipBehavior = newValue ?? ClipEnum.hardEdge;
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       // NodePropertyButtonRadioMenu(
  //       //   label: 'stackFit',
  //       //   menuItems: NodeStackFit.values.map((e) => e.toMenuItem()).toList(),
  //       //   originalOption: fit.index,
  //       //   onChangeF: (newOption) {
  //       //     fit = NodeStackFit.values[newOption];
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       //   calloutSize: NodeStackFit.calloutSize,
  //       // ),
  //       // NodePropertyButtonRadioMenu(
  //       //   label: 'clipBehavior',
  //       //   menuItems: NodeClip.values.map((e) => e.toMenuItem()).toList(),
  //       //   originalOption: clipBehavior.index,
  //       //   onChangeF: (newOption) {
  //       //     clipBehavior = NodeClip.values[newOption];
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       //   calloutSize: NodeClip.calloutSize,
  //       // ),
  //       // NodePropertyButtonRadioMenu(
  //       //   label: 'alignment',
  //       //   menuItems: NodeAlignment.values.map((e) => e.toMenuItem()).toList(),
  //       //   originalOption: alignment.index,
  //       //   onChangeF: (newOption) {
  //       //     alignment = NodeAlignment.values[newOption];
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       //   calloutSize: NodeAlignment.calloutSize,
  //       // ),
  //     ];

  @override
  List<Type> addChildRecommendations() => [PositionedNode, AlignNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Stack";
}
