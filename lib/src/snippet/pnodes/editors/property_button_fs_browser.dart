import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_tree_and_image_picker.dart';

class PropertyButtonFSBrowser extends StatelessWidget {
  final String label;
  final String? tooltip;
  final String? originalFSPath;
  final ValueChanged<String?> onChangeF;
  final Size calloutButtonSize;
  final ScrollControllerName? scName;

  const PropertyButtonFSBrowser({
    required this.label,
    this.tooltip,
    required this.originalFSPath,
    required this.onChangeF,
    required this.calloutButtonSize,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PropertyCalloutButton(
      cId: 'fs-browser',
      scName: scName,
      labelWidget:
          Text(originalFSPath == null ? '$label...' : '$originalFSPath...',
              style: const TextStyle(
                color: Colors.white,
              )),
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: AlignmentEnum.bottomCenter,
      initialTargetAlignment: AlignmentEnum.topCenter,
      calloutContents: (ctx) {
        // cId:
        // fco.afterNextBuildDo((){
        //   fco.zeroHeight(fco.snippetBeingEdited!.rootNode.name);
        // });
        return FSFoldersAndImagePicker(onSelectedFileF: onChangeF);
      },
      // onDismissedF: () => fco.restoreHeight(fco.snippetBeingEdited!.rootNode.name),
      calloutSize: const Size(500, 400),
      // notifier: ValueNotifier<int>(0),
    );
  }
}
