import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/text_editing/text_editor_with_autocomplete.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_text_editor.dart';

class NodePropertyButton_String extends HookWidget {
  final String originalText;
  final List<String>? options;
  final String label;
  final int maxLines;
  final bool expands;
  final Size calloutButtonSize;
  final Size calloutSize;
  final Type? inputType;
  final bool skipLabelText;
  final bool skipHelperText;
  final GlobalKey propertyBtnGK;
  final Function(String) onChangeF;

  NodePropertyButton_String({
    required this.originalText,
    this.options,
    required this.label,
    this.maxLines = 1,
    this.expands = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.inputType = String,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onChangeF,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
    final textValue = useState<String>(originalText);
    String textLabel() =>
        textValue.value.isNotEmpty ? '$label: ${textValue.value}' : '$label...';
    Widget labelWidget() => Text(
          textLabel(),
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        );
    bool noBarrier = false;
    CalloutConfig calloutConfig = CalloutConfig(
      feature: '_NodePropertyButton_SnippetNameState',
      containsTextField: true,
      barrier: CalloutBarrier(
        opacity: noBarrier ? 0.0 : .25,
        onTappedF: noBarrier
            ? null
            : () async {
                //Callout.removeParentCallout(context);
                // Callout? parentCallout = feature:Callout.findCallout(feature);
                // if (parentCallout != null) Callout.removeOverlay(parentCallout.feature, true);
              },
      ),
      // arrowThickness: ArrowThickness.THIN,
      fillColor: Colors.white,
      // arrowColor: Colors.red,
      arrowType: ArrowType.NO_CONNECTOR,
      finalSeparation: 0.0,
      initialCalloutAlignment: Alignment.topLeft,
      initialTargetAlignment: Alignment.topLeft,
      modal: false,
      suppliedCalloutW: calloutSize.width,
      suppliedCalloutH: calloutSize.height,
      resizeableH: maxLines > 1,
      resizeableV: maxLines > 1,
      onDismissedF: () {},
      onAcceptedF: () {},
      // containsTextField: true,
      onResize: (Size newSize) {},
      onDragF: (Offset newOffset) {},
      targetTranslateX: 0,
      targetTranslateY: 0,
      draggable: false,
      notUsingHydratedStorage: true,
    );
    Widget boxContent(ctx) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextEditorWithAutocomplete(
            key: calloutChildGK,
            prompt: textLabel(),
            parentFeature: '_NodePropertyButton_SnippetNameState',
            originalS: textValue.value,
            onTextChangedF: (s) {},
            onEditingCompleteF: (s)=>onChangeF(textValue.value = s),
            dontAutoFocus: true,
            bgColor: Colors.white,
            inputType: inputType,
            maxLines: maxLines,
            options: options,
          ),
        );
    return GestureDetector(
      onTap: () {
        Callout.showOverlay(
          calloutConfig: calloutConfig,
          boxContentF: boxContent,
          targetGkF: () => propertyBtnGK,
        );
      },
      child: SizedBox(
        key: propertyBtnGK,
        // margin: const EdgeInsets.only(top: 8),
        width: calloutButtonSize.width,
        height: calloutButtonSize.height,
        // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        // color: Colors.white70,
        // alignment: Alignment.center,
        child: labelWidget(),
      ),
    );
  }
}
