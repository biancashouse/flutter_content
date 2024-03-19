import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonTextAlign extends StatefulWidget {
  final String label;
  final TextAlignEnum? textAlign;
  final Function(TextAlignEnum) onChangeF;

  const NodePropertyButtonTextAlign({required this.label, required this.textAlign, required this.onChangeF, super.key});

  @override
  State<NodePropertyButtonTextAlign> createState() => _NodePropertyButtonTextAlignState();
}

class _NodePropertyButtonTextAlignState extends State<NodePropertyButtonTextAlign> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Widget textAlignLabel = widget.textAlign != null
        ? Text('textAlign: ${widget.textAlign!.name}', style: const TextStyle(color: Colors.white))
        : const Text('textAlign...', style: TextStyle(color: Colors.white));
    return NodePropertyCalloutButton(
      notifier: ValueNotifier<int>(0),
      labelWidget: textAlignLabel,
      calloutButtonSize: const Size(72, 36),
      calloutContents: (ctx) {
        return IntrinsicWidth(
          child: Column(
              children: TextAlignEnum.values.map((v) {
            return RadioListTile<TextAlignEnum>(
              dense: true,
              value: v,
              groupValue: widget.textAlign,
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
      calloutSize: const Size(180, 240),
    );
  }
}
