import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';

// void showTreeNodeMenu() {
//   // find snippet bloC
//   SnippetBloC? snippetBloc = CAPIBloC.snippetBeingEdited;
//   if (snippetBloc == null) return;
//
//   STreeNode selectedNode() => snippetBloc.state.selectedNode!;
//   STreeNode? selectedNode.parent() => snippetBloc.state.selectedNode.parent;
//   double h = 80;
//   if (_canReplace(selectedNode())) h += 54;
//   if (_canWrap(selectedNode())) h += 54;
//   if (_canAddSiblng(selectedNode.parent())) h += 108;
//   if (_canAddChld(selectedNode())) h == 54;
//   GlobalKey targetGK = snippetBloc.state.selectedTreeNodeGK!;
//   Widget? w = targetGK.currentWidget;
//   Callout.showOverlay(
//       targetGkF: () => targetGK,
//       boxContentF: (context) => SizedBox(
//             width: 230,
//             height: h,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         snippetBloc.add(SnippetEvent.cutNode(node: snippetBloc.state.selectedNode!));
//                         Useful.afterNextBuildDo(() {
//                           if (FlutterContent().capiBloc.state.jsonClipboard != null) {
//                             Callout.unhide("floating-clipboard");
//                           }
//                         });
//                         Callout.hide("TreeNodeMenu");
//                       },
//                       icon: Icon(
//                         Icons.cut,
//                         color: Colors.orange
//                             .withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25),
//                       ),
//                       tooltip: 'Cut',
//                     ),
//                     // if (snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode)
//                     IconButton(
//                       onPressed: () {
//                         Useful.afterNextBuildDo(() {
//                           snippetBloc.add(SnippetEvent.copyNode(node: snippetBloc.state.selectedNode!));
//                           Useful.afterNextBuildDo(() {
//                             if (FlutterContent().capiBloc.state.jsonClipboard != null) {
//                               Callout.unhide("floating-clipboard");
//                             }
//                           });
//                         });
//                         Callout.hide("TreeNodeMenu");
//                       },
//                       icon: Icon(
//                         Icons.copy,
//                         color: Colors.green
//                             .withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25),
//                       ),
//                       tooltip: 'Copy',
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
//                         if (snippetBloc.state.selectedNode is! RichTextNode) {
//                           snippetBloc.add(const SnippetEvent.deleteNodeTapped());
//                         }
//                         Callout.dismiss("TreeNodeMenu");
//                       },
//                       icon: Icon(Icons.delete,
//                           color: Colors.red
//                               .withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25)),
//                       tooltip: 'Remove',
//                     ),
//                     if (selectedNode() is! SnippetRootNode)
//                       IconButton(
//                         onPressed: () {
//                           // TODO save as new snippet and replace with snippet ref node
//                           showSaveAsCallout(
//                               selectedNode: selectedNode(),
//                               selectionParentNode: selectedNode.parent(),
//                               // targetGKF: () => targetGK,
//                               saveModelF: (s) {
//                                 snippetBloc.add(SnippetEvent.saveNodeAsSnippet(
//                                   node: snippetBloc.state.selectedNode!,
//                                   nodeParent: snippetBloc.state.selectedNode.parent,
//                                   newSnippetName: s,
//                                 ));
//                               });
//                           Callout.dismiss(TREENODE_MENU_CALLOUT);
//                         },
//                         icon: const Icon(
//                           Icons.link,
//                           color: Colors.blue,
//                         ),
//                         tooltip: 'Save a a new Snippet...',
//                       ),
//                   ],
//                 ),
//
//                 // if (selectedNode() is! SnippetRefNode)
//                 //   TextButton.icon(
//                 //     onPressed: () {
//                 //       if (FlutterContent().capiBloc.state.jsonClipboard != null) {
//                 //         // FlutterContent().capiBloc.add(const CAPIEvent.clearClipboard());
//                 //         Useful.afterNextBuildDo(() {
//                 //           snippetBloc.add(SnippetEvent.cutNode(node: selectedNode()));
//                 //         });
//                 //       } else {
//                 //         snippetBloc.add(SnippetEvent.cutNode(node: selectedNode()));
//                 //       }
//                 //       Callout.removeOverlay(TREENODE_MENU_CALLOUT);
//                 //     },
//                 //     icon: const Icon(
//                 //       Icons.cut,
//                 //       color: Colors.orange,
//                 //     ),
//                 //     label: const Text('Cut'),
//                 //   ),
//                 // if (selectedNode() is! SnippetRefNode)
//                 //   TextButton.icon(
//                 //     onPressed: () {
//                 //       if (FlutterContent().capiBloc.state.jsonClipboard != null) {
//                 //         // FlutterContent().capiBloc.add(const CAPIEvent.clearClipboard());
//                 //         Useful.afterNextBuildDo(() {
//                 //           snippetBloc.add(SnippetEvent.copyNode(node: selectedNode()));
//                 //         });
//                 //       } else {
//                 //         snippetBloc.add(SnippetEvent.copyNode(node: selectedNode()));
//                 //       }
//                 //       Callout.removeOverlay(TREENODE_MENU_CALLOUT);
//                 //     },
//                 //     icon: const Icon(
//                 //       Icons.copy,
//                 //       color: Colors.green,
//                 //     ),
//                 //     label: const Text('Copy'),
//                 //   ),
//                 // TextButton.icon(
//                 //   onPressed: () {
//                 //     Callout.removeOverlay(SELECTED_NODE_BORDER_CALLOUT);
//                 //     if (selectedNode.parent() is! RichTextNode) {
//                 //       snippetBloc.add(const SnippetEvent.deleteNodeTapped());
//                 //     }
//                 //     Callout.removeOverlay(TREENODE_MENU_CALLOUT);
//                 //   },
//                 //   icon: const Icon(Icons.delete, color: Colors.red),
//                 //   label: const Text('Remove'),
//                 // ),
//                 // if (widget.entry.node is! SnippetRefNode)
//                 //   TextButton.icon(
//                 //     onPressed: () {
//                 //       showNodeAddersAndPropertiesCallout(
//                 //         context: context,
//                 //         selectedNode: widget.entry.node,
//                 //         selectionParentNode: widget.entry.parent?.node,
//                 //         nodeGK: ()=>nodeGK,
//                 //       );
//                 //       Callout.removeOverlay(TREENODE_MENU_CALLOUT.hashCode);
//                 //     },
//                 //     icon: Icon(Icons.list, color: Colors.purpleAccent),
//                 //     label: Text('Propertes...'),
//                 //   )
//                 if (selectedNode() is SnippetRootNode) _pencilButton((selectedNode() as SnippetRefNode).snippetName),
//                 // TODO show add buttons that were prev at the top of the properties callout
//                 if (_canReplace(selectedNode()))
//                   insertItemMenuAnchor(snippetBloc, selectedNode(), selectedNode.parent(), action: NodeAction.replace, tooltip: 'Replace with...'),
//                 if (_canWrap(selectedNode()))
//                   insertItemMenuAnchor(snippetBloc, selectedNode(), selectedNode.parent(), action: NodeAction.wrapWith, tooltip: 'Wrap with...'),
//                 if (_canAddSiblng(selectedNode.parent()))
//                   insertItemMenuAnchor(snippetBloc, selectedNode(), selectedNode.parent(),
//                       action: NodeAction.addSiblingBefore, tooltip: 'Insert sibling before...'),
//                 if (_canAddSiblng(selectedNode.parent()))
//                   insertItemMenuAnchor(snippetBloc, selectedNode(), selectedNode.parent(),
//                       action: NodeAction.addSiblingAfter, tooltip: 'Insert sibling after...'),
//                 if (_canAddChld(selectedNode()))
//                   insertItemMenuAnchor(snippetBloc, selectedNode(), selectedNode.parent(), action: NodeAction.addChild, tooltip: 'Add child...'),
//               ],
//             ),
//           ),
//       calloutConfig: CalloutConfig(
//         feature: TREENODE_MENU_CALLOUT,
//         suppliedCalloutW: 230,
//         suppliedCalloutH: h,
//         finalSeparation: 40,
//         initialTargetAlignment: Alignment.topRight,
//         initialCalloutAlignment: Alignment.topLeft,
//         color: Colors.white,
//         arrowType: ArrowType.POINTY,
//         //ArrowType.THIN_REVERSED,
//         arrowColor: Colors.purpleAccent,
//         barrier: CalloutBarrier(
//           opacity: 0.5,
//           onTappedF: () async {
//             Callout.dismiss(TREENODE_MENU_CALLOUT);
//           },
//         ),
//       ));
// }

List<Widget> menuAnchorWidgets(
  SnippetBloC snippetBloc,
  STreeNode selectedNode,
  NodeAction action,
) =>
    [
      // menu heading
      Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 40,
        child: Center(
          child: Useful.purpleText(action.displayName),
        ),
      ),
      _pasteMI(selectedNode, action) ?? const Offstage(),

      if (action == NodeAction.wrapWith) ...[
        if (selectedNode is PositionedNode) _menuItemButton("Stack", snippetBloc, selectedNode, StackNode, action),
        if (selectedNode is ExpandedNode || selectedNode is FlexibleNode) ...[
          _menuItemButton("Column", snippetBloc, selectedNode, ColumnNode, action),
          _menuItemButton("Row", snippetBloc, selectedNode, RowNode, action),
        ],
        if (selectedNode.parent is FlexNode) _menuItemButton("Expanded", snippetBloc, selectedNode, ExpandedNode, action),
        if (selectedNode.parent is FlexNode) _menuItemButton("Flexible", snippetBloc, selectedNode, FlexibleNode, action),
        if (selectedNode is WidgetSpanNode) _menuItemButton("TextSpan", snippetBloc, selectedNode, TextSpanNode, action),
        if (selectedNode is TextSpanNode) ...[
          if (selectedNode.parent is! RichTextNode) _menuItemButton("RichText", snippetBloc, selectedNode, TextSpanNode, action),
          _menuItemButton("TextSpan", snippetBloc, selectedNode, TextSpanNode, action),
        ],
        if (selectedNode is FileNode) _menuItemButton("Directory", snippetBloc, selectedNode, DirectoryNode, action),
        if (selectedNode is DirectoryNode) ...[
          _menuItemButton("Directory", snippetBloc, selectedNode, DirectoryNode, action),
          _menuItemButton("File", snippetBloc, selectedNode, FileNode, action),
        ],
        if (selectedNode is PollOptionNode) _menuItemButton("Poll", snippetBloc, selectedNode, PollNode, action),
        if (selectedNode is StepNode) _menuItemButton("Stepper", snippetBloc, selectedNode, StepperNode, action),
      ] else if (action == NodeAction.addChild) ...[
        if (selectedNode is StackNode) _menuItemButton("Positioned", snippetBloc, selectedNode, PositionedNode, action),
        if (selectedNode is FlexNode) _menuItemButton("Expanded", snippetBloc, selectedNode, ExpandedNode, action),
        if (selectedNode is FlexNode) _menuItemButton("Flexible", snippetBloc, selectedNode, FlexibleNode, action),
        if (selectedNode is PollNode) _menuItemButton("PollOption", snippetBloc, selectedNode, PollOptionNode, action),
        if (selectedNode is StepperNode) _menuItemButton("Step", snippetBloc, selectedNode, StepNode, action),
        if (selectedNode is MenuBarNode || selectedNode is SubmenuButtonNode) ...[
          _menuItemButton("MenuItemButton", snippetBloc, selectedNode, MenuItemButtonNode, action),
          _menuItemButton("SubMenuButton", snippetBloc, selectedNode, SubmenuButtonNode, action),
        ],
        if (selectedNode.parent is RichTextNode || selectedNode is TextSpanNode) ...[
          _menuItemButton("TextSpan", snippetBloc, selectedNode, TextSpanNode, action),
          _menuItemButton("WidgetSpan", snippetBloc, selectedNode, WidgetSpanNode, action),
        ],
        if (selectedNode is DirectoryNode) ...[
          _menuItemButton("Directory", snippetBloc, selectedNode, DirectoryNode, action),
          _menuItemButton("File", snippetBloc, selectedNode, FileNode, action),
        ],
      ] else ...[
        if (selectedNode.parent is FlexNode) ...[
          _menuItemButton("Expanded", snippetBloc, selectedNode, ExpandedNode, action),
          _menuItemButton("Flexible", snippetBloc, selectedNode, FlexibleNode, action),
        ],
        if (selectedNode.parent is StackNode) _menuItemButton("Positioned", snippetBloc, selectedNode, PositionedNode, action),
        if (selectedNode is DirectoryNode) ...[
          _menuItemButton("Directory", snippetBloc, selectedNode, DirectoryNode, action),
          _menuItemButton("File", snippetBloc, selectedNode, FileNode, action),
        ],
        if (selectedNode is PollOptionNode) _menuItemButton("Poll Option", snippetBloc, selectedNode, PollOptionNode, action),
        if (selectedNode is StepperNode) _menuItemButton("Step", snippetBloc, selectedNode, StepNode, action),
        if (selectedNode.parent is MenuBarNode || selectedNode.parent is SubmenuButtonNode) ...[
          _menuItemButton("MenuItemButton", snippetBloc, selectedNode, MenuItemButtonNode, action),
          _menuItemButton("SubMenuButton", snippetBloc, selectedNode, SubmenuButtonNode, action),
        ],
      ],
      SubmenuButton(
        menuChildren: [
          _menuItemButton("Align", snippetBloc, selectedNode, AlignNode, action),
          _menuItemButton("Center", snippetBloc, selectedNode, CenterNode, action),
          _menuItemButton("Container", snippetBloc, selectedNode, ContainerNode, action),
          _menuItemButton("Expanded", snippetBloc, selectedNode, ExpandedNode, action),
          // _addChildMenuItemButton("IntrinsicHeight", snippetBloc, selectedNode, IntrinsicHeightNode, action),
          // _addChildMenuItemButton("IntrinsicWidth", snippetBloc, selectedNode, IntrinsicWidthNode, action),
          _menuItemButton("Padding", snippetBloc, selectedNode, PaddingNode, action),
          _menuItemButton("SizedBox", snippetBloc, selectedNode, SizedBoxNode, action),
          _menuItemButton("SingleChildScrollView", snippetBloc, selectedNode, SingleChildScrollViewNode, action),
        ],
        child: Useful.coloredText("layout (single-child)", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          _menuItemButton("Column", snippetBloc, selectedNode, ColumnNode, action),
          _menuItemButton("Row", snippetBloc, selectedNode, RowNode, action),
          _menuItemButton("Stack", snippetBloc, selectedNode, StackNode, action),
          // _addChildMenuItemButton("Table", snippetBloc, selectedNode, TableNode),
        ],
        child: Useful.coloredText("layout (multi-child)", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          _menuItemButton("DefaultTextStyle", snippetBloc, selectedNode, DefaultTextStyleNode, action),
          _menuItemButton("Text", snippetBloc, selectedNode, TextNode, action),
          _menuItemButton("RichText", snippetBloc, selectedNode, RichTextNode, action),
          _menuItemButton("TextSpan", snippetBloc, selectedNode, TextSpanNode, action),
          _menuItemButton("WidgetSpan", snippetBloc, selectedNode, WidgetSpanNode, action),
        ],
        child: Useful.coloredText("text", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          _menuItemButton("MenuItemButton", snippetBloc, selectedNode, MenuItemButtonNode, action),
          _menuItemButton("SubmenuButton", snippetBloc, selectedNode, SubmenuButtonNode, action),
          _menuItemButton("MenuBar", snippetBloc, selectedNode, MenuBarNode, action),
        ],
        child: Useful.coloredText("menu", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          _menuItemButton("AssetImage", snippetBloc, selectedNode, AssetImageNode, action),
          _menuItemButton("Carousel", snippetBloc, selectedNode, CarouselNode, action),
        ],
        child: Useful.coloredText("image", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          if (selectedNode is! PollNode) _menuItemButton("Poll", snippetBloc, selectedNode, PollNode, action),
          if (selectedNode is PollNode) _menuItemButton("PollOption", snippetBloc, selectedNode, PollOptionNode, action),
        ],
        child: Useful.coloredText("poll", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          _menuItemButton("ifrane", snippetBloc, selectedNode, IFrameNode, action),
          _menuItemButton("Google Drive iframe", snippetBloc, selectedNode, GoogleDriveIFrameNode, action),
          _menuItemButton("File", snippetBloc, selectedNode, FileNode, action),
          _menuItemButton("Directory", snippetBloc, selectedNode, DirectoryNode, action),
        ],
        child: Useful.coloredText("file", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          _menuItemButton("ElevatedButton", snippetBloc, selectedNode, ElevatedButton, action),
          _menuItemButton("OutlinedButton", snippetBloc, selectedNode, OutlinedButton, action),
          _menuItemButton("TextButton", snippetBloc, selectedNode, TextButton, action),
          _menuItemButton("FilledButton", snippetBloc, selectedNode, FilledButton, action),
          _menuItemButton("IconButton", snippetBloc, selectedNode, IconButton, action),
        ],
        child: Useful.coloredText("button", fontWeight: FontWeight.normal),
      ),
      _menuItemButton("SplitView", snippetBloc, selectedNode, SplitViewNode, action),
      _menuItemButton("Stepper", snippetBloc, selectedNode, StepperNode, action),
      _menuItemButton("Gap", snippetBloc, selectedNode, GapNode, action),
      _menuItemButton("TargetWrapper", snippetBloc, selectedNode, TargetWrapperNode, action),
      _menuItemButton("TargetGroupWrapper", snippetBloc, selectedNode, TargetGroupWrapperNode, action),
      _menuItemButton("Placeholder", snippetBloc, selectedNode, PlaceholderNode, action),
      _menuItemButton("Scaffold", snippetBloc, selectedNode, ScaffoldNode, action),
      _menuItemButton("TabBar", snippetBloc, selectedNode, TabBarNode, action),
      _menuItemButton("TabBarView", snippetBloc, selectedNode, TabBarViewNode, action),
      _menuItemButton("Youtube", snippetBloc, selectedNode, YTNode, action),
      _addSnippetsSubmenu(snippetBloc, selectedNode, action),
    ];

MenuItemButton _menuItemButton(
  final String label,
  SnippetBloC snippetBloc,
  STreeNode selectedNode,
  Type childType,
  NodeAction action,
) =>
    MenuItemButton(
      onPressed: () {
        if (action == NodeAction.replace) snippetBloc.add(SnippetEvent.replaceSelectionWith(type: childType));
        if (action == NodeAction.addChild) snippetBloc.add(SnippetEvent.appendChild(type: childType));
        if (action == NodeAction.addSiblingBefore) snippetBloc.add(SnippetEvent.addSiblingBefore(type: childType));
        if (action == NodeAction.addSiblingAfter) snippetBloc.add(SnippetEvent.addSiblingAfter(type: childType));
        if (action == NodeAction.wrapWith) snippetBloc.add(SnippetEvent.wrapSelectionWith(type: childType));
        Callout.dismiss(TREENODE_MENU_CALLOUT);
        FC().capiBloc.add(CAPIEvent.forceRefresh());
      },
      child: Useful.coloredText(label, fontWeight: FontWeight.bold),
    );

SubmenuButton _addSnippetsSubmenu(
  SnippetBloC snippetBloc,
  STreeNode selectedNode,
  NodeAction action,
) {
  List<MenuItemButton> snippetMIs = [];
  List<String> snippetNames = FC().snippetsMap.keys.toList()..sort();
  for (String key in snippetNames) {
    snippetMIs.add(
      MenuItemButton(
        onPressed: () {
          if (action == NodeAction.replace) {
            snippetBloc.add(SnippetEvent.replaceSelectionWith(type: SnippetRootNode));
          } else if (action == NodeAction.addSiblingBefore) {
            snippetBloc.add(SnippetEvent.addSiblingBefore(type: SnippetRootNode));
            // removeNodePropertiesCallout();
          } else if (action == NodeAction.addSiblingAfter) {
            snippetBloc.add(SnippetEvent.addSiblingAfter(type: SnippetRootNode));
            // removeNodePropertiesCallout();
          } else if (action == NodeAction.addChild) {
            snippetBloc.add(SnippetEvent.appendChild(type: SnippetRootNode));
            // removeNodePropertiesCallout();
          }
        },
        child: Text(key),
      ),
    );
  }
  return SubmenuButton(menuChildren: snippetMIs, child: const Text('snippet'));
}

Widget insertItemMenuAnchor(SnippetBloC snippetBloc, STreeNode selectedNode,
    {required NodeAction action, String? label, Color? bgColor, String? tooltip, key}) {
  var title = action == NodeAction.replace
      ? 'replace with...'
      : action == NodeAction.wrapWith
          ? 'wrap with...'
          : action == NodeAction.addSiblingBefore
              ? 'insert before...'
              : action == NodeAction.addSiblingAfter
                  ? 'insert after...'
                  : 'append child...';

  List<Widget> menuChildren = menuAnchorWidgets(snippetBloc, selectedNode, action);
  return MenuAnchor(
    menuChildren: menuChildren,
    builder: (BuildContext context, MenuController controller, Widget? child) {
      return label != null
          ? TextButton.icon(
              key: key,
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.add),
              label: Text(title),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(bgColor ?? Colors.white.withOpacity(.9)),
                //padding: MaterialStatePropertyAll(EdgeInsets.zero),
              ),
            )
          : IconButton(
              key: key,
              // hoverColor: bgColor?.withOpacity(.5),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: Icon(
                Icons.add_box,
                color: bgColor,
                size: 40,
              ),
              tooltip: title,
              // style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white.withOpacity(.9),
              // ),
              //   //padding: MaterialStatePropertyAll(EdgeInsets.zero),
              // ),
            );
    },
    onOpen: () async {
      await Future.delayed(const Duration(milliseconds: 300));
    },
  );
}

MenuItemButton? _pasteMI(
  STreeNode selectedNode,
  NodeAction action,
) {
  if (FC().capiBloc.state.jsonClipboard != null && action != NodeAction.wrapWith) {
    return MenuItemButton(
      onPressed: () {
        CAPIBloC bloc = FC().capiBloc;
        SnippetBloC? snippetBloc = FC().snippetBeingEdited;
        switch (action) {
          case NodeAction.replace:
            snippetBloc?.add(const SnippetEvent.pasteReplacement());
            break;
          case NodeAction.addSiblingBefore:
            snippetBloc?.add(const SnippetEvent.pasteSiblingBefore());
            break;
          case NodeAction.addSiblingAfter:
            snippetBloc?.add(const SnippetEvent.pasteSiblingAfter());
            break;
          case NodeAction.addChild:
            snippetBloc?.add(const SnippetEvent.pasteChild());
            break;
          case NodeAction.wrapWith:
            break;
        }
        Callout.dismiss(TREENODE_MENU_CALLOUT);
      },
      child: Useful.coloredText('paste from clipboard', color: Colors.blue),
    );
  }
  return null;
}
