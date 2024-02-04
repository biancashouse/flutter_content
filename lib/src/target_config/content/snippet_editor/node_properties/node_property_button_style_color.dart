import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonColor extends StatefulWidget {
  final String label;
  final int? colorValue;
  final ValueChanged<int?> onChangeF;

  const NodePropertyButtonColor({required this.label, required this.colorValue, required this.onChangeF, super.key});

  @override
  State<NodePropertyButtonColor> createState() => _NodePropertyButtonColorState();
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
    Widget colorLabel = widget.colorValue != null
        ? Row(children: [
            const Text('color:',
                style: TextStyle(
                  color: Colors.white,
                )),
            Icon(Icons.square, color: Color(widget.colorValue!))
          ])
        : const Text('color...',
            style: TextStyle(
              color: Colors.white,
            ));
    return NodePropertyCalloutButton(
      labelWidget: colorLabel,
      calloutButtonSize: const Size(72, 36),
      calloutContents: (ctx) {
        return Center(
          child: EasyColorPicker(
            selected: Color(widget.colorValue ?? Colors.white.value),
            onChanged: (color) {
               widget.onChangeF.call(color?.value);
              Useful.afterMsDelayDo(500, () {
                Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
              });
            },
          ),
        );
      },
      calloutSize: const Size(280, 110),
    );
  }
}
