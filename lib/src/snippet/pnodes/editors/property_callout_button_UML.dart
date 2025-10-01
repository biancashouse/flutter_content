import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_msv.dart';

class PropertyButtonUML extends StatelessWidget {
  final SNode snode;
  final UMLRecord originalUMLRecord;
  final String? label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<UMLRecord> onChangeF;
  final ValueChanged<Size> onSizedF;
  final ScrollControllerName? scName;

  const PropertyButtonUML(this.snode, {
    required this.originalUMLRecord,
    this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.onSizedF,
    required this.propertyBtnGK,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final teC = TextEditingController();

    // make sure start and end are present for viewing, but they don't get sent to the encoder
    teC.text = !(originalUMLRecord.text ?? '').contains('@startuml')
        ? "@startuml\n${originalUMLRecord.text ?? ''}\n@enduml"
        : originalUMLRecord.text ?? '';

    String textLabel() =>
        (originalUMLRecord.text?.isNotEmpty??false) ? teC.text : '$label...';
    Widget labelWidget = Text(
      textLabel(),
      style: const TextStyle(color: Colors.white),
      // overflow: TextOverflow.ellipsis,
    );

    return GestureDetector(
      onTap: () {
        showUMLEditor(context, originalUMLRecord, teC, onChangeF, onSizedF);
      },
      child: Container(
        alignment: Alignment.topLeft,
        key: propertyBtnGK,
        width: calloutButtonSize.width,
        height: calloutButtonSize.height,
        child: labelWidget,
      ),
    );
  }

  static void showUMLEditor(context, originalUMLRecord, teC, onChangeF, onSizedF) {

    CalloutConfig teCC = CalloutConfig(
      cId: 'uml-te',
      scrollControllerName: null,
      // containsTextField: true,
      barrier: CalloutBarrierConfig(
        opacity: .25,
        onTappedF: () {
          fco.dismiss('uml-te');
        },
      ),
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      targetPointerType: TargetPointerType.none(),
      initialCalloutW: fco.scrW * .8,
      initialCalloutH: fco.scrH * .8,
      onAcceptedF: () {},
      onResizeF: (Size newSize) {},
      onDragF: (Offset newOffset) {},
      draggable: false,
      notUsingHydratedStorage: true,
    );

    Widget calloutContent = PlantUMLMSV(
      teC: teC,
      onChangeF: (UMLRecord newUmlRecord) {
        onChangeF.call(newUmlRecord);
      },
      onSizedF: onSizedF,
    );

    fco.showOverlay(
      calloutConfig: teCC,
      calloutContent: calloutContent,
    );
  }
}
