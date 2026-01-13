import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'tr_triangle_painter.dart' show TRTriangle;

enum AnchorWidgetEnum { Triangle, IconButton }

class SnippetMenuAnchor extends StatelessWidget {
  final SnippetBuilderState parentBuilderState;
  final SnippetInfoModel snippetInfo;
  final AnchorWidgetEnum anchorWidget;
  final Color? triangleColor;

  const SnippetMenuAnchor(this.parentBuilderState, {
    required this.anchorWidget,
    required this.snippetInfo,
    this.triangleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isPublishedVersion =
        snippetInfo.publishedVersionId == snippetInfo.editingVersionId;

    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return anchorWidget == AnchorWidgetEnum.Triangle
            ? Tooltip(
            message: isPublishedVersion
                ? 'show Snippet menu\n"${snippetInfo.name}"'
                : 'show Snippet menu\n"${snippetInfo.name}\n*** NOT PUBLISHED ***"',
            child: InkWell(
            onDoubleTap: () {
          snippetInfo
              .currentVersionFromCache()
              ?.tappedToEditSnippetNode();
      },
        onTap: () {
        if (controller.isOpen) {
        controller.close();
        } else {
        controller.open();
        }
        },
        child: CustomPaint(
        size: const Size(40, 40),
        painter: TRTriangle(triangleColor!),
        ),
        ),
        )
            : InkWell(
        onDoubleTap: () {
        snippetInfo
            .currentVersionFromCache()
            ?.tappedToEditSnippetNode();
        },
        onTap: () {
        if (controller.isOpen) {
        controller.close();
        } else {
        controller.open();
        }
        },
        child: Icon(Icons.edit, size: 16, color: Colors.white),
        );
      },
      menuChildren: [
        // SubmenuButton(
        //     menuChildren: revertMIs, child: const Text('revert staging...')),
        Container(
          padding: EdgeInsets.all(10),
          color: snippetInfo.editingVersionId != snippetInfo.publishedVersionId
              ? Colors.red
              : Colors.purpleAccent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fco.coloredText(
                snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                    ? 'This is NOT the published version!'
                    : 'This is the published version.',
                color: Colors.white,
              ),
              fco.coloredText(
                snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
                    ? 'Changes to this snippet are automatically published'
                    : 'Changes are NOT automatically published',
                color: Colors.white,
              ),
            ],
          ),
        ),
        if (!SnippetRootNode.isHotspotCalloutContent(snippetInfo.name))
          _menuItemButtonWithPI(
            onPressed: () {
              final bloc = context.read<CAPIBloC>();
              print('entering node selection mode');
              //
              // enter select widget mode
              //
              bloc.add(
                CAPIEvent.enterNodeSelectionMode(snippetName: snippetInfo.name),
              );
              // fco.afterNextBuildDo(() {
              // setup key handler to exit widget selection mode
              fco.removeKeystrokeHandler('key-handler-exit-Select-Widget-Mode');
              fco.registerKeystrokeHandler(
                'key-handler-exit-Select-Widget-Mode',
                    (KeyEvent event) {
                  if (event.logicalKey == LogicalKeyboardKey.escape) {
                    // if (bloc.showTappableBorderRects()) {
                    bloc.add(CAPIEvent.exitNodeSelectionMode());
                    // }
                  }
                  return false;
                },
              );
              // // build stack of dotted rects to show widget boundaries
              // var rootNode = snippetInfo.currentVersionFromCache();
              // if (rootNode == null) return;
              // parentBuilderState.stackOfNodeBorderRects = _buildStackOfNodeRects(rootNode);
              // // start listening to the scroll controller
              // rootNode.scrollController?.addListener(parentBuilderState.refresh);
              // parentBuilderState.refresh();
              // });
              // // after rendering just this snippet, show its tappable overlays
              // fco.afterNextBuildDo((){
              //   var snippet = snippetInfo.currentVersionFromCache();
              //   context.showSnippetNodeWidgetTappableOverlays();
              // });
            },
            child: Row(
              children: [
                const Text(
                  'enter widget selection mode',
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                Gap(10),
                Icon(Icons.select_all, color: Colors.purple),
              ],
            ),
          ),
        if (SnippetRootNode.isHotspotCalloutContent(snippetInfo.name))
          _menuItemButtonWithPI(
            onPressed: () {
              snippetInfo.currentVersionFromCache()?.tappedToEditSnippetNode();
            },
            child: Row(
              children: [
                const Text(
                  'edit callout content',
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                Gap(10),
                Icon(Icons.edit, color: Colors.purple),
              ],
            ),
          ),
        if (snippetInfo.editingVersionId != snippetInfo.publishedVersionId)
          _menuItemButtonWithPI(
            onPressed: () {
              fco.capiBloc.add(
                CAPIEvent.publishSnippet(
                  snippetName: snippetInfo.name,
                  versionId: snippetInfo.editingVersionId,
                ),
              );
            },
            child: const Text('publish this version'),
          ),
        _menuItemButtonWithPI(
          onPressed: () {
            fco.capiBloc.add(
              CAPIEvent.toggleAutoPublishingOfSnippet(
                snippetName: snippetInfo.name,
              ),
            );
          },
          child: snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
              ? const Tooltip(
            message: "don't auto-push changes.",
            child: Text('stop auto-publishing changes to this snippet'),
          )
              : const Tooltip(
            message: 'auto push changes as they occur',
            child: Text('auto-publish future changes to this snippet'),
          ),
        ),
        _menuItemButtonWithPI(
          onPressed: () async {
            fco.capiBloc.add(
              CAPIEvent.copySnippetJsonToClipboard(
                rootNode: snippetInfo.currentVersionFromCache()!,
              ),
            );
          },
          child: const Text('copy snippet JSON to clipboard'),
        ),
        _menuItemButtonWithPI(
          onPressed: () async {
            fco.capiBloc.add(
              CAPIEvent.replaceSnippetFromJson(
                snippetBeingReplaced: snippetInfo.name,
                snippetJson: null,
              ),
            );
            // VersionsMenuAnchor.rawSnippetJsonDialog(snippetBeingReplaced: snippetInfo.name);
          },
          child: const Text('rebuild snippet from JSON...'),
        ),
        if (!SnippetRootNode.isHotspotCalloutContent(snippetInfo.name))
          _menuItemButtonWithPI(
            onPressed: () async {
              fco.capiBloc.add(
                CAPIEvent.toggleSnippetVisibility(
                  snippetName: snippetInfo.name,
                ),
              );
            },
            child: Text(
              '${snippetInfo.hide ?? false ? 'show' : 'hide'} snippet',
            ),
          ),
        if (!snippetInfo.isFirstVersion())
          _menuItemButtonWithPI(
            onPressed: () async {
              VersionId? prevId = snippetInfo.previousVersionId();
              revertToVersion(prevId, snippetInfo, fco.capiBloc.state);
            },
            child: Text('revert to previous version'),
          ),
        if (!snippetInfo.isLatestVersion())
          _menuItemButtonWithPI(
            onPressed: () async {
              VersionId? nextId = snippetInfo.nextVersionId();
              revertToVersion(nextId, snippetInfo, fco.capiBloc.state);
            },
            child: Text('revert to next version'),
          ),
      ],
    );
  }

  MenuItemButton _menuItemButtonWithPI({
    required Widget child,
    required VoidCallback onPressed,
  }) =>
      MenuItemButton(
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: PointerInterceptor(child: child),
        ),
      );

  // Widget _buildStackOfNodeRects(SnippetRootNode rootNode) {
  //   BuildContext? ctx = rootNode?.child?.nodeWidgetGK?.currentContext;
  //   List<Widget> nodeBorderRects = [];
  //   ctx?.traverseSnippetNodes(nodeBorderRects);
  //   return Stack(children: nodeBorderRects);
  // }

  void revertToVersion(VersionId? versionId,
      SnippetInfoModel snippetInfo,
      CAPIState state,) {
    if (versionId == null) return;
    fco.capiBloc.add(
      CAPIEvent.revertSnippet(
        snippetName: snippetInfo.name,
        versionId: fco.removeNonNumeric(versionId),
      ),
    );
    fco.afterNextBuildDo(() async {
      // current snippet version will now be changed to prevId
      fco.logger.i('reverted to previous version.');
      // SNode.unhighlightSelectedNode();
      // var currPageState = fco.currentPageState;
      // currPageState?.unhideFAB();
      fco.dismiss(HotspotTargetConfigToolbar.CID);
      fco.appInfo.hideClipboard();
      // exitEditModeF();
      // fco.capiBloc
      //     .add(const CAPIEvent.popSnippetEditor());
      // fco.dismiss(snippetName, skipOnDismiss: true);
      final revertedVersion = snippetInfo.currentVersionFromCache();
      if (revertedVersion != null) {
        final newTreeC = SnippetTreeController(
          roots: [revertedVersion],
          childrenProvider: SNode.childrenProvider,
          parentProvider: SNode.parentProvider,
        );

        newTreeC.roots.first.validateTree();
        newTreeC.expand(revertedVersion);
        newTreeC.rebuild();

        fco.snippetBeingEdited!
          ..setRootNode(revertedVersion)
          ..selectedNode = revertedVersion.child
          ..showProperties = false
          ..treeC = newTreeC;

        fco.refreshAll();
      }
      return;
    });
  }
}
