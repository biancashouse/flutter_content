import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_content/flutter_content.dart';

class PropertyButton<T> extends HookWidget {
  final String originalText;
  final List<String> options;
  final String? label;
  final int maxLines;
  final bool expands;
  final Size calloutButtonSize;
  final Size calloutSize;
  final bool skipLabelText;
  final bool skipHelperText;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;

  const PropertyButton({
    required this.originalText,
    this.options = const [],
    this.label,
    this.maxLines = 1,
    this.expands = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onChangeF,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final editedText = useState(originalText);

    useEffect(() {
      editedText.value = originalText;
      return null; // No cleanup needed
    }, [originalText]);

    Widget textLabel() => skipLabelText
        ? fco.coloredText(editedText.value, color: Colors.white, fontWeight: FontWeight.bold)
        : editedText.value.isNotEmpty
            ? Text.rich(TextSpan(
                text: '$label: ',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                children: [
                  TextSpan(
                    text: editedText.value,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ))
            : fco.coloredText('$label...', color: Colors.white, fontWeight: FontWeight.w100);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          String inputDecorationLabel() => originalText.isNotEmpty && maxLines < 2
              ? '$label: $originalText'
              : '$label...';

          final teCC = CalloutConfig(
            cId: 'te',
            barrier: CalloutBarrierConfig(
              opacity: .25,
              onTappedF: () {
                fco.dismiss('matches');
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
            initialCalloutW: calloutSize.width,
            initialCalloutH: calloutSize.height,
            resizeableH: maxLines > 1,
            resizeableV: maxLines > 1,
          );

          final teContent = StringOrNumberEditor(
            inputType: T,
            prompt: () => label ?? '',
            inputDecorationLabel: inputDecorationLabel,
            originalS: editedText.value,
            onTextChangedF: (s) {
              editedText.value = s;
              fco.dismiss('matches');
              if (options.isNotEmpty && _matches(options, s).isNotEmpty) {
                _showOptionMatches(
                  context,
                  options,
                  s,
                  (selected) {
                    editedText.value = selected;
                    onChangeF(selected);
                  },
                  propertyBtnGK,
                );
              }
            },
            onEditingCompleteF: (s) {
              editedText.value = s;
              onChangeF(s);
              fco.dismiss('matches');
              fco.dismiss('te');
            },
            dontAutoFocus: false,
            bgColor: Colors.white,
            maxLines: maxLines,
          );

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

          if (options.isNotEmpty && _matches(options, editedText.value).isNotEmpty) {
            _showOptionMatches(
              context,
              options,
              editedText.value,
              (selected) {
                editedText.value = selected;
                onChangeF(selected);
              },
              propertyBtnGK,
            );
          }
        },
        child: Container(
          alignment: Alignment.centerLeft,
          key: propertyBtnGK,
          width: calloutButtonSize.width,
          height: calloutButtonSize.height,
          child: textLabel(),
        ),
      ),
    );
  }

  void _showOptionMatches(
    BuildContext context,
    List<String> options,
    String currentText,
    ValueChanged<String> onSelected,
    GlobalKey targetGK,
  ) {
    fco.dismiss('matches');
    final matches = _matches(options, currentText);
    if (matches.isEmpty) return;

    final matchesMenuCC = CalloutConfig(
      cId: 'matches',
      initialCalloutW: 240,
      initialCalloutH: 160,
      targetPointerType: TargetPointerType.none(),
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      initialTargetAlignment: Alignment.topRight,
      initialCalloutAlignment: Alignment.topLeft,
      draggable: false,
    );

    Widget matchesMenuBoxContent() {
      return ListView.builder(
        itemCount: matches.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(matches[index]),
            onTap: () {
              onSelected(matches[index]);
              fco.dismiss('matches');
            },
          );
        },
      );
    }

    fco.showOverlay(
      calloutConfig: matchesMenuCC,
      calloutContent: matchesMenuBoxContent(),
      targetGK: targetGK,
    );
  }

  List<String> _matches(List<String> options, String text) =>
      options.where((o) => o.toLowerCase().contains(text.toLowerCase())).toList();
}
