import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/text_styles/style_name_editor.dart';
import 'package:flutter_content/src/text_styles/text_style_suggestions.dart';

class TextStyleNameSearchAnchor extends StatefulWidget {
  final CalloutId? parentCId;
  final TextStyleProperties textStyle;
  final StyleNameChangeCallback onHoveredF;
  final StyleNameChangeCallback onSelectionF;
  final DebounceTimer debounceTimer;
  final String tooltipMsg;

  const TextStyleNameSearchAnchor({
    this.parentCId,
    required this.textStyle,
    required this.onHoveredF,
    required this.onSelectionF,
    required this.debounceTimer,
    required this.tooltipMsg,
    super.key,
  });

  static TextStyleNameSearchAnchorState? of(BuildContext context) {
    if (!context.mounted) {
      fco.logger.i('context not mounted!');
    }
    var result = context.findAncestorStateOfType<TextStyleNameSearchAnchorState>();
    if (result == null) {
      fco.logger.i('SearchAnchor not found!');
    }
    return result;
  }

  @override
  // ignore: no_logic_in_create_state
  State<TextStyleNameSearchAnchor> createState() => TextStyleNameSearchAnchorState();
}

class TextStyleNameSearchAnchorState extends State<TextStyleNameSearchAnchor> {
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
    originalStyleName = fco.findTextStyleName(widget.textStyle);
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
        showSuggestionsOverlay();
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
            widget.textStyle.lastSearchString = s;
            dismissSuggestionsOverlay();
            showSuggestionsOverlay();
          },
          onEditingCompleteF: () {},
          label: 'Text Style Search',
          tooltip: widget.tooltipMsg,
        ),
      ),
    );
  }

  void showSuggestionsOverlay() {
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
            child: TextStyleNameSuggestions(
              anchorContext: context,
              searchString: searchStringTEC.text, //widget.textStyle.lastSearchString??'',
              suggestions: fco.namedTextStyles.keys.toList(),
              onHoverF: (hoveredTextStyleName) {
                if (widget.textStyle.lastHoveredSuggestion != hoveredTextStyleName) {
                  widget.debounceTimer.run(() {
                    if (widget.parentCId == null || fco.anyPresent([
                      widget.parentCId!
                    ])) {
                      setState(() {
                        fco.logger.d('onHoverF - suggestedTextStyleName = $hoveredTextStyleName');
                        widget.textStyle.lastHoveredSuggestion = hoveredTextStyleName;
                        fco.afterNextBuildDo(() {
                          widget.onHoveredF(hoveredTextStyleName);
                        });
                      });
                    }
                  });
                }
              },
              onSelectionF: (selectedTextStyleName) {
                setState(() {
                  fco.logger.d('onSelectionF - suggestedTextStyleName = $selectedTextStyleName');
                  madeASelection = true;
                  widget.debounceTimer.cancel();
                  // widget.searchStringTEC.text = suggestedTextStyleName;
                  widget.onSelectionF(selectedTextStyleName);
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
