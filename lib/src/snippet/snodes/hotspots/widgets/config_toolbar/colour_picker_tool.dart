import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class ColourPickerTool extends StatelessWidget {
  // final CalloutConfig cc;
  final Color originalColor;
  final ColorPickedCallback onColorPickedF;
  // final TargetModel tc;
  // final VoidCallback onParentBarrierTappedF;
  // final ScrollControllerName? scName;
  // final bool justPlaying;

  const ColourPickerTool({
    // required this.cc,
    required this.originalColor,
    required this.onColorPickedF,
    // this.onParentBarrierTappedF,
    // this.scName,
    // required this.justPlaying,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => onColorPickedF(Colors.black),
                child: fco.coloredText('black', color: Colors.white),
              ),
              TextButton(
                onPressed: () => onColorPickedF(Colors.transparent),
                child: const Text('transparent'),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => onColorPickedF(Colors.white),
                child: const Text('white'),
              ),
            ],
          ),
          ColorPicker(
            // Use the screenPickerColor as color.
            color: originalColor,
            // Update the screenPickerColor using the callback.
            onColorChanged: (Color color) => onColorPickedF(color),
            // onCompleted: () => fco.dismiss(cId),
            width: 32,
            height: 32,
            borderRadius: 16,
            subheading: const Divider(height: 30),
          ),
        ],
      ),
    );
  }
}
