import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class SnippetTriangleMenuAnchor extends StatelessWidget {
  final SnippetInfoModel snippetInfo;

  const SnippetTriangleMenuAnchor({required this.snippetInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: Icon(Icons.edit, color: Colors.white),
          iconSize: 16,
          padding: EdgeInsets.zero,
          tooltip: 'show Snippet menu',
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
            children: [
              fco.coloredText(
                  snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                      ? '(this is not the published version)'
                      : '(this is the published version)',
                  color: Colors.white),
              fco.coloredText(
                  snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
                      ? '(changes to this snippet are automatically published)'
                      : '(changes are NOT automatically published)',
                  color: Colors.white),
            ],
          ),
        ),
        MenuItemButton(
          onPressed: () {
            fco.capiBloc.add(CAPIEvent.enterSelectWidgetMode(snippetName: snippetInfo.name));
          },
          child: Row(
            children: [
              const Text('enter widget selection mode', style: TextStyle(color: Colors.purple, fontSize: 16)),
              Gap(10),
              Icon(Icons.select_all, color: Colors.purple),
            ],
          ),
        ),
        if (snippetInfo.editingVersionId != snippetInfo.publishedVersionId)
          MenuItemButton(
            onPressed: () {
              fco.capiBloc.add(CAPIEvent.publishSnippet(
                  snippetName: snippetInfo.name,
                  versionId: snippetInfo.editingVersionId));
            },
            child: const Text('publish this version'),
          ),
        MenuItemButton(
          onPressed: () {
            fco.capiBloc.add(
                CAPIEvent.toggleAutoPublishingOfSnippet(
                    snippetName: snippetInfo.name));
          },
          child: snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
              ? const Tooltip(
              message: "don't auto-push changes.",
              child: Text('stop auto-publishing changes to this snippet'))
              : const Tooltip(
              message: 'auto push changes as they occur',
              child: Text('auto-publish future changes to this snippet')),
        ),
        MenuItemButton(
          onPressed: () async {
            fco.capiBloc.add(CAPIEvent.copySnippetJsonToClipboard(
              rootNode: fco.snippetBeingEdited!.getRootNode(),
            ));
          },
          child: const Text('copy snippet JSON to clipboard'),
        ),
        MenuItemButton(
          onPressed: () async {
            fco.capiBloc
                .add(const CAPIEvent.replaceSnippetFromJson());
          },
          child: const Text('save snippet JSON from clipboard'),
        ),
      ],
    );
  }
}
