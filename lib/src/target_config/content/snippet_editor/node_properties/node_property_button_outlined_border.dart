import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonOutlinedBorder extends StatefulWidget {
  final String label;
  final OutlinedBorderEnum? ob;
  final Function(OutlinedBorderEnum) onChangeF;

  const NodePropertyButtonOutlinedBorder({required this.label, required this.ob, required this.onChangeF, super.key});

  @override
  State<NodePropertyButtonOutlinedBorder> createState() => _NodePropertyButtonOutlinedBorderState();
}

class _NodePropertyButtonOutlinedBorderState extends State<NodePropertyButtonOutlinedBorder> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Widget obLabel = widget.ob != null
        ? Text('outlinedBorder: ${widget.ob!.name}', style: const TextStyle(color: Colors.white))
        : const Text('outlinedBorder...', style: TextStyle(color: Colors.white));
    return NodePropertyCalloutButton(
      notifier: ValueNotifier<int>(0),
      labelWidget: obLabel,
      calloutButtonSize: const Size(100, 36),
      calloutContents: (ctx) {
        return IntrinsicWidth(
          child: Column(
              children: OutlinedBorderEnum.values.map((v) {
                return RadioListTile<OutlinedBorderEnum>(
                  dense: true,
                  value: v,
                  groupValue: widget.ob,
                  tileColor: Colors.purple.shade50,
                  title: v.toMenuItem(),
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
      calloutSize: Size(320, OutlinedBorderEnum.values.length * 50),
    );
  }
}
