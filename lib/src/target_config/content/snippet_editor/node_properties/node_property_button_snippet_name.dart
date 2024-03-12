import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/text_editing/text_editor_with_autocomplete.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_text_editor.dart';

class NodePropertyButton_SnippetName extends StatefulWidget {
  final String originalText;
  final String label;
  final int maxLines;
  final bool expands;
  final Size calloutButtonSize;
  final Size calloutSize;
  final Type? inputType;
  final bool skipLabelText;
  final bool skipHelperText;
  final Function(String) onChangeF;

  const NodePropertyButton_SnippetName({
    required this.originalText,
    required this.label,
    this.maxLines = 1,
    this.expands = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.inputType = String,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onChangeF,
    super.key,
  });

  @override
  State<NodePropertyButton_SnippetName> createState() => _NodePropertyButton_SnippetNameState();
}

class _NodePropertyButton_SnippetNameState extends State<NodePropertyButton_SnippetName> {
  late GlobalKey propertyBtnGK;
  GlobalKey<TextEditorState> calloutChildGK = GlobalKey<TextEditorState>();
  late FocusNode _focusNode;
  late TextEditingController _teC;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
    _focusNode = FocusNode();
    _teC = TextEditingController(text: widget.originalText);
  }

  @override
  Widget build(BuildContext context) {
    String textLabel = widget.originalText.isNotEmpty ? '${widget.label}: ${widget.originalText}' : '${widget.label}...';
    Widget labelWidget = Text(
      textLabel,
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
      color: Colors.white,
      arrowColor: Colors.red,
      finalSeparation: 0.0,
      initialCalloutAlignment: Alignment.topLeft,
      initialTargetAlignment: Alignment.topLeft,
      modal: false,
      suppliedCalloutW: widget.calloutSize.width,
      suppliedCalloutH: widget.calloutSize.height,
      resizeableH: widget.maxLines > 1,
      resizeableV: widget.maxLines > 1,
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
            prompt: textLabel,
            parentFeature: '_NodePropertyButton_SnippetNameState',
            originalS: widget.originalText,
            onTextChangedF: (s) {},
            onEditingCompleteF: widget.onChangeF,
            dontAutoFocus: true,
            bgColor: Colors.white,
            inputType: widget.inputType,
            maxLines: widget.maxLines,
            options: FC().snippetsMap.keys.toList()..sort(),
          ),
        );
    Widget target(ctx) => GestureDetector(
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
            width: widget.calloutButtonSize.width,
            height: widget.calloutButtonSize.height,
            // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            // color: Colors.white70,
            // alignment: Alignment.center,
            child: labelWidget,
          ),
        );
    return target(context);
  }

// Widget buildWithWrap(BuildContext context) {
//   String textLabel = widget.originalText.isNotEmpty ? '${widget.label}: ${widget.originalText}' : '${widget.label}...';
//   Widget labelWidget = Text(
//     textLabel,
//     style: const TextStyle(color: Colors.white),
//     overflow: TextOverflow.ellipsis,
//   );
//   bool noBarrier = false;
//   CalloutConfig calloutConfig = CalloutConfig(
//     feature: 'NodePropertyButton_TextState',
//     containsTextField: true,
//     barrier: CalloutBarrier(
//       opacity: noBarrier ? 0.0 : .25,
//       onTappedF: noBarrier
//           ? null
//           : () async {
//               Callout.removeParentCallout(context);
//               // Callout? parentCallout = feature:Callout.findCallout(feature);
//               // if (parentCallout != null) Callout.removeOverlay(parentCallout.feature, true);
//             },
//     ),
//     // arrowThickness: ArrowThickness.THIN,
//     color: Colors.white,
//     arrowColor: Colors.red,
//     finalSeparation: 0.0,
//     initialCalloutAlignment: Alignment.topLeft,
//     initialTargetAlignment: Alignment.topLeft,
//     modal: false,
//     suppliedCalloutW: widget.calloutSize.width,
//     suppliedCalloutH: widget.calloutSize.height,
//     resizeableH: true,
//     resizeableV: true,
//     onDiscardedF: () {},
//     onAcceptedF: () {},
//     // containsTextField: true,
//     onResize: (Size newSize) {},
//     onDragF: (Offset newOffset) {},
//     targetTranslateX: 0,
//     targetTranslateY: 0,
//     draggable: false,
//     notUsingHydratedStorage: true,
//   );
//   Widget target(ctx) => GestureDetector(
//         onTap: () {
//           CalloutState? state = Callout.of(ctx);
//           state?.show();
//           focusNode.requestFocus();
//           },
//         child: Container(
//           key: propertyBtnGK,
//           // margin: const EdgeInsets.only(top: 8),
//           width: widget.calloutButtonSize.width,
//           height: widget.calloutButtonSize.height,
//           // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//           color: Colors.white70,
//           alignment: Alignment.center,
//           child: labelWidget ?? (widget.label != null ? Text(widget.label!) : const Offstage()),
//         ),
//       );
//   Widget boxContent(ctx) => TextEditor(
//         key: calloutChildGK,
//         prompt: 'prompt',
//         parentFeature: 'NodePropertyButton_TextState',
//         originalS: widget.originalText,
//         onTextChangedF: (s) {},
//         onEditingCompleteF: widget.onChangeF,
//         // prefixIcon: prefixIcon,
//         // minHeight: minHeight,
//         expands: true,
//         focusNode: focusNode,
//         dontAutoFocus: false,
//         bgColor: Colors.white,
//       );
//   return Callout.wrapTarget(
//     calloutConfig: calloutConfig,
//     calloutBoxContentBuilderF: boxContent,
//     targetBuilderF: target,
//   );
// }
}
