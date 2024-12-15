// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_flex_fit.dart';

part 'flexible_node.mapper.dart';

@MappableClass()
class FlexibleNode extends SC with FlexibleNodeMappable {
  int flex;
  FlexFitEnum fit;

  FlexibleNode({
    this.flex = 1,
    this.fit = FlexFitEnum.loose,
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        IntPropertyValueNode(
          snode: this,
          name: 'flex',
          intValue: flex,
          onIntChange: (newValue) =>
              refreshWithUpdate(() => flex = newValue ?? 1),
          calloutButtonSize: const Size(70, 30),
        ),
        EnumPropertyValueNode<FlexFitEnum?>(
          snode: this,
          name: 'fit',
          valueIndex: fit.index,
          onIndexChange: (newValue) => refreshWithUpdate(
              () => FlexFitEnum.of(newValue ?? FlexFitEnum.loose.index)),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
    ScrollControllerName? scName = EditablePage.name(context);
    possiblyHighlightSelectedNode(scName);
      return Flexible(
            key: createNodeGK(),
            flex: flex,
            fit: fit.flutterValue,
            child: child?.toWidget(context, this) ??
                const Icon(
                  Icons.square,
                  color: Colors.red,
                ),
          );
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  @override
  String toSource(BuildContext context) {
    return '''Flexible(
        flex: $flex,
        fit: ${fit.toSource()},
        child: ${child?.toSource(context) ?? const Icon(
              Icons.square,
              color: Colors.red,
            )},
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       SizedBox(height: 10),
  //       Row(children: [
  //         SizedBox(
  //           width: 80,
  //           height: 40,
  //           child: IntegerEditor(
  //             label: 'flex',
  //             originalS: flex.toString(),
  //             onChangedF: (newFlex) {
  //               flex = int.tryParse(newFlex) ?? 1;
  //               bloc.add(const CAPIEvent.forceRefresh());
  //             },
  //           ),
  //         ),
  //       ]),
  //       // NodePropertyButtonRadioMenu(
  //       //   label: 'fit',
  //       //   menuItems: NodeFlexFit.values.map((e) => e.toMenuItem()).toList(),
  //       //   originalOption: fit.index,
  //       //   onChangeF: (newOption) {
  //       //     fit = NodeFlexFit.values[newOption];
  //       //   },
  //       //   calloutSize: NodeFlexFit.calloutSize,
  //       // ),
  //       const SizedBox(width: 10, height: 10),
  //       Container(
  //         color: Colors.purple,
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           children: [
  //             FCO.coloredText('fit:', color: Colors.white),
  //             const SizedBox(width: 10),
  //             FlexFitEditor(
  //               originalValue: fit,
  //               onChangedF: (newValue) {
  //                 fit = newValue ?? FlexFitEnum.loose;
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ];

  // @override
  // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [RowNode, ColumnNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  @override
  List<Type> wrapCandidates() => [FlexNode];

  @override
  List<Type> wrapWithOnly() => [RowNode,ColumnNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Flexible";
}
