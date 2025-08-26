import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_msv.dart';

class PropertyButtonUML extends StatefulWidget {
  final UMLRecord originalUMLRecord;
  final String? label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<UMLRecord> onChangeF;
  final ValueChanged<Size> onSizedF;
  final ScrollControllerName? scName;

  const PropertyButtonUML({
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
  State<PropertyButtonUML> createState() => _PropertyButtonUMLState();
}

class _PropertyButtonUMLState extends State<PropertyButtonUML> {
  late UMLRecord umlRecord;
  late TextEditingController teC;

  @override
  void initState() {
    umlRecord = widget.originalUMLRecord;
    teC = TextEditingController();
    // make sure start and end are present for viewing, but they don't get sent to the encoder
    teC.text = !(widget.originalUMLRecord.text??'').contains('@startuml')
    ? "@startuml\n${widget.originalUMLRecord.text ?? ''}\n@enduml" ?? ''
    : widget.originalUMLRecord.text ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          String editedText = umlRecord.text ?? '';
          String textLabel() => editedText.isNotEmpty ? editedText : '${widget.label}...';
          Widget labelWidget = Text(
            textLabel(),
            style: const TextStyle(color: Colors.white),
            // overflow: TextOverflow.ellipsis,
          );
          return GestureDetector(
            onTap: () {
              CalloutConfigModel teCC = CalloutConfigModel(
                cId: 'uml-te',
                scrollControllerName: widget.scName,
                // containsTextField: true,
                barrier: CalloutBarrierConfig(
                    opacity: .25,
                    onTappedF: () {
                      fco.dismiss('uml-te');
                    }),
                fillColor: ColorModel.white(),
                arrowType: ArrowTypeEnum.NONE,
                initialCalloutW: fco.scrW * .8,
                initialCalloutH: fco.scrH * .8,
                onDismissedF: () {},
                onAcceptedF: () {},
                onResizeF: (Size newSize) {},
                onDragF: (Offset newOffset) {},
                draggable: false,
                notUsingHydratedStorage: true,
              );

              Widget calloutContent = PlantUMLMSV(
                teC: teC,
                onChangeF: (UMLRecord newUmlRecord) {
                  widget.onChangeF.call(umlRecord = newUmlRecord);
                },
                onSizedF: widget.onSizedF,
              );

              fco.showOverlay(
                calloutConfig: teCC,
                calloutContent: calloutContent,
                targetGkF: () => widget.propertyBtnGK,
              );
            },
            child: Container(
              alignment: Alignment.topLeft,
              key: widget.propertyBtnGK,
              width: widget.calloutButtonSize.width,
              height: widget.calloutButtonSize.height,
              child: labelWidget,
            ),
          );
        });
  }
}