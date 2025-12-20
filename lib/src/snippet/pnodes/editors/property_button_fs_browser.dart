import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_tree_and_image_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../flutter_content.dart';

class PropertyButtonFSBrowser extends HookWidget {
  final String label;
  final String? tooltip;
  final String? originalFSPath;
  final ValueChanged<String?> onChangeF;
  final Size calloutButtonSize;

  const PropertyButtonFSBrowser({
    required this.label,
    this.tooltip,
    required this.originalFSPath,
    required this.onChangeF,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedPath = useState(originalFSPath);

    useEffect(() {
      selectedPath.value = originalFSPath;
      return null;
    }, [originalFSPath]);

    return PropertyCalloutButton(
      cId: 'fs-browser',
      labelWidget: Text(
        selectedPath.value == null ? '$label...' : '${selectedPath.value}...',
        style: const TextStyle(color: Colors.white),
      ),
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: Alignment.bottomCenter,
      initialTargetAlignment: Alignment.topCenter,
      calloutContents: (ctx) =>
          FSFoldersAndImagePicker(onSelectedFileF: (fullPath) {
        selectedPath.value = fullPath;
        onChangeF(fullPath);
      }),
      // onDismissedF: () => fco.restoreHeight(fco.snippetBeingEdited!.rootNode.name),
      calloutSize: const Size(500, 400),
      // notifier: ValueNotifier<int>(0),
    );
  }
}
