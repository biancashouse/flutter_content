import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'positioned_node.mapper.dart';

@MappableClass()
class PositionedNode extends SC with PositionedNodeMappable {
  double? top;
  double? left;
  double? bottom;
  double? right;

  PositionedNode({
    this.top,
    this.left,
    this.bottom,
    this.right,
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        DecimalPropertyValueNode(
          snode: this,
          name: 'top',
          decimalValue: top,
          onDoubleChange: (newValue) => refreshWithUpdate(() => top = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'left',
          decimalValue: left,
          onDoubleChange: (newValue) => refreshWithUpdate(() => left = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'bottom',
          decimalValue: bottom,
          onDoubleChange: (newValue) => refreshWithUpdate(() => bottom = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'right',
          decimalValue: right,
          onDoubleChange: (newValue) => refreshWithUpdate(() => right = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    return Positioned(
      key: createNodeGK(),
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Tooltip(
        message: "Positioned(missing child!)",
        child: child?.toWidget(context, this) ??
            const Icon(
              Icons.warning,
              color: Colors.deepOrange,
            ),
      ),
    );
  }

  @override
  String toSource(BuildContext context) {
    return child != null
        ? '''Positioned(
      top: $top,
      left: $left,
      bottom: $bottom,
      right: $right,
      child: ${child!.toSource(context)},
    )'''
        : 'const Offstage()';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       const SizedBox(height: 10),
  //       Row(children: [
  //         SizedBox(
  //           width: 80,
  //           height: 40,
  //           child: DecimalEditor(
  //             label: 'top',
  //             originalS: top.toString(),
  //             onChangedF: (newValue) {
  //               top = double.tryParse(newValue);
  //               bloc.add(const CAPIEvent.forceRefresh());
  //             },
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         SizedBox(
  //           width: 80,
  //           height: 40,
  //           child: DecimalEditor(
  //             label: 'left',
  //             originalS: left.toString(),
  //             onChangedF: (newValue) {
  //               left = double.tryParse(newValue);
  //               bloc.add(const CAPIEvent.forceRefresh());
  //             },
  //           ),
  //         )
  //       ]),
  //       const SizedBox(height: 10),
  //       Row(children: [
  //         SizedBox(
  //           width: 80,
  //           height: 40,
  //           child: DecimalEditor(
  //             label: 'bottom',
  //             originalS: bottom.toString(),
  //             onChangedF: (newValue) {
  //               bottom = double.tryParse(newValue);
  //               bloc.add(const CAPIEvent.forceRefresh());
  //             },
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         SizedBox(
  //           width: 80,
  //           height: 40,
  //           child: DecimalEditor(
  //             label: 'right',
  //             originalS: right.toString(),
  //             onChangedF: (newValue) {
  //               right = double.tryParse(newValue);
  //               bloc.add(const CAPIEvent.forceRefresh());
  //             },
  //           ),
  //         ),
  //       ]),
  //
  //       // NodePropertyButtonString(
  //       //   label: 'top',
  //       //   originalValue: top?.toString(),
  //       //   calloutSize: const Size(140, 80),
  //       //   onChangeF: (newValue) {
  //       //     top = double.tryParse(newValue);
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       // ),
  //       // NodePropertyButtonString(
  //       //   label: 'left',
  //       //   originalValue: left?.toString(),
  //       //   calloutSize: const Size(140, 80),
  //       //   onChangeF: (newValue) {
  //       //     left = double.tryParse(newValue);
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       // ),
  //       // NodePropertyButtonString(
  //       //   label: 'bottom',
  //       //   originalValue: bottom?.toString(),
  //       //   calloutSize: const Size(140, 80),
  //       //   onChangeF: (newValue) {
  //       //     bottom = double.tryParse(newValue);
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       // ),
  //       // NodePropertyButtonString(
  //       //   label: 'right',
  //       //   originalValue: right?.toString(),
  //       //   calloutSize: const Size(140, 80),
  //       //   onChangeF: (newValue) {
  //       //     right = double.tryParse(newValue);
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       // ),
  //     ];

  // @override
  // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [StackNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  @override
  List<Type> replaceWithRecommendations() => [PositionedNode, AlignNode];

  @override
  List<Widget> menuAnchorWidgets_WrapWith(NodeAction action, bool? skipHeading) {
    return [
      if (getParent() is! StackNode) ...super.menuAnchorWidgets_Heading(action),
      if (getParent() is! StackNode) menuItemButton("Stack", StackNode, action),
    ];
  }

  @override
  List<Type> wrapCandidates() => [StackNode];

  @override
  String toString() => FLUTTER_TYPE;
  static const String FLUTTER_TYPE = "Positioned";
}
