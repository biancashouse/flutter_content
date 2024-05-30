import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_text_editor.dart';

class PropertyButton<T> extends StatelessWidget {
  final String originalText;
  final List<String>? options;
  final String? label;
  final int maxLines;
  final bool expands;
  final Size calloutButtonSize;
  final Size calloutSize;
  final ValueNotifier<int>? notifier;
  final bool skipLabelText;
  final bool skipHelperText;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;

  const PropertyButton({
    required this.originalText,
    this.options,
    this.label,
    this.maxLines = 1,
    this.expands = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.notifier,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onChangeF,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
      String editedText = originalText;
      // print('editedText: $editedText');
      // print('label: $label');
      String textLabel() => skipLabelText
          ? editedText ?? ''
          : (editedText ?? '').isNotEmpty
          ? '$label: $editedText'
          : '$label...';
      Widget labelWidget = Text(
        textLabel(),
        style: const TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      );
      // print('labelWidget: $labelWidget');
      return GestureDetector(
        onTap: () {
          String inputDecorationLabel() => originalText.isNotEmpty && maxLines < 2 ? '$label: $originalText' : '$label...';
          CalloutConfig teCC = CalloutConfig(
            feature: 'te',
            containsTextField: true,
            barrier: CalloutBarrier(
                opacity: .25,
                onTappedF: () {
                  Callout.dismiss('matches');
                  Callout.dismiss('te');
                }),
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
          Callout.showOverlay(
            calloutConfig: teCC,
            boxContentF: (_) => FC_TextField(
              inputType: T,
              // key: calloutChildGK,
              prompt: () => label ?? '',
              inputDecorationLabel: inputDecorationLabel,
              parentFeature: 'te',
              originalS: editedText ?? '',
              onTextChangedF: (s) {
                editedText = s;
                Callout.dismiss('matches');
                // possibly show matching options
                if ((options?.isNotEmpty ?? false) && _matches(options, editedText).isNotEmpty) {
                  _showOptionMatches(
                    options!,
                    editedText ?? '',
                        (s) {
                      editedText = s;
                      onChangeF(s);
                    },
                  );
                }
              },
              onEditingCompleteF: (s) {
                editedText = s;
                setState((){});
                onChangeF(s);
              },
              dontAutoFocus: false,
              bgColor: Colors.white,
              maxLines: maxLines,
            ),
            targetGkF: () => propertyBtnGK,
          );
          // show options, if any
          if ((options?.isNotEmpty ?? false) && _matches(options, editedText).isNotEmpty) {
            _showOptionMatches(
              options!,
              editedText ?? '',
                  (s) {
                editedText = s;
                onChangeF(s);
              },
            );
          }
        },
        child: Container(
          // alignment: T != String ? Alignment.center : Alignment.centerLeft,
          alignment: Alignment.centerLeft,
          key: propertyBtnGK,
          // margin: const EdgeInsets.only(top: 8),
          width: calloutButtonSize.width,
          height: calloutButtonSize.height,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          // color: Colors.white70,
          // alignment: Alignment.center,
          child: labelWidget,
        ),
      );
    });
  }

  void _showOptionMatches(List<String> options, String editedText, ValueChanged<String> tappedAMatchF) {
    Callout.dismiss('matches');
    // List<Widget> chips = matches
    //     .map(
    //       (m) => InkWell(
    //           onTap: () {
    //             Callout.dismiss('matches');
    //             tappedAMatchF(m);
    //           },
    //           child: Chip(
    //             label: Text(m),
    //           )),
    //     )
    //     .toList();
    var matchesMenuCC = CalloutConfig(
      feature: 'matches',
      suppliedCalloutW: 240,
      suppliedCalloutH: 160,
      arrowType: ArrowType.NO_CONNECTOR,
      fillColor: Colors.white,
      initialTargetAlignment: Alignment.topRight,
      initialCalloutAlignment: Alignment.topLeft,
      draggable: false,
      movedOrResizedNotifier: notifier,
    );
    List<String> matches = _matches(options, editedText);
    Widget matchesMenuBoxContent(matches) {
      // return Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: Wrap(
      //     children: chips,
      //   ),
      // );
      return ListView.builder(
        itemCount: matches.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.centerLeft,
            // height: H,
            child: ListTile(
              title: Text(matches[index]),
              onTap: () {
                tappedAMatchF(matches[index]);
                Callout.dismiss('matches');
              },
            ),
          );
        },
      );
    }

    Callout.showOverlay(
      calloutConfig: matchesMenuCC,
      boxContentF: (_) => matchesMenuBoxContent(matches),
      targetGkF: () => propertyBtnGK,
    );
  }

  List<String> _matches(options, editedText) => options.where((String option) {
        return option.contains(editedText.toLowerCase());
      }).toList();
}
