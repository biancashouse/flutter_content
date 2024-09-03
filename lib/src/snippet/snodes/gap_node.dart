import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gap/gap.dart';

part 'gap_node.mapper.dart';

@MappableClass()
class GapNode extends CL with GapNodeMappable {
  double gap;

  GapNode({
    required this.gap,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        DecimalPropertyValueNode(
          snode: this,
          name: 'gap',
          decimalValue: gap,
          onDoubleChange: (newValue) => refreshWithUpdate(() => gap = newValue ?? 0),
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
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);  // propagating parents down from root
    possiblyHighlightSelectedNode();
    return Gap(
      key: createNodeGK(), gap,
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
  Widget? logoSrc() => const Row(children: [
        Icon(Icons.square_outlined),
        Gap(6),
      ]);

  static const String FLUTTER_TYPE = "Gap";
}
