// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_clip.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stack_fit.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

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
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'Stack',
            webLink: 'https://api.flutter.dev/flutter/widgets/Stack-class.html',
            snode: this,
            name: 'fyi'),
        EnumPNode<StackFitEnum?>(
          snode: this,
          name: 'fit',
          valueIndex: fit.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,
              () => fit = StackFitEnum.of(newValue) ?? StackFitEnum.loose),
        ),
        EnumPNode<ClipEnum?>(
          snode: this,
          name: 'clipBehavior',
          valueIndex: clipBehavior.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,
              () => clipBehavior = ClipEnum.of(newValue) ?? ClipEnum.hardEdge),
        ),
        EnumPNode<AlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment.index,
          onIndexChange: (newValue) => refreshWithUpdate(
              context,
              () => alignment =
                  AlignmentEnum.of(newValue) ?? AlignmentEnum.topLeft),
        ),
      ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode,
      ) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    try {
      return LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxHeight == double.infinity
              ? Error(
                  key: createNodeWidgetGK(),
                  FLUTTER_TYPE,
                  color: Colors.red,
                  size: 16,
                  errorMsg:
                      'Stack has infinite\nmaxHeight constraint!\nWrap in a SizedBox?')
              : Stack(
                  key: createNodeWidgetGK(),
                  fit: fit.flutterValue,
                  clipBehavior: clipBehavior.flutterValue,
                  alignment: alignment.flutterValue,
                  children: children
                      .map((node) => node.buildFlutterWidget(context, this))
                      .toList(),
                );
        },
      );
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
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
