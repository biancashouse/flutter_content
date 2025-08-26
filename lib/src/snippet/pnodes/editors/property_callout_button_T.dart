import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_text_editor.dart';

class PropertyButton<T> extends StatelessWidget {
  final String originalText;
  final List<String> options;
  final String? label;
  final int maxLines;
  final bool expands;
  final Size calloutButtonSize;
  final Size calloutSize;
  // final ValueNotifier<int>? notifier;
  final bool skipLabelText;
  final bool skipHelperText;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;
  final ScrollControllerName? scName;

  const PropertyButton({
    required this.originalText,
    this.options = const [],
    this.label,
    this.maxLines = 1,
    this.expands = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    // this.notifier,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onChangeF,
    required this.propertyBtnGK,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      String editedText = originalText;
      // fco.logger.d('editedText: $editedText');
      // fco.logger.d('label: $label');
      Text textLabel() => skipLabelText
          ? fco.coloredText(editedText, color: Colors.white, fontWeight: FontWeight.bold)
          : editedText.isNotEmpty
              ? Text.rich(TextSpan(
                  text: '$label: ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                  children: [
                      TextSpan(
                          text: editedText,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]))
              : fco.coloredText('$label...', color: Colors.white, fontWeight: FontWeight.w100);
      Widget labelWidget = textLabel();
      // fco.logger.d('labelWidget: $labelWidget');
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            String inputDecorationLabel() =>
                originalText.isNotEmpty && maxLines < 2
                    ? '$label: $originalText'
                    : '$label...';
            CalloutConfigModel teCC = CalloutConfigModel(
              cId: 'te',
              scrollControllerName: scName,
              // containsTextField: true,
              barrier: CalloutBarrierConfig(
                  opacity: .25,
                  onTappedF: () {
                    fco.dismiss('matches');
                    fco.dismiss('te');
                  }),
              // arrowThickness: ArrowThickness.THIN,
              fillColor: ColorModel.white(),
              // arrowColor: Colors.red,
              arrowType: ArrowTypeEnum.THIN,
              finalSeparation: 90.0,
              toDelta: -20,
              animate: true,
              initialCalloutAlignment: AlignmentEnum.centerRight,
              initialTargetAlignment: AlignmentEnum.centerLeft,
              initialCalloutW: calloutSize.width,
              initialCalloutH: calloutSize.height,
              resizeableH: maxLines > 1,
              resizeableV: maxLines > 1,
              onDismissedF: () {},
              onAcceptedF: () {},
              // containsTextField: true,
              onResizeF: (Size newSize) {},
              onDragF: (Offset newOffset) {},
              targetTranslateX: 0,
              targetTranslateY: 0,
              draggable: false,
              notUsingHydratedStorage: true,
            );
            Widget teContent = StringOrNumberEditor(
              inputType: T,
              // key: calloutChildGK,
              prompt: () => label ?? '',
              inputDecorationLabel: inputDecorationLabel,
              originalS: editedText,
              onTextChangedF: (s) {
                editedText = s;
                fco.dismiss('matches');
                // possibly show matching options
                if ((options.isNotEmpty) &&
                    _matches(options, editedText).isNotEmpty) {
                  _showOptionMatches(
                    options,
                    editedText,
                    (s) {
                      editedText = s;
                      onChangeF(s);
                    },
                  );
                }
              },
              onEditingCompleteF: (s) {
                editedText = s;
                setState(() {});
                onChangeF(s);
                fco.dismiss('te');
              },
              dontAutoFocus: false,
              bgColor: Colors.white,
              maxLines: maxLines,
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
              targetGkF: () => propertyBtnGK,
            );
            // show options, if any
            if ((options.isNotEmpty) &&
                _matches(options, editedText).isNotEmpty) {
              _showOptionMatches(
                options,
                editedText,
                (s) {
                  editedText = s;
                  onChangeF(s);
                },
              );
            }
          },
          child: Container(
            // alignment: T != String ? Alignment.center : AlignmentEnum.centerLeft,
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
        ),
      );
    });
  }

  void _showOptionMatches(List<String> options, String editedText,
      ValueChanged<String> tappedAMatchF) {
    fco.dismiss('matches');
    // List<Widget> chips = matches
    //     .map(
    //       (m) => InkWell(
    //           onTap: () {
    //             fco.dismiss('matches');
    //             tappedAMatchF(m);
    //           },
    //           child: Chip(
    //             label: Text(m),
    //           )),
    //     )
    //     .toList();
    var matchesMenuCC = CalloutConfigModel(
      cId: 'matches',
      scrollControllerName: scName,
      initialCalloutW: 240,
      initialCalloutH: 160,
      arrowType: ArrowTypeEnum.NONE,
      fillColor: ColorModel.white(),
      initialTargetAlignment: AlignmentEnum.topRight,
      initialCalloutAlignment: AlignmentEnum.topLeft,
      draggable: false,
      // movedOrResizedNotifier: notifier,
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
                fco.dismiss('matches');
              },
            ),
          );
        },
      );
    }

    fco.showOverlay(
      calloutConfig: matchesMenuCC,
      calloutContent: matchesMenuBoxContent(matches),
      targetGkF: () => propertyBtnGK,
    );
  }

  List<String> _matches(List<String> options, String editedText) => options.where((String option) {
        return option.contains(editedText.toLowerCase());
      }).toList();
}
