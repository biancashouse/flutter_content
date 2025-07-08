import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';
import 'package:multi_split_view/multi_split_view.dart';

import 'fs_file_upload_btn.dart';

class FSFoldersAndImagePicker extends StatefulWidget {
  final ValueChanged<String?> onSelectedFileF;

  const FSFoldersAndImagePicker({required this.onSelectedFileF, super.key});

  @override
  State<FSFoldersAndImagePicker> createState() => FSFoldersAndImagePickerState();
}

class FSFoldersAndImagePickerState extends State<FSFoldersAndImagePicker> {
  late Future<void> fConfigureStorageUIForFolder;
  late FSFolderNode folderNode;

  Future<void> _fbStorageTreePossiblyCreate() async {
    try {
      await FirebaseUIStorage.configure(
        FirebaseUIStorageConfiguration(
          storage: FirebaseStorage.instance,
          uploadRoot: folderNode.ref,
          namingPolicy: const UuidFileUploadNamingPolicy(),
          // optional, will generate a UUID for each uploaded file
        ),
      );
    } catch (e) {
      fco.logger.e('', error: e);
    }
  }

  @override
  void initState() {
    super.initState();
    folderNode = fco.fsTreeC.roots.first; //fs root
    fConfigureStorageUIForFolder = _fbStorageTreePossiblyCreate();
  }

  void refresh(Reference selectedFileRef) {
    setState(() {
      fco.fsTreeC.rebuild();
      fco.refresh('fs-browser');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload complete: ${selectedFileRef.fullPath}')));
    });
  }

  @override
  Widget build(BuildContext context) {
    fco.logger.i('folder+images build');

    return FutureBuilder<void>(
      future: fConfigureStorageUIForFolder,
      builder: (ctx, snap) {
        if (snap.connectionState != ConnectionState.done && !snap.hasData) {
          return const CircularProgressIndicator();
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            // Adjust radius as needed
            child: Scaffold(
              backgroundColor: Colors.purpleAccent.shade100,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: fco.coloredText('Firebase Storage Image Picker (${fco.folderPathRef('/').bucket})', fontSize: 16.0, color: Colors.white),
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
                        child: Icon(Icons.drag_indicator, color: highlighted ? Colors.blueAccent : Colors.white),
                      );
                    },
                    initialAreas: [
                      Area(
                        builder: (ctx, area) {
                          return fsFolderPane(
                            onSelectionF: (FSFolderNode selectedFolder) async {
                              setState(() {
                                folderNode = selectedFolder;
                              });
                            },
                          );
                        },
                      ),
                      Area(
                        builder: (ctx, area) {
                          return FolderImagesGridView(storage: FirebaseStorage.instance, folderNode: folderNode, onSelectedFileF: widget.onSelectedFileF, parentState: this,);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget fsFolderPane({required ValueChanged<FSFolderNode> onSelectionF}) {
    return TreeView<FSFolderNode>(
      // physics: const NeverScrollableScrollPhysics(),
      treeController: fco.fsTreeC,
      shrinkWrap: true,
      nodeBuilder: (BuildContext context, TreeEntry<FSFolderNode> entry) {
        return InkWell(
          onTap: () {
            if (entry.hasChildren) fco.fsTreeC.toggleExpansion(entry.node);
          },
          child: TreeIndentation(
            entry: entry,
            guide: const IndentGuide.connectingLines(color: Colors.white),
            child: Tooltip(
              message: entry.node.ref.fullPath,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    onSelectionF.call(entry.node);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(entry.isExpanded ? Icons.folder_open : Icons.folder, color: Colors.white, size: 30),
                      fco.coloredText(
                        entry.node.ref.name.isEmpty ? '/' : entry.node.ref.name,
                        color: entry.node == folderNode ? Colors.blue : Colors.white,
                      ),
                      // if (entry.hasChildren)
                      //   ExpandIcon(
                      //     color: Colors.red,
                      //     // key: GlobalObjectKey(entry.node.ref),
                      //     isExpanded: treeC.getExpansionState(entry.node),
                      //     //entry.isExpanded,
                      //     padding: EdgeInsets.zero,
                      //     onPressed: (_) {
                      //       if (treeC.getExpansionState(entry.node)) {
                      //         treeC.toggleExpansion(entry.node);
                      //       } else {
                      //         // instead of expanding current node, do a cascading expand
                      //         treeC.expand(entry.node);
                      //       }
                      //     },
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FolderImagesGridView extends StatelessWidget {
  final FirebaseStorage storage;
  final FSFolderNode folderNode;
  final FSFoldersAndImagePickerState parentState;
  final ValueChanged<String?> onSelectedFileF;

  const FolderImagesGridView({required this.storage, required this.folderNode, super.key, required this.onSelectedFileF, required this.parentState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 600,
      child: ListView(
        children: [
          TextButton.icon(
            onPressed: () async {
              final Uri url = Uri.parse('https://console.cloud.google.com/storage/browser/bh-apps.appspot.com/${fco.appName}?project=bh-apps');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            label: const Icon(Icons.link),
            icon: const Text(' Cloud Storage Console'),
          ),
          Tooltip(
            message: 'to folder: ${folderNode.ref.fullPath}',
            child: FSFileUploadButton(
              storage: storage,
              uploadFolderNode: folderNode,
              extensions: const ['jpg', 'png', 'gif'],
              mimeTypes: const ['image/jpeg', 'image/png', 'image/gif'],
              onError: (e, s) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()))),
              onUploadComplete: (ref) {
                parentState.refresh(ref);
              },
              variant: ButtonVariant.text,
            ),
          ),
          Container(
            color: Colors.purple,
            width: 300,
            height: 400,
            child: StorageGridView(
              key: UniqueKey(),
              loadingController: PaginatedLoadingController(ref: folderNode.ref),
              ref: folderNode.ref,
              // loadingBuilder: (context) {
              //   return const Center(
              //     child: Text('Loading...'),
              //   );
              // },
              itemBuilder: (context, ref) {
                // fco.logger.d('item: ref:${ref.fullPath}');
                return Tooltip(
                  message: ref.fullPath,
                  child: InkWell(
                    onTap: () {
                      onSelectedFileF(ref.fullPath);
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StorageImage(ref: ref),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
