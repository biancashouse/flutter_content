import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonEnum extends StatelessWidget {
  final String label;
  final List<Widget> menuItems;
  final int? originalEnumIndex;
  final Function(int) onChangeF;
  final bool wrap;
  final Size calloutButtonSize;
  final Size calloutSize;

  const NodePropertyButtonEnum({
    required this.label,
    required this.menuItems,
    required this.originalEnumIndex,
    required this.onChangeF,
    this.wrap = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget mi = menuItems[originalEnumIndex ?? 0];
    return NodePropertyCalloutButton(
      feature: 'radio-menu',
      notifier: ValueNotifier<int>(0),
      labelWidget: label.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (Useful.coloredText(label.isNotEmpty ? '$label: ' : '', color: Colors.white)),
                originalEnumIndex == null ? Useful.coloredText('...', color: Colors.white) : mi,
              ],
            )
          : originalEnumIndex == null
              ? Useful.coloredText('...', color: Colors.white)
              : mi,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: Alignment.bottomCenter,
      initialTargetAlignment: Alignment.topCenter,
      calloutContents: (ctx) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
              children: menuItems.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _changed(entry.key);
                },
                child: entry.value,
              ),
            );
          }).toList()),
        ),
      ),
      calloutSize: calloutSize,
    );
  }

  void _changed(int? option) {
    if (option != null) {
      onChangeF.call(option);
      // Useful.afterMsDelayDo(500, () {
      //   Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
      // });
    }
  }
}
