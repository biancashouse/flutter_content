import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/plantuml_editor.dart';

class PropertyButtonUML extends StatefulWidget {
  final UMLRecord originalUMLRecord;
  final String? label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<UMLRecord> onChangeF;

  const PropertyButtonUML({
    required this.originalUMLRecord,
    this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.propertyBtnGK,
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
    teC.text = widget.originalUMLRecord.text ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          String editedText = umlRecord.text ?? '';
          String textLabel() =>
              editedText.isNotEmpty ? '${widget.label}: $editedText' : '${widget
                  .label}...';
          Widget labelWidget = Text(
            textLabel(),
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          );
          return GestureDetector(
            onTap: () {
              CalloutConfig teCC = CalloutConfig(
                cId: 'uml-te',
                containsTextField: true,
                barrier: CalloutBarrier(
                    opacity: .25,
                    onTappedF: () {
                      fco.dismiss('uml-te');
                    }),
                fillColor: Colors.white,
                arrowType: ArrowType.NONE,
                initialCalloutW: fco.scrW * .8,
                initialCalloutH: fco.scrH * .8,
                onDismissedF: () {},
                onAcceptedF: () {},
                onResizeF: (Size newSize) {},
                onDragF: (Offset newOffset) {},
                draggable: false,
                notUsingHydratedStorage: true,
              );

              Widget calloutContent = PlantUMLTextEditor(
                teC: teC, onChangeF: (UMLRecord newUmlRecord) {
                  widget.onChangeF.call(umlRecord = newUmlRecord);
              },);

              fco.showOverlay(
                calloutConfig: teCC,
                calloutContent: calloutContent,
                targetGkF: () => widget.propertyBtnGK,
              );
            },
            child: Container(
              alignment: Alignment.centerLeft,
              key: widget.propertyBtnGK,
              width: widget.calloutButtonSize.width,
              height: widget.calloutButtonSize.height,
              child: labelWidget,
            ),
          );
        });
  }
}