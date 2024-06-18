import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

class PTreeNodeWidget extends StatelessWidget {
  // final STreeNode sNode;
  final PTreeNodeTreeController treeC;
  final TreeEntry<PTreeNode> entry;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const PTreeNodeWidget({
    super.key,
    // required this.sNode,
    required this.treeC,
    required this.entry,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
  });

  CAPIBloC get bloc => MaterialSPA.capiBloc;

  PTreeNode get propertyNode => entry.node;

  @override
  Widget build(BuildContext context) {
    // debugPrint("PTreeNodeWidget.build");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          decoration: BoxDecoration(
            color: propertyNode is PropertyGroup ? Colors.white : Colors.purpleAccent,
            border: Border.all(color: Colors.purple, width: entry.isExpanded ? 1 : 2),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          alignment: Alignment.centerLeft,
          child: propertyNode is PropertyGroup ? _propertyGroupLabel() : _propertyButton(context),
        ),
        if (entry.hasChildren)
          Builder(builder: (context) {
            return ExpandIcon(
              key: GlobalObjectKey(propertyNode),
              color: Colors.purple,
              isExpanded: entry.isExpanded,
              padding: EdgeInsets.zero,
              onPressed: (_) {
                if (entry.isExpanded) {
                  treeC.toggleExpansion(propertyNode);
                } else {
                  treeC.expandCascading([propertyNode]);
                }
              },
            );
          }),
      ],
    );
  }

  Widget _propertyGroupLabel() => InkWell(
        onTap: () {
          // debugPrint('propertyNode.key: ${propertyNode.key.toString()}');
          // debugPrint('expanded nodes: ${treeC.expandedNodes.toString()}');
          if (entry.isExpanded) {
            treeC.toggleExpansion(propertyNode);
            treeC.rebuild();
          } else {
            // instead of expanding current node, do a cascading expand
            treeC.expandCascading([propertyNode]);
            debugPrint('expanded nodes: ${treeC.expandedNodes.toString()}');
          }
        },
        onDoubleTap: () {
          // revert to original value
          propertyNode.revertToOriginalValue();
          treeC.rebuild();
        },
        child: FContent().coloredText(propertyNode.name, color: Colors.purple),
      );

  Widget _propertyButton(context) {
    return GestureDetector(
      onTap: () {
        debugPrint('_propertyButton.tap');
      },
      onDoubleTap: () {
        debugPrint('_propertyButton.double-tap');
        // revert to original value
        propertyNode.revertToOriginalValue();
        treeC.rebuild();
      },
      child: propertyNode.toPropertyNodeContents(context),
    );
  }
}
