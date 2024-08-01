import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';

class PropertyButtonColor extends StatelessWidget {
  final Feature cId;
  final String label;
  final String? tooltip;
  final Color? originalColor;
  final ValueChanged<Color?> onChangeF;
  final Size calloutButtonSize;

  const PropertyButtonColor({
    required this.cId,
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
      cId: cId,
      labelWidget: colorLabel,
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: Alignment.bottomCenter,
      initialTargetAlignment: Alignment.topCenter,
      calloutContents: (ctx) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () => onChangeF(Colors.black),
                    child: fco.coloredText('black', color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () => onChangeF(Colors.transparent),
                    child: const Text('transparent'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => onChangeF.call(Colors.white),
                    child: const Text('white'),
                  ),
                ],
              ),
              ColorPicker(
                // Use the screenPickerColor as color.
                color: originalColor ?? Colors.blue,
                // Update the screenPickerColor using the callback.
                onColorChanged: (Color color) => onChangeF(color),
                // onCompleted: () => Callout.dismiss(cId),
                width: 32,
                height: 32,
                borderRadius: 16,
                subheading: const Divider(height: 30),
              ),
            ],
          ),
        );
      },
      calloutSize: const Size(320, 380),
      notifier: ValueNotifier<int>(0),
    );
  }
}
