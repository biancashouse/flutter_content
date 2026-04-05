import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/uml_msv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_content/flutter_content.dart';

class PropertyButtonUML extends HookWidget {
  final String? diagramText;
  final String label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;

  const PropertyButtonUML({
    this.diagramText,
    required this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final teC = useTextEditingController(text: diagramText);

    return TextButton.icon(
      label: Text(label),
      onPressed: () {
        showUMLEditor(
          context: context,
          teC: teC,
          onChangeF: onChangeF,
        );
      },
      icon: const Icon(Icons.edit),
    );
  }

  static void showUMLEditor({
    required BuildContext context,
    required TextEditingController teC,
    required ValueChanged<String> onChangeF,
  }) {
    CalloutConfig teCC = CalloutConfig(
      cId: 'uml-te',

      // containsTextField: true,
      // barrier: CalloutBarrierConfig(
      //   opacity: .25,
      //   onTappedF: () {
      //     fco.dismiss('uml-te');
      //   },
      // ),
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      targetPointerType: TargetPointerType.none(),
      initialCalloutW: fco.scrW * .95,
      initialCalloutH: fco.scrH * .95,
      onAcceptedF: () {},
      onResizeF: (Size newSize) {},
      onDragF: (Offset newOffset) {},
      draggable: false,
    );

    Widget calloutContent = UmlMSV(
      teC: teC,
      onChangeF: (String newDiagramText) {
        onChangeF.call(newDiagramText);
      },
    );

    fco.showOverlay(calloutConfig: teCC, calloutContent: calloutContent);
  }
}
