import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

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
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'Positioned',
        webLink:
        'https://api.flutter.dev/flutter/widgets/Positioned-class.html',
        snode: this,
        name: 'fyi'),
    DecimalPNode(
          snode: this,
          name: 'top',
          decimalValue: top,
          onDoubleChange: (newValue) => refreshWithUpdate(context,() => top = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'left',
          decimalValue: left,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => left = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'bottom',
          decimalValue: bottom,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => bottom = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'right',
          decimalValue: right,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => right = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    return Positioned(
      key: createNodeWidgetGK(),
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
  List<Widget> menuAnchorWidgets_WrapWith(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (getParent() is! StackNode)
        ...super.menuAnchorWidgets_Heading(action, scName),
      if (getParent() is! StackNode)
        menuItemButton("Stack", StackNode, action, scName),
    ];
  }

  @override
  List<Type> wrapCandidates() => [StackNode];

  @override
  String toString() => FLUTTER_TYPE;
  static const String FLUTTER_TYPE = "Positioned";
}
