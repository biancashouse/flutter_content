import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

import 'markdown_msv.dart';

class PropertyButtonMarkdown extends StatefulWidget {
  final String originalMarkdown;
  final String? label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;
  final ScrollControllerName? scName;

  const PropertyButtonMarkdown({
    required this.originalMarkdown,
    this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.propertyBtnGK,
    required this.scName,
    super.key,
  });

  @override
  State<PropertyButtonMarkdown> createState() => _PropertyButtonMarkdownState();
}

class _PropertyButtonMarkdownState extends State<PropertyButtonMarkdown> {
  late TextEditingController teC;

  @override
  void initState() {
    teC = TextEditingController();
    // make sure start and end are present for viewing, but they don't get sent to the encoder
    teC.text = widget.originalMarkdown;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          String textLabel() => teC.text.isNotEmpty ? teC.text : '${widget.label}...';
          Widget labelWidget = Text(
            textLabel(),
            style: const TextStyle(color: Colors.white),
            // overflow: TextOverflow.ellipsis,
          );
          return InkWell(
            onTap: () {
              CalloutConfig teCC = CalloutConfig(
                cId: 'markdown-te',
                scrollControllerName: widget.scName,
                // containsTextField: true,
                barrier: CalloutBarrierConfig(
                    opacity: .25,
                    onTappedF: () {
                      fco.dismiss('markdown-te');
                    }),
                decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
                targetPointerType: TargetPointerType.none()  ,
                initialCalloutW: fco.scrW * .8,
                initialCalloutH: fco.scrH * .8,
                onDismissedF: () {},
                onAcceptedF: () {},
                resizeableH: true,
                resizeableV: true,
                onResizeF: (Size newSize) {},
                onDragF: (Offset newOffset) {},
                draggable: false,
                notUsingHydratedStorage: true,
              );

              Widget calloutContent = MarkdownMSV(
                teC: teC,
                onChangeF: (String newMarkdown) {
                  widget.onChangeF.call(teC.text = newMarkdown);
                },
              );

              fco.showOverlay(
                calloutConfig: teCC,
                calloutContent: calloutContent,
                targetGkF: () => widget.propertyBtnGK,
              );
            },
            child: fco.coloredText('tap here to edit the markdown', color: Colors.white),
            // child: Container(
            //   alignment: Alignment.topLeft,
            //   key: widget.propertyBtnGK,
            //   width: widget.calloutButtonSize.width,
            //   height: widget.calloutButtonSize.height,
            //   child: labelWidget,
            // ),
          );
        });
  }
}