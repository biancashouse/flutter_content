import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_msv.dart';

class PropertyButtonUML extends HookWidget {
  final SNode snode;
  final UMLRecord originalUMLRecord;
  final String label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<UMLRecord> onChangeF;
  final ValueChanged<Size> onSizedF;

  const PropertyButtonUML(
    this.snode, {
    required this.originalUMLRecord,
    required this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.onSizedF,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final teC = useTextEditingController(
      text: !(originalUMLRecord.text ?? '').contains('@startuml')
          ? "@startuml\n${originalUMLRecord.text ?? ''}\n@enduml"
          : originalUMLRecord.text ?? '',
    );

    return TextButton.icon(
      label: Text(label),
      onPressed: () {
        showUMLEditor(
          snode,
          context,
          originalUMLRecord,
          teC,
          onChangeF,
          onSizedF,
        );
      },
      icon: const Icon(Icons.edit),
    );
  }

  static void showUMLEditor(
    SNode snode,
    BuildContext context,
    UMLRecord originalUMLRecord,
    teC,
    onChangeF,
    onSizedF,
  ) {
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

    Widget calloutContent = PlantUMLMSV(
      snode: snode,
      originalUMLRecord: originalUMLRecord,
      teC: teC,
      onChangeF: (UMLRecord newUmlRecord) {
        onChangeF.call(newUmlRecord);
      },
      onSizedF: onSizedF,
    );

    fco.showOverlay(calloutConfig: teCC, calloutContent: calloutContent);
  }
}
