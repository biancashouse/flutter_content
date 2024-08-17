import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

class PTreeNodeWidget extends StatelessWidget {
  // final STreeNode sNode;
  final PTreeNodeTreeController treeC;
  final TreeEntry<PTreeNode> entry;
  final String? scrollControllerName;

  const PTreeNodeWidget({
    super.key,
    // required this.sNode,
    required this.treeC,
    required this.entry,
    this.scrollControllerName,
  });

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

  PTreeNode get propertyNode => entry.node;

  @override
  Widget build(BuildContext context) {
    // fco.logi("PTreeNodeWidget.build");
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
          // fco.logi('propertyNode.key: ${propertyNode.key.toString()}');
          // fco.logi('expanded nodes: ${treeC.expandedNodes.toString()}');
          if (entry.isExpanded) {
            treeC.toggleExpansion(propertyNode);
            treeC.rebuild();
          } else {
            // instead of expanding current node, do a cascading expand
            treeC.expandCascading([propertyNode]);
            fco.logi('expanded nodes: ${treeC.expandedNodes.toString()}');
          }
        },
        onDoubleTap: () {
          // revert to original value
          propertyNode.revertToOriginalValue();
          treeC.rebuild();
        },
        child: fco.coloredText(propertyNode.name, color: Colors.purple),
      );

  Widget _propertyButton(context) {
    return GestureDetector(
      onTap: () {
        fco.logi('_propertyButton.tap');
      },
      onDoubleTap: () {
        fco.logi('_propertyButton.double-tap');
        // revert to original value
        propertyNode.revertToOriginalValue();
        treeC.rebuild();
      },
      child: propertyNode.toPropertyNodeContents(context),
    );
  }
}
