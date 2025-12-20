import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_text_editor.dart';

class PropertyButtonSize extends HookWidget {
  final (double?, double?) originalSize;
  final String? label;
  final bool skipLabelText;
  final bool skipHelperText;
  final GlobalKey propertyBtnGK;
  final ValueChanged<(double?, double?)> onSizeChange;

  const PropertyButtonSize({
    required this.originalSize,
    this.label,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onSizeChange,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final editedText = useState(
      originalSize.$1 == null && originalSize.$2 == null
          ? ''
          : '${originalSize.$1}, ${originalSize.$2}',
    );

    useEffect(() {
      editedText.value = originalSize.$1 == null && originalSize.$2 == null
          ? ''
          : '${originalSize.$1}, ${originalSize.$2}';
      return null;
    }, [originalSize]);

    Widget textLabel() =>
        skipLabelText
            ? fco.coloredText(
          editedText.value,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )
            : editedText.value.isNotEmpty
            ? Text.rich(
          TextSpan(
            text: '$label: ',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
            ),
            children: [
              TextSpan(
                text: editedText.value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
            : fco.coloredText(
          '$label...',
          color: Colors.white,
          fontWeight: FontWeight.w100,
        );
    Widget labelWidget = textLabel();
    // fco.logger.d('labelWidget: $labelWidget');
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          CalloutConfig teCC = CalloutConfig(
            cId: 'te',
            barrier: CalloutBarrierConfig(
              opacity: .25,
              onTappedF: () {
                fco.dismiss('te');
              },
            ),
            decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
            targetPointerType: TargetPointerType.thin_line(),
            finalSeparation: 90.0,
            toDelta: -20,
            animatePointer: true,
            initialCalloutAlignment: Alignment.centerRight,
            initialTargetAlignment: Alignment.centerLeft,
            initialCalloutW: 200,
            initialCalloutH: 60,
            onDismissedF: () {},
            onAcceptedF: () {},
            // containsTextField: true,
            onResizeF: (Size newSize) {},
            onDragF: (Offset newOffset) {},
            targetTranslateX: 0,
            targetTranslateY: 0,
            draggable: false,
          );
          Widget teContent = StringOrNumberEditor(
            inputType: String,
            // key: calloutChildGK,
            prompt: () => label ?? '',
            // inputDecorationLabel: () => '$label: ${editedText.value}',
            originalS: editedText.value,
            onTextChangedF: (s) {
              // No need to update state on every change
            },
            onEditingCompleteF: (s) {
              (double?, double?) size = _stringToSize(s);
              // if ((size.$1 == null && size.$2 == null) ||
              //     (size.$1 != null && size.$2 != null)) {
                editedText.value = s;
                onSizeChange(size);
                fco.dismiss('te');
              // }
            },
            dontAutoFocus: false,
            bgColor: Colors.white,
            maxLines: 1,
          );
          if (teCC.calloutH != null && teCC.calloutH! > 400) {
            teCC.initialCalloutH = teCC.calloutH = 200;
          }
          fco.showOverlay(
            calloutConfig: teCC,
            calloutContent: teCC.calloutH != null && teCC.calloutH! > 400
                ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [teContent],
              ),
            )
                : teContent,
            targetGK: propertyBtnGK,
          );
        },
        // onDoubleTap: () {},
        child: Container(
          // alignment: T != String ? Alignment.center : AlignmentEnumModel.centerLeft,
          alignment: Alignment.centerLeft,
          key: propertyBtnGK,
          // margin: const EdgeInsets.only(top: 8),
          width: 280,
          height: 30,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          // color: Colors.white70,
          // alignment: Alignment.center,
          child: labelWidget,
        ),
      ),
    );
  }

  /// A helper function to parse a string into 2 doubles.
  /// If either double is null, means not valid: reject
  (double?, double?) _stringToSize(String s) {
    s = s.trim();
    if (s.isEmpty) {
      return (null, null);
    }
    // Allow comma or space as a separator.
    final parts = s
        .split(RegExp(r'[,\s]+'))
        .where((p) => p.isNotEmpty)
        .toList();

    if (parts.isEmpty) {
      return (null, null);
    }

    double? w;
    double? h;

    if (parts[0] != 'null') {
      w = double.tryParse(parts[0]);
    }
    if (parts.length == 1) {
      return (w, null);
    } else {
      if (parts[1] != 'null') {
        h = double.tryParse(parts[1]);
      }
    }
    return (w, h);
  }

}