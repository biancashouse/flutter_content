import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/snippet_tree_view.dart';

class SnippetTreePane extends StatelessWidget {
  final SnippetInfoModel snippetInfo;
  final ScrollControllerName? scName;

  const SnippetTreePane(this.snippetInfo, this.scName, {super.key});

  @override
  Widget build(BuildContext context) {
    // var sbe = fco.snippetBeingEdited;
    // var rootNode = sbe?.getRootNode();

    return Material(
      color: Colors.purple.shade200,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InteractiveViewer(
          transformationController: fco.snippetTreeTC,
          // trackpadScrollCausesScale: true,
          alignment: Alignment.topLeft,
          constrained: false,
          // onInteractionStart: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
          // onInteractionEnd: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
          child: SizedBox(
            width: 700,
            height: 1200,
            child: Builder(
              builder: (context) {
                // final STreeNode? selectedNode = selectedNode;
                // bool canShowNavigateUpBtn = true;
                // if (fco.snippetBeingEdited?.treeC.roots.first
                //     .getParent() == null) canShowNavigateUpBtn = false;
                // if (fco.snippetBeingEdited?.treeC.roots.first.getParent() is SnippetRootNode &&
                //     fco.snippetBeingEdited?.treeC.roots.first.getParent()?.getParent() ==
                //         null) {
                //   canShowNavigateUpBtn = false;
                // }
                // if (fco.snippetBeingEdited?.getRootNode() !=
                //     fco.snippetBeingEdited?.treeC.roots.first &&
                //     fco.snippetBeingEdited?.treeC.roots.first
                //     is! ScaffoldNode) {
                //   return Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       if (canShowNavigateUpBtn) navigateUpTreeButton(),
                //       Expanded(
                //           child: SnippetTreeView(
                //             scName: scName,
                //           )),
                //     ],
                //   );
                // }
                // fco.logger.i('SnippetTreeView...');
                return SnippetTreeView(scName: scName);
              },
            ),
          ),
        ),
      ),
    );

    // tbd
    if (fco.snippetBeingEdited?.getRootNode().child == null) {
      List<Widget> menuChildren = fco.snippetBeingEdited?.getRootNode().menuAnchorWidgets(NodeAction.addChild, scName) ?? [];
      return MenuAnchor(
        alignmentOffset: const Offset(80, 0),
        menuChildren: menuChildren,
        builder: (BuildContext context, MenuController controller, Widget? child) {
          return Center(
            child: TextButton.icon(
              key: key,
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('add root widget'),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white.withValues(alpha: .9)),
                //padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
            ),
          );
        },
      );
    } else {
      return Material(
        color: Colors.purple.shade200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            constrained: false,
            // onInteractionStart: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
            // onInteractionEnd: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
            child: SizedBox(
              width: 700,
              height: 1200,
              child: Builder(
                builder: (context) {
                  // final STreeNode? selectedNode = selectedNode;
                  bool canShowNavigateUpBtn = true;
                  if (fco.snippetBeingEdited?.treeC.roots.first.getParent() == null) {
                    canShowNavigateUpBtn = false;
                  }
                  if (fco.snippetBeingEdited?.treeC.roots.first.getParent() is SnippetRootNode &&
                      fco.snippetBeingEdited?.treeC.roots.first.getParent()?.getParent() == null) {
                    canShowNavigateUpBtn = false;
                  }
                  if (fco.snippetBeingEdited?.getRootNode() != fco.snippetBeingEdited?.treeC.roots.first &&
                      fco.snippetBeingEdited?.treeC.roots.first is! ScaffoldNode) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // if (canShowNavigateUpBtn) navigateUpTreeButton(),
                        Expanded(child: SnippetTreeView(scName: scName)),
                      ],
                    );
                  }
                  // fco.logger.i('SnippetTreeView...');
                  return SnippetTreeView(scName: scName);
                },
              ),
            ),
          ),
        ),
      );
    }
  }

  // Widget navigateUpTreeButton() => FilledButton(
  //       onPressed: () {
  //         SnippetTreePane.navigateUpTree(scName);
  //         return;
  //
  //         // TBD ----------------
  //         // if (parent != null) {
  //         //   snippetBloc.add(const CAPIEvent.clearNodeSelection());
  //         //   fco.afterNextBuildDo(() {
  //         //     snippetBloc.add(CAPIEvent.selectNode(
  //         //       node: parent!,
  //         //       // imageTC: tc,
  //         //       // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
  //         //       selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
  //         //     ));
  //         //     fco.afterNextBuildDo(() {
  //         //       parent?.showNodeWidgetOverlay();
  //         //       // create selected node's properties tree
  //         //       // final List<PTreeNode> propertyNodes =
  //         //       //     parent.properties(context);
  //         //       // // get a new treeController only when snippet selected
  //         //       // parent.pTreeC ??= PTreeNodeTreeController(
  //         //       //   roots: propertyNodes,
  //         //       //   childrenProvider: Node.propertyTreeChildrenProvider,
  //         //       // );
  //         //       snippetBloc.treeC.expand(parent!);
  //         //       // parent.propertiesPaneSC ??= ScrollController()
  //         //       //   ..addListener(() {
  //         //       //     parent!.propertiesPaneScrollPos =
  //         //       //         parent.propertiesPaneSC?.offset ?? 0.0;
  //         //       //   });
  //         //     });
  //         //   });
  //         // }
  //         // fco.dismiss(snippetBloc.snippetName);
  //         // if (parent != null) {
  //         //   fco.afterNextBuildDo(() {
  //         //     FlutterContentAppState.pushThenShowNamedSnippetWithNodeSelected(
  //         //         snippetBloc.snippetName, parent!, selectedNode);
  //         //   });
  //         // }
  //       },
  //       style: const ButtonStyle().copyWith(
  //         backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
  //         shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
  //         padding: const WidgetStatePropertyAll(EdgeInsets.zero),
  //         // maximumSize: WidgetStatePropertyAll(Size(40, 36)),
  //         // minimumSize: WidgetStatePropertyAll(Size(40, 36)),
  //       ),
  //       child: fco.coloredText("...", color: Colors.white, fontSize: 24),
  //     );

  // static void navigateUpTree(ScrollControllerName? scName) {
  //   // change tree root to parent
  //   SNode treeRootNode =
  //       fco.snippetBeingEdited!.treeC.roots.first;
  //   SNode? parent = treeRootNode.getParent() as SNode?;
  //   if (parent is GenericSingleChildNode) {
  //     parent = parent.getParent() as SNode?;
  //   } else if (parent is SnippetRootNode) {
  //     parent = parent.getParent() as SNode?;
  //   }
  //
  //   if (parent != null) {
  //     fco.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
  //     SNode.pushThenShowNamedSnippetWithNodeSelected(
  //       parent.rootNodeOfSnippet()!.name,
  //       parent,
  //       // parent,
  //       scName: scName,
  //     );
  //   }
  // }
}
