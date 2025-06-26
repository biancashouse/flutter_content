import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:gap/gap.dart';

part 'gap_node.mapper.dart';

@MappableClass()
class GapNode extends CL with GapNodeMappable {
  double gap;

  GapNode({
    required this.gap,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'Gap',
            webLink:
                'https://pub.dev/packages/gap',
            snode: this,
            name: 'fyi'),
        DecimalPNode(
          snode: this,
          name: 'gap',
          decimalValue: gap,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context, () => gap = newValue ?? 0),
          calloutButtonSize: const Size(60, 30),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "snippet name",
  //           text: snippetName,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             snippetName = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      ) {
    setParent(parentNode); // propagating parents down from root
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    return Gap(
      key: createNodeWidgetGK(), gap,
      // crossAxisExtent: 10,
    );
  }

  @override
  String toSource(BuildContext context) {
    return '''Gap($gap)''';
  }

  @override
  String toString() => 'gap';

  @override
  Widget? widgetLogo() => const Row(children: [
        Icon(Icons.square_outlined),
        Gap(6),
      ]);

  static const String FLUTTER_TYPE = "Gap";
}
