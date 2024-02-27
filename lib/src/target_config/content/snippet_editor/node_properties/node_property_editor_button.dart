// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/flutter_text_editor.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/flutter_text_editor_inside_callout.dart';

/// show a button, but when pressed is replaced a an edit field.
/// On completion of the edit, reverts to a button.
class NodePropertyEditor_Double extends StatefulWidget {
  final double originalValue;
  final ValueChanged<String> onChangedF;
  final Alignment alignment;
  final String? label;
  final Widget? labelWidget;
  final WidgetBuilder calloutContents;
  final Size calloutButtonSize;

  const NodePropertyEditor_Double({
    required this.originalValue,
    required this.onChangedF,
    this.alignment = Alignment.centerLeft,
     this.label,
    this.labelWidget,
    required this.calloutContents,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  State<NodePropertyEditor_Double> createState() => _NodePropertyEditorButtonState();
}

class _NodePropertyEditorButtonState extends State<NodePropertyEditor_Double> {
  late bool showButton;

  @override
  void initState() {
    super.initState();
    showButton = true;
  }

  @override
  Widget build(BuildContext context) {
    return !showButton
        ? FlutterTextEditor(
            originalText: widget.originalValue.toString(),
            label: widget.label??'',
            onDoneF: (s) {
              setState(() {
                showButton = true;
                if (widget.originalValue.toString() != s) widget.onChangedF(s);
              });
            },
            skipLabelText: true,
            skipHelperText: true,
            textInputType: TextInputType.number,
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                showButton = false;
              });
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 8),
              width: widget.calloutButtonSize.width,
              height: widget.calloutButtonSize.height,
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              color: widget.labelWidget != null ? null : Colors.white70,
              alignment: widget.alignment,
              child: widget.labelWidget ?? (widget.label != null ? Text(widget.label!) : const Offstage()),
            ),
          );
  }
}
