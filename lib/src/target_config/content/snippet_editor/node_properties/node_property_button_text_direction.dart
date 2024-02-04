import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_direction.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonTextDirection extends StatefulWidget {
  final String label;
  final TextDirectionEnum? textDirection;
  final Function(TextDirectionEnum) onChangeF;

  const NodePropertyButtonTextDirection({required this.label, required this.textDirection, required this.onChangeF, super.key});

  @override
  State<NodePropertyButtonTextDirection> createState() => _NodePropertyButtonTextDirectionState();
}

class _NodePropertyButtonTextDirectionState extends State<NodePropertyButtonTextDirection> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Widget textDirectionLabel = widget.textDirection != null
        ? Text('textDirection: ${widget.textDirection!.name}', style: const TextStyle(color: Colors.white))
        : const Text('textDirection...', style: TextStyle(color: Colors.white));
    return NodePropertyCalloutButton(
      labelWidget: textDirectionLabel,
      calloutButtonSize: const Size(72, 36),
      calloutContents: (ctx) {
        return IntrinsicWidth(
          child: Column(
              children: TextDirectionEnum.values.map((v) {
            return RadioListTile<TextDirectionEnum>(
              dense: true,
              value: v,
              groupValue: widget.textDirection,
              tileColor: Colors.purple.shade50,
              title: Text(v.name),
              toggleable: true,
              onChanged: (newValue) {
                if (newValue != null) {
                  widget.onChangeF.call(newValue);
                  Useful.afterMsDelayDo(500, () {
                    Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
                  });
                }
              },
            );
          }).toList()),
        );
      },
      calloutSize: const Size(140, 80),
    );
  }
}
