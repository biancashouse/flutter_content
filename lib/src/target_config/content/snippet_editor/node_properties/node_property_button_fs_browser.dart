import 'package:flutter/material.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

import 'callout_fs_folder_tree_and_image_picker.dart';

class NodePropertyButtonFSBrowser extends StatelessWidget {
  final String label;
  final String? tooltip;
  final String? originalFSPath;
  final ValueChanged<String?> onChangeF;
  final Size calloutButtonSize;

  const NodePropertyButtonFSBrowser({
    required this.label,
    this.tooltip,
    required this.originalFSPath,
    required this.onChangeF,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NodePropertyCalloutButton(
      feature: 'fs-browser',
      labelWidget: Text(originalFSPath == null ? '$label...' : '$originalFSPath...',
          style: const TextStyle(
            color: Colors.white,
          )),
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: Alignment.bottomCenter,
      initialTargetAlignment: Alignment.topCenter,
      calloutContents: (ctx) {
        return  FSFoldersAndImagePicker(onChangeF:onChangeF);
      },
      calloutSize: const Size(500, 400),
      notifier: ValueNotifier<int>(0),
    );
  }
}