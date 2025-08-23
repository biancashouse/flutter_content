import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/button_style_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/container_style_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/text_style_pnodes.dart';

import 'fancy_tree/tree_controller.dart';

class PNodeWidget extends StatefulWidget {
  final SNode sNode;
  final PNodeTreeController treeC;
  final TreeEntry<PNode> entry;
  final ScrollControllerName? scName;

  const PNodeWidget({
    super.key,
    required this.sNode,
    required this.treeC,
    required this.entry,
    this.scName,
  });

  @override
  State<PNodeWidget> createState() => _PNodeWidgetState();
}

class _PNodeWidgetState extends State<PNodeWidget> {
  CAPIBloC get bloc => fco.capiBloc;

  PNode get propertyNode => widget.entry.node;

  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   if (_propertyNodeIsATextStyleGroup()) {
  //     textStyleName = _realTextStyleName();
  //     if (textStyleName != null && textStyleName != '...') {
  //       searchController = StandardSearchController();
  //       searchController!.text = textStyleName!;
  //     } else {
  //       searchController.text = '';
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // fco.logger.i("PTreeNodeWidget.build");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (propertyNode is TextStyleSearchPNode || propertyNode is TextStyleSavePNode
            || propertyNode is ButtonStyleSearchPNode || propertyNode is ButtonStyleSavePNode
            || propertyNode is ContainerStyleSearchPNode || propertyNode is ContainerStyleSavePNode
        )
          Container(
            margin: const EdgeInsets.all(6),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   border: Border.all(
            //       color: Colors.purple, width: widget.entry.isExpanded ? 1 : 2),
            //   borderRadius: const BorderRadius.all(Radius.circular(4)),
            // ),
            alignment: Alignment.centerLeft,
            child: propertyNode.children != null /*Group*/
                ? _propertyGroupLabel()
                : _propertyButton(context),
          ),
        if (propertyNode is! TextStyleSearchPNode && propertyNode is! TextStyleSavePNode
            && propertyNode is! ButtonStyleSearchPNode && propertyNode is! ButtonStyleSavePNode
            && propertyNode is! ContainerStyleSearchPNode && propertyNode is! ContainerStyleSavePNode
        )
          Container(
            margin: const EdgeInsets.all(6),
            padding: EdgeInsets.symmetric(horizontal: propertyNode is FYIPNode
                ? 0:8, vertical: 0),
            decoration: BoxDecoration(
              color: propertyNode.children != null /*Group*/
                  ? Colors.white
                  : propertyNode is FYIPNode ? Colors.black : Colors.purpleAccent,
              border: Border.all(
                  color: Colors.purple, width: widget.entry.isExpanded ? 1 : 2),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            alignment: Alignment.centerLeft,
            child: propertyNode.children != null /*Group*/
                ? _propertyGroupLabel()
                : _propertyButton(context),
          ),
        if (widget.entry.hasChildren)
          Builder(builder: (context) {
            return ExpandIcon(
              // key: GlobalObjectKey(propertyNode.hashCode),
              color: Colors.purple,
              isExpanded: widget.entry.isExpanded,
              padding: EdgeInsets.zero,
              onPressed: (_) {
                if (widget.entry.isExpanded) {
                  widget.treeC.toggleExpansion(propertyNode);
                  propertyNode.expanded = false;
                } else {
                  widget.treeC.expand(propertyNode);
                  propertyNode.expanded = true;
                }
                widget.treeC.rebuild();
              },
            );
          }),
      ],
    );
  }

  // special case if group happens to be a TextStyle group of properties, provide a search
  Widget _propertyGroupLabel() {
    return SizedBox(
      // width: 200,
      height: 20,
      child: InkWell(
        onTap: () {
          // fco.logger.i('propertyNode.key: ${propertyNode.key.toString()}');
          // fco.logger.i('expanded nodes: ${treeC.expandedNodes.toString()}');
          if (widget.entry.isExpanded) {
            widget.treeC.toggleExpansion(propertyNode);
            propertyNode.expanded = false;
          } else {
            // instead of expanding current node, do a cascading expand
            widget.treeC.expandCascading([propertyNode]);
            propertyNode.expanded = true;
            // fco.logger
            //     .i('expanded nodes: ${widget.treeC.expandedNodes.toString()}');
          }
          widget.treeC.rebuild();
        },
        onDoubleTap: () {
          setState(() {
            // _updateProperty(null);
            widget.sNode.refreshWithUpdate(context,() {
              widget.sNode.setTextStyleProperties(TextStyleProperties());
              widget.sNode.setButtonStyleProperties(ButtonStyleProperties(tsPropGroup: TextStyleProperties()));
              widget.sNode.forcePropertyTreeRefresh(context);
            });
          });
        },
        child: fco.coloredText(propertyNode.propertyLabel(), color: Colors.purple),
        // // if textStyleName is not null, means display a button to the right of the group label
        // child: !_propertyNodeIsATextStyleGroup()
        //     ? fco.coloredText(propertyNode.name, color: Colors.purple)
        //     // texstyle property group node
        //     : Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Tooltip(
        //               message:
        //                   'tap to show/hide properties\ndouble-tap to clear',
        //               child: fco.coloredText(propertyNode.name,
        //                   color: Colors.purple)),
        //           Gap(10),
        //           Expanded(
        //             child: Container(
        //               width: 100,
        //               height: 32,
        //               color: Colors.white,
        //               child: TextStyleNameSearchAnchor(
        //                 searchStringTEC: TextEditingController(
        //                     text: fco.findTextStyleName(
        //                         widget.sNode.textStyleProperties()!)),
        //                 suggestions: fco.namedTextStyles.keys.toList(),
        //                 onSelectionF: (selectedSuggestion) {
        //                   // _updateProperty(selectedSuggestion);
        //                   widget.sNode.refreshWithUpdate(context,() {
        //                     var tsProps = fco.namedTextStyles[selectedSuggestion];
        //                     widget.sNode.setTextStyleProperties(tsProps?.clone() ?? TextStyleProperties());
        //                   });
        //                 },
        //                 debounceTimer: DebounceTimer(delayMs: 300),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
      ),
    );
  }

  // update aware of possible text style group
  // void _updateProperty(String? newName) {
  //   // revert to original value
  //   widget.sNode.refreshWithUpdate(context,() {
  //     if (_propertyNodeIsATextStyleGroup()) {
  //       widget.node.setT
  //       if (widget.sNode is TextNode) {
  //         TextNode node = widget.sNode as TextNode;
  //         node.textStyleName = newName;
  //         if (newName == null) node.textStyleProperties = null;
  //       } else if (widget.sNode is TextSpanNode) {
  //         TextSpanNode node = widget.sNode as TextSpanNode;
  //         node.textStyleName = newName;
  //         if (newName == null) node.textStyleProperties = null;
  //       } else if (widget.sNode is TabBarNode) {
  //         TabBarNode node = widget.sNode as TabBarNode;
  //         node.labelTextStyleName = newName;
  //         if (newName == null) node.labelTextStyleProperties = null;
  //       } else if (widget.sNode is ChipNode) {
  //         ChipNode node = widget.sNode as ChipNode;
  //         node.labelTextStyleName = newName;
  //         if (newName == null) node.labelTextStyleProperties = null;
  //       } else if (widget.sNode is DefaultTextStyleNode) {
  //         DefaultTextStyleNode node = widget.sNode as DefaultTextStyleNode;
  //         node.textStyleName = newName;
  //         if (newName == null) node.textStyleProperties = null;
  //       }
  //     }
  //   });
  // }

  Widget _propertyButton(context) {
    return GestureDetector(
      onTap: () {
        fco.logger.i('_propertyButton.tap');
      },
      onDoubleTap: () {
        fco.logger.i('_propertyButton.double-tap');
        // revert to original value
        propertyNode.revertToOriginalValue();
        widget.treeC.rebuild();
      },
      child: propertyNode.toPropertyNodeContents(context),
    );
  }

