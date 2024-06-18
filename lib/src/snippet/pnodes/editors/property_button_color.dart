import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/easy_color_picker.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';

class PropertyButtonColor extends StatelessWidget {
  final Feature feature;
  final String label;
  final String? tooltip;
  final Color? originalColor;
  final ValueChanged<Color?> onChangeF;
  final Size calloutButtonSize;

  const PropertyButtonColor({
    required this.feature,
    required this.label,
    this.tooltip,
    required this.originalColor,
    required this.onChangeF,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget colorLabel = originalColor != null
        ? Row(children: [
            Text(label,
                style: const TextStyle(
                  color: Colors.white,
                )),
            Icon(Icons.square, color: originalColor),
          ])
        : Text('$label...',
            style: const TextStyle(
              color: Colors.white,
            ));
    return PropertyCalloutButton(
      feature: feature,
      labelWidget: colorLabel,
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: Alignment.bottomCenter,
      initialTargetAlignment: Alignment.topCenter,
      calloutContents: (ctx) {
        return Center(
          child: EasyColorPicker(
            selected: originalColor ?? Colors.white,
            onChanged: (color) {
              onChangeF.call(color);
              // FlutterContent().capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
              // FC().afterMsDelayDo(1000, () {
                Callout.dismiss(feature);
              // });
            },
          ),
        );
      },
      calloutSize: const Size(280, 140),
      notifier: ValueNotifier<int>(0),
    );
  }
}
