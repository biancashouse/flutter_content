import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/editable_page/versions_menu_anchor.dart';

// import 'package:flutter_content/src/api/snippet_builder/context_extension.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import 'tr_triangle_painter.dart' show TRTriangle;

enum AnchorWidgetEnum { Triangle, IconButton }

class SnippetMenuAnchor extends StatelessWidget {
  final SnippetBuilderState parentBuilderState;
  final SnippetInfoModel snippetInfo;
  final AnchorWidgetEnum anchorWidget;
  final Color? triangleColor;

  const SnippetMenuAnchor(
    this.parentBuilderState, {
    required this.anchorWidget,
    required this.snippetInfo,
    this.triangleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
            return anchorWidget == AnchorWidgetEnum.Triangle
                ? Tooltip(
                    message: 'show Snippet menu\n"${snippetInfo.name}"',
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
              ? Colors.grey
              : Colors.deepOrange,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              fco.coloredText(
                snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                    ? '(this is not the published version)'
                    : '(this is the published version)',
                color: Colors.white,
              ),
              fco.coloredText(
                snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
                    ? '(changes to this snippet are automatically published)'
                    : '(changes are NOT automatically published)',
                color: Colors.white,
              ),
            ],
          ),
        ),
        _menuItemButtonWithPI(
          onPressed: () {
            final bloc = context.read<CAPIBloC>();
            print('entering node selection mode');
            //
            // enter select widget mode
            //
            bloc.add(
              CAPIEvent.enterNodeSelectionMode(
                snippetName: snippetInfo.name,
              ),
            );
            // fco.afterNextBuildDo(() {
            // setup key handler to exit widget selection mode
            fco.removeKeystrokeHandler('key-handler-exit-Select-Widget-Mode');
            fco.registerKeystrokeHandler(
              'key-handler-exit-Select-Widget-Mode',
              (KeyEvent event) {
                if (event.logicalKey == LogicalKeyboardKey.escape) {
                  if (bloc.showTappableBorderRects()) {
                    bloc.add(CAPIEvent.exitNodeSelectionMode());
                  }
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
            VersionsMenuAnchor.rawSnippetJsonDialog();
          },
          child: const Text('rebuild snippet from JSON...'),
        ),
        _menuItemButtonWithPI(
          onPressed: () async {
            fco.capiBloc.add(
              CAPIEvent.toggleSnippetVisibility(snippetName: snippetInfo.name),
            );
          },
          child: Text('${snippetInfo.hide ?? false ? 'show' : 'hide'} snippet'),
        ),
      ],
    );
  }

  MenuItemButton _menuItemButtonWithPI({
    required Widget child,
    required VoidCallback onPressed,
  }) => MenuItemButton(
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
}