// bool _propertyNodeIsATextStyleGroup() =>
//     propertyNode is TextStyleWithoutColorPNode ||
//     propertyNode is TextStylePNode;

// null means not a text style group
// TextStyleName? _realTextStyleName() {
//   String? textStyleName;
//   if (_propertyNodeIsATextStyleGroup()) {
//     if (widget.sNode is TextNode) {
//       TextNode node = widget.sNode as TextNode;
//       textStyleName = node.textStyleName;
//     } else if (widget.sNode is TextSpanNode) {
//       TextSpanNode node = widget.sNode as TextSpanNode;
//       textStyleName = node.textStyleName;
//     } else if (widget.sNode is TabBarNode) {
//       TabBarNode node = widget.sNode as TabBarNode;
//       textStyleName = node.labelTextStyleName;
//     } else if (widget.sNode is DefaultTextStyleNode) {
//       DefaultTextStyleNode node = widget.sNode as DefaultTextStyleNode;
//       textStyleName = node.textStyleName;
//     }
//     textStyleName ??= '';
//   }
//   return textStyleName;
// }
}

// class MySearchController extends SearchController {
//   @override
//   void openView() {
//     // TODO: implement openView
//     super.openView();
//   }
//
//   @override
//   void closeView(String? selectedText) {
//     // TODO: implement closeView
//     super.closeView(selectedText);
//   }
// }
