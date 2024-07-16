import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_split_view/multi_split_view.dart';

class FSFoldersAndImagePicker extends HookWidget {
  final ValueChanged<String?> onChangeF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const FSFoldersAndImagePicker({
    required this.onChangeF,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    super.key,
  });

  // static SnippetNode nearestRoot(TreeEntry<Node> entry) {
  //   TreeEntry<Node> _entry = entry;
  //   while (_entry.node is! SnippetNode) {
  //     _entry = _entry.parent!;
  //   }
  //   return _entry.node as SnippetNode;
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('folder+images build');
    // final msvC = useState<MultiSplitViewController>(
    //     MultiSplitViewController(areas: [Area(flex: 7)]));
    final selectedFolderRef = useState<Reference>(fco.rootFSFolderNode!.ref);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust radius as needed
      child: Scaffold(
        backgroundColor: Colors.purpleAccent.shade100,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: fco.coloredText('Firebase Storage Image Picker', fontSize: 16.0, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: MultiSplitViewTheme(
            data: MultiSplitViewThemeData(dividerThickness: 24),
            child: MultiSplitView(
              axis: Axis.horizontal,
              // controller: msvC.value,
              // onWeightChange: () => setState(() {}),
              dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) {
                return Container(
                  color: dragging ? Colors.purpleAccent[200] : Colors.purpleAccent[100],
                  child: Icon(
                    Icons.drag_indicator,
                    color: highlighted ? Colors.blueAccent : Colors.white,
                  ),
                );
              },
              initialAreas: [
                Area(
                  builder: (ctx, area) {
                    return fsFolderPane(
                      selectedFolderRef.value,
                      (newRef) => selectedFolderRef.value = newRef,
                    );
                  },
                ),
                Area(
                  builder: (ctx, area) {
                    return FolderImagesGridView(
                      onChangeF: onChangeF,
                      selectedFolderRef: selectedFolderRef.value,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fsFolderPane(Reference selectedFolderRef, ValueChanged<Reference> onSelectionF) {
    if (fco.rootFSFolderNode == null) {
      return const Icon(
        Icons.warning,
        color: Colors.red,
      );
    }

    FSFolderNode rootNode = fco.rootFSFolderNode!;
    TreeController<FSFolderNode> treeC = TreeController<FSFolderNode>(
      roots: [rootNode],
      childrenProvider: (FSFolderNode node) => node.children,
      parentProvider: (FSFolderNode node) => node.getParent() as FSFolderNode?,
    );
    treeC.expandCascading([rootNode]);
    // setParent(parentNode);
    return TreeView<FSFolderNode>(
        // physics: const NeverScrollableScrollPhysics(),
        treeController: treeC,
        shrinkWrap: true,
        nodeBuilder: (BuildContext context, TreeEntry<FSFolderNode> entry) {
          return InkWell(
            onTap: () => treeC.toggleExpansion(entry.node),
            child: TreeIndentation(
              entry: entry,
              guide: const IndentGuide.connectingLines(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      entry.isExpanded ? Icons.folder_open : Icons.folder,
                      color: Colors.white,
                      size: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        //backgroundColor: Colors.grey, // Background color
                        textStyle: const TextStyle(fontSize: 14), // Text style
                        shape: const ContinuousRectangleBorder(),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        onSelectionF.call(entry.node.ref);
                      },
                      child: fco.coloredText(entry.node.ref.name.isEmpty ? '/' : entry.node.ref.name, color: Colors.white),
                    ),
                    if (entry.hasChildren)
                      ExpandIcon(
                        key: GlobalObjectKey(entry.node),
                        isExpanded: treeC.getExpansionState(entry.node), //entry.isExpanded,
                        padding: EdgeInsets.zero,
                        onPressed: (_) {
                          if (treeC.getExpansionState(entry.node)) {
                            treeC.toggleExpansion(entry.node);
                          } else {
                            // instead of expanding current node, do a cascading expand
                            treeC.expand(entry.node);
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class FolderImagesGridView extends StatelessWidget {
  const FolderImagesGridView({
    super.key,
    required this.onChangeF,
    required this.selectedFolderRef,
  });

  final ValueChanged<String?> onChangeF;
  final Reference selectedFolderRef;

  @override
  Widget build(BuildContext context) {
    debugPrint('fsFoldersImagesPane(${selectedFolderRef.name})');

    return Container(
      color: Colors.purple,
      child: StorageGridView(
        key: UniqueKey(),
        loadingController: PaginatedLoadingController(ref: selectedFolderRef),
        // ref: selectedFolderRef,
        // loadingBuilder: (context) {
        //   return const Center(
        //     child: Text('Loading...'),
        //   );
        // },
        itemBuilder: (context, ref) {
          print('item: ref:${ref.fullPath}');
          return InkWell(
            onTap: () {
              onChangeF(ref.fullPath);
              Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StorageImage(ref: ref),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class StorageGridView extends StatelessWidget {
//   /// The [Reference] to list items from.
//   /// If not provided, a [loadingController] must be created and passed.
//   final Reference? ref;
//
//   final PaginatedLoadingController? loadingController;
//
//   /// The number of items to load per page.
//   /// Defaults to 50.
//   final int pageSize;
//
//   /// A builder that is called when an error occurs during page loading.
//   final Widget Function(
//       BuildContext context,
//       Object? error,
//       PaginatedLoadingController controller,
//       )? errorBuilder;
//
//   /// A builder that is called for each item in the list.
//   final Widget Function(BuildContext context, Reference ref) itemBuilder;
//
//   /// See [SliverGridDelegate].
//   final SliverGridDelegate gridDelegate;
//
//   const StorageGridView({
//     super.key,
//     this.ref,
//     this.loadingController,
//     this.pageSize = 50,
//     this.errorBuilder,
//     this.gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 3,
//     ),
//     required this.itemBuilder,
//   }) : assert(
//   ref != null || loadingController != null,
//   'ref or loadingController must be provided',
//   );
//
//   PaginatedLoadingController get ctrl => loadingController ??
//       PaginatedLoadingController(
//         ref: ref!,
//         pageSize: pageSize,
//       );
//
//   Widget gridBuilder(BuildContext context, List<Reference> items) {
//     return GridView.builder(
//       gridDelegate: gridDelegate,
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         if (ctrl.shouldLoadNextPage(index)) {
//           ctrl.load();
//         }
//
//         return itemBuilder(context, items[index]);
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: ctrl,
//       builder: (context, _) {
//         return switch (ctrl.state) {
//           InitialPageLoading() => const Center(
//             child: CircularProgressIndicator(
//               strokeWidth: 4,
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
//             ),
//           ),
//           PageLoadError(
//           error: final error,
//           items: final items,
//           ) => errorBuilder != null
//               ? errorBuilder!(context, error, ctrl)
//               : gridBuilder(context, items ?? []),
//           PageLoading(items: final items) => gridBuilder(context, items),
//           PageLoadComplete(items: final items) => gridBuilder(context, items),
//         };
//       },
//     );
//   }
// }
