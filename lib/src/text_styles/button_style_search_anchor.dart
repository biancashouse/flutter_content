import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/text_styles/button_style_suggestions.dart';
import 'package:flutter_content/src/text_styles/style_name_editor.dart';

class ButtonStyleNameSearchAnchor extends StatefulWidget {
  final CalloutId? parentCId;
  final ButtonStyleProperties buttonStyle;
  final StyleNameChangeCallback onHoveredF;
  final StyleNameChangeCallback onSelectionF;
  final Debouncer debouncer;
  final String tooltipMsg;

  const ButtonStyleNameSearchAnchor({
    this.parentCId,
    required this.buttonStyle,
    required this.onHoveredF,
    required this.onSelectionF,
    required this.debouncer,
    required this.tooltipMsg,
    super.key,
  });

  static ButtonStyleNameSearchAnchorState? of(BuildContext context) {
    if (!context.mounted) {
      fco.logger.i('context not mounted!');
    }
    var result = context.findAncestorStateOfType<ButtonStyleNameSearchAnchorState>();
    if (result == null) {
      fco.logger.i('SearchAnchor not found!');
    }
    return result;
  }

  @override
  // ignore: no_logic_in_create_state
  State<ButtonStyleNameSearchAnchor> createState() => ButtonStyleNameSearchAnchorState();
}

class ButtonStyleNameSearchAnchorState extends State<ButtonStyleNameSearchAnchor> {
  final layerLink = LayerLink();
  OverlayEntry? entry;
  late TextEditingController searchStringTEC;
  final FocusNode focusNode = FocusNode();

  String? originalStyleName;
  late bool madeASelection;

  @override
  void initState() {
    super.initState();
    madeASelection = false;
    originalStyleName = fco.findButtonStyleName(fco.appInfo, widget.buttonStyle);
    searchStringTEC = TextEditingController(text: originalStyleName);
  }

  @override
  void dispose() {
    super.dispose();
    dismissSuggestionsOverlay();
    if (!madeASelection) {
      widget.onSelectionF(originalStyleName);
    }
  }

  @override
  Widget build(BuildContext context) {
    fco.afterMsDelayDo(50, () {
      focusNode.requestFocus();
    });
    return TapRegion(
      onTapInside: (e) {
        showButtonStyleSuggestionsOverlay();
      },
      // onTapOutside: (e) {
      //   dismissSuggestionsOverlay();
      // },
      child: CompositedTransformTarget(
        link: layerLink,
        child: StyleNameEditor(
          teC: searchStringTEC,
          focusNode: focusNode,
          onChangeF: (s) {
            widget.buttonStyle.lastSearchString = s;
            dismissSuggestionsOverlay();
            showButtonStyleSuggestionsOverlay();
          },
          onEditingCompleteF: () {},
          label: 'Button Style Search',
          tooltip: widget.tooltipMsg,
        ),
      ),
    );
  }

  void showButtonStyleSuggestionsOverlay() {
    if (entry == null) {
      fco.logger.d('showSuggestionsOverlay()');
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      entry = OverlayEntry(builder: (_) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + renderBox.size.height + 16,
          width: renderBox.size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, renderBox.size.height),
            child: ButtonStyleNameSuggestions(
              anchorContext: context,
              searchString: searchStringTEC.text, //widget.textStyle.lastSearchString??'',
              suggestions: fco.namedButtonStyles.keys.toList(),
              onHoverF: (hoveredButtonStyleName) {
                if (widget.buttonStyle.lastHoveredSuggestion != hoveredButtonStyleName) {
                  widget.debouncer.run(() {
                    if (widget.parentCId == null || fco.anyPresent([
                      widget.parentCId!
                    ])) {
                      setState(() {
                        fco.logger.d('onHoverF - suggestedButtonStyleName = $hoveredButtonStyleName');
                        widget.buttonStyle.lastHoveredSuggestion = hoveredButtonStyleName;
                        fco.afterNextBuildDo(() {
                          widget.onHoveredF(hoveredButtonStyleName);
                        });
                      });
                    }
                  });
                }
              },
              onSelectionF: (selectedButtonStyleName) {
                setState(() {
                  madeASelection = true;
                  widget.debouncer.cancel();
                  // widget.searchStringTEC.text = suggestedTextStyleName;
                  widget.onSelectionF(selectedButtonStyleName);
                  dismissSuggestionsOverlay();
                  if (widget.parentCId != null) {
                    fco.dismiss(widget.parentCId!);
                  }
                });
              },
            ),
          ),
        );
      });
      Overlay.of(context).insert(entry!);
    } else {
      fco.logger.d('showSuggestionsOverlay() SKIPPED');
    }
  }

  void dismissSuggestionsOverlay() {
    if (entry != null) {
      entry!.remove();
      entry = null;
    }
  }

  bool get isShowingSuggestionsOverlay => entry != null;
}
