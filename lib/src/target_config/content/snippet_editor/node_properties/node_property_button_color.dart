import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonColor extends StatefulWidget {
  final String label;
  final String? tooltip;
  final Color? originalColor;
  final ValueChanged<Color?> onChangeF;
  final Size calloutButtonSize;

  const NodePropertyButtonColor({
    required this.label,
    this.tooltip,
    required this.originalColor,
    required this.onChangeF,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  State<NodePropertyButtonColor> createState() =>
      _NodePropertyButtonColorState();
}

class _NodePropertyButtonColorState extends State<NodePropertyButtonColor> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Widget colorLabel = widget.originalColor != null
        ? Row(children: [
            Text(widget.label,
                style: const TextStyle(
                  color: Colors.white,
                )),
            Icon(Icons.square, color: widget.originalColor),
          ])
        : Text('${widget.label}...',
            style: const TextStyle(
              color: Colors.white,
            ));
    return NodePropertyCalloutButton(
      labelWidget: colorLabel,
      tooltip: widget.tooltip,
      calloutButtonSize: widget.calloutButtonSize,
      calloutContents: (ctx) {
        return Center(
          child: EasyColorPicker(
            selected: widget.originalColor ?? Colors.white,
            onChanged: (color) {
              widget.onChangeF.call(color);
              // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
              Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
            },
          ),
        );
      },
      calloutSize: const Size(280, 140),
    );
  }
}
