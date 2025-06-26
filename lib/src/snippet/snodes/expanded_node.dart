import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/int_pnode.dart';

part 'expanded_node.mapper.dart';

@MappableClass()
class ExpandedNode extends SC with ExpandedNodeMappable {
  int flex;

  ExpandedNode({
    this.flex = 1,
    super.child,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'Expanded',
            webLink:
                'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
            snode: this,
            name: 'fyi'),
        IntPNode(
            snode: this,
            name: 'flex',
            intValue: flex,
            onIntChange: (newValue) =>
                refreshWithUpdate(context, () => flex = newValue ?? 1),
            calloutButtonSize: const Size(70, 30),
            viaButton: false),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      ) {
    try {
      setParent(parentNode);
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);
      return Expanded(
        key: createNodeWidgetGK(),
        flex: flex,
        child: child?.toWidget(context, this) ??
            const Icon(
              Icons.square,
              color: Colors.red,
            ),
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
    return '''Expanded(
        flex: $flex,
        child: ${child?.toSource(context) ?? 'const Icon(Icons.square, color: Colors.red)'}
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       const SizedBox(height: 10),
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
  //       // NodePropertyButtonString(
  //       //   label: 'flex',
  //       //   originalValue: flex.toString(),
  //       //   textInputType: TextInputType.number,
  //       //   digitsOnly: true,
  //       //   calloutSize: const Size(140, 80),
  //       //   onChangeF: (newFlex) {
  //       //     flex = int.tryParse(newFlex) ?? 1;
  //       //     bloc.add(const CAPIEvent.forceRefresh());
  //       //   },
  //       // ),
  //     ];

  // @override
  // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [RowNode, ColumnNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  @override
  List<Type> replaceWithRecommendations() => [ExpandedNode, FlexibleNode];

  @override
  List<Type> wrapCandidates() => [FlexNode];

  @override
  List<Type> wrapWithOnly() => [RowNode, ColumnNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Expanded";
}
