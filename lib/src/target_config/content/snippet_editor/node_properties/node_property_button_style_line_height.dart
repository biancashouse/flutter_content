import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/decimal_editor.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonStyleLineHeight extends StatefulWidget {
  final String label;
  final double? lineHeight;
  final Function(double) onChangeF;

  const NodePropertyButtonStyleLineHeight({required this.label, required this.lineHeight, required this.onChangeF, super.key});

  @override
  State<NodePropertyButtonStyleLineHeight> createState() => _NodePropertyButtonStyleLineHeightState();
}

class _NodePropertyButtonStyleLineHeightState extends State<NodePropertyButtonStyleLineHeight> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Widget lineHeightLabel = widget.lineHeight != null
        ? Text('style.lineHeight: ${widget.lineHeight}', style: const TextStyle(color: Colors.white))
        : const Text('style.lineHeight...', style: TextStyle(color: Colors.white));
    return NodePropertyCalloutButton(
      feature: 'line-height',
      notifier: ValueNotifier<int>(0),
      labelWidget: lineHeightLabel,
      calloutButtonSize: const Size(72, 36),
      calloutContents: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: DecimalEditor(
              label: 'line height',
              helperText: '% of font size',
              originalS: widget.lineHeight?.toString() ?? '',
              onChangedF: (newLineHeight) {
                double lh = double.tryParse(newLineHeight) ?? 0.0;
                widget.onChangeF.call(lh);
              },
              onDoneF: (s) {
                Useful.afterMsDelayDo(500, () {
                  Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
                });
              },
            ),
          ),
        );
      },
      calloutSize: const Size(140, 80),
    );
  }
}
