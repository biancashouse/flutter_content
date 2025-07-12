import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class VersionsMenuAnchor extends StatelessWidget {
  final SnippetInfoModel snippetInfo;

  const VersionsMenuAnchor({required this.snippetInfo, super.key});

  @override
  Widget build(BuildContext context) {
    // REVERT menu items
    // List<MenuItemButton> revertMIs = [];
    // for (VersionId versionId
    //     in widget.snippet.versionIds() /*.sublist(0, 10)*/) {
    //   bool thisIsBeingEdited =
    //       fco.removeNonNumeric(versionId) == currentVersionId;
    //   bool thisIsCurrentlyPublished =
    //       fco.removeNonNumeric(versionId) == publishedVersionId;
    //   Color itemTextColor = Colors.black;
    //   if (thisIsCurrentlyPublished) itemTextColor = Colors.blue;
    //   revertMIs.add(MenuItemButton(
    //     onPressed: () async {
    //       if (versionId == currentVersionId) {
    //         fco.showToast(
    //           calloutConfig: CalloutConfigModel(
    //             cId: "cannot-revert-to-current-version",
    //             gravity: AlignmentEnum.topCenter,
    //             fillColor: Colors.yellow,
    //             initialCalloutW: fco.scrW * .8,
    //             initialCalloutH: 40,
    //           ),
    //           calloutContent: Padding(
    //               padding: const EdgeInsets.all(10),
    //               child: fco.coloredText(
    //                   'Cannot revert to Current version - ignored',
    //                   color: Colors.red)),
    //         );
    //       } else {
    //         fco.capiBloc.add(
    //           CAPIEvent.revertSnippet(
    //             snippetName: widget.snippet.name,
    //             versionId: fco.removeNonNumeric(versionId),
    //           ),
    //         );
    //         fco.afterNextBuildDo(() {
    //           fco.logger.i('reverted.');
    //         });
    //       }
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: thisIsBeingEdited ? fco.FUCHSIA_X : Colors.transparent,
    //           width: thisIsBeingEdited ? 4 : 0,
    //           style: BorderStyle.solid,
    //         ),
    //       ),
    //       padding: EdgeInsets.all(thisIsBeingEdited ? 4 : 0),
    //       child: fco.coloredText(
    //           '$versionId ' +
    //               fco.formattedDate(
    //                   int.tryParse(fco.removeNonNumeric(versionId)) ?? 0),
    //           color: itemTextColor),
    //     ),
    //   ));
    // }
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
          icon: const Icon(Icons.more_vert, color: Colors.white),
          tooltip: 'Show menu',
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
