// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';

part 'align_node.mapper.dart';

@MappableClass()
class AlignNode extends SC with AlignNodeMappable {
  AlignmentEnum alignment;

  AlignNode({
    required this.alignment,
    super.child,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        EnumPNode<AlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment.index,
          onIndexChange: (newIndex) => refreshWithUpdate(() => alignment = AlignmentEnum.of(newIndex ?? AlignmentEnum.topLeft.index)!),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonEnum(
  //         label: 'alignment',
  //         menuItems: AlignmentEnum.values.map((e) => e.toMenuItem()).toList(),
  //         originalEnumIndex: alignmentIndex,
  //         onChangeF: (newIndex) {
  //           alignmentIndex = newIndex;
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: AlignmentEnum.calloutSize,
  //       ),
  //     ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonEnum(
  //         label: 'alignment',
  //         menuItems: AlignmentEnum.values.map((e) => e.toMenuItem()).toList(),
  //         originalEnumIndex: alignment.index,
  //         onChangeF: (newOption) {
  //           alignment = AlignmentEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: calloutSize,
  //       ),
  //     ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

      return Align(
            key: createNodeWidgetGK(),
            alignment: alignment.flutterValue,
            child: child?.toWidget(context, this),
          );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  @override
  String toSource(BuildContext context) {
    return '';
    // return '''Align(
    //   alignment: ${alignmentIndex.toSource()},
    //   child: ${child?.toSource(context)},
    // )''';
  }

  // List<Widget> wrapWithCandidates(final BuildContext context, final Node? parentNode, ValueChanged<Type> onPressed) {
  //   List<Type> canWrapWith = [
  //       ...singleChildSubClasses,
  //       FlexNode,
  //       StackNode,
  //       DirectoryNode,
  //       SplitViewNode,
  //       MenuBarNode,
  //       RichTextNode,
  //     ]);
  //   }
  //   if (parentNode is! FlexNode) types.remove(ExpandedNode);
  //   return toMenuItems(context, nodeTypes: types, onPressed: onPressed);
  // }

  // @override
  // List<Widget> menuAnchorWidgets_ReplaceWith(NodeAction action, bool? skipHeading) {
  //   if (getParent() is StackNode) menuAnchorWidgets_ReplaceWith(snippetBloc, action, skipHeading)
  //   return menuAnchorWidgets_ReplaceWith(snippetBloc, action, skipHeading);
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Align";
}
