import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart' hide Line;
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/help_icon_embed.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_text_toolbar/quill_text_toolbar.dart';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';

/// A Quill editor widget that shows a red border when focused and triggers
/// an `onChange` callback only when focus is lost and content has changed.
class FocusAwareQuillEditor extends StatefulWidget {
  final QuillTextNode parentSNode;
  final String uid;

  /// The initial content for the editor, as a JSON string.
  final String originalDeltaJsonString;

  /// A callback that fires when the editor loses focus and the content
  /// has been modified. The new content is provided as a JSON string.
  final Function(String, {bool forceRefresh}) onChange;

  const FocusAwareQuillEditor({
    required this.parentSNode,
    required this.uid,
    required this.originalDeltaJsonString,
    required this.onChange,
    super.key,
  });

  @override
  State<FocusAwareQuillEditor> createState() => _FocusAwareQuillEditorState();
}

class _FocusAwareQuillEditorState extends State<FocusAwareQuillEditor> {

  // bool _hasFocus = false;
  bool _isDirty = false;
  int _numEmbeds = 0;
  TextSelection _currSel = const TextSelection.collapsed(offset: 0);

  late QuillController _controller;
  late FocusNode _focusNode;
  late ScrollController _scrollController;

  late SnippetRootNode? _rootNode;

  @override
  void initState() {
    super.initState();
    _controller = _initializeController();
    _focusNode = FocusNode();
    _scrollController = ScrollController();

    _controller.document.changes.listen((_) => _textListener());
    _focusNode.addListener(_focusListener);
    _rootNode = widget.parentSNode.rootNodeOfSnippet();
  }

  @override
  void didUpdateWidget(FocusAwareQuillEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.originalDeltaJsonString != oldWidget.originalDeltaJsonString) {
      _controller.dispose();
      _controller = _initializeController();
      _controller.document.changes.listen((_) => _textListener());
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusListener);
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  QuillController _initializeController() {
    try {
      final doc = Document.fromJson(jsonDecode(widget.originalDeltaJsonString));
      return QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
        onSelectionChanged: (sel) {
          if (mounted) {
            setState(() => _currSel = sel);
          }
        },
      );
    } catch (e) {
      return QuillController.basic();
    }
  }

  void _textListener() {
    _isDirty = true;

    final deltaJson = jsonEncode(_controller.document.toDelta().toJson());
    final newNumUids = QuillTextNode.getTargetList(deltaJson).length;
    final oldNumUids = _numEmbeds;

    bool deletedAnEmbed = (newNumUids < oldNumUids);

    if (deletedAnEmbed) {
      if (mounted) {
        setState(() => _numEmbeds = newNumUids);
      }
      _isDirty = false;
      widget.onChange(deltaJson, forceRefresh: true);
    }

    // notifyChange();
    //
    // fco.afterNextBuildDo(() {
    //   _focusNode.requestFocus();
    //   _controller.updateSelection(_currSel, ChangeSource.local);
    // });
  }

  void _focusListener() {
    if (!_focusNode.hasFocus) {
      // LOST FOCUS
      if (_isDirty) {
        final newJson = jsonEncode(_controller.document.toDelta().toJson());
        widget.onChange(newJson);
        _isDirty = false;
      }
      // if (fco.focussedCId.value != null) {
      //   fco.dismiss(fco.focussedCId.value!);
      //   // fco.focussedCId.value = null;
      // }
      // if (fco.focussedFN != _focusNode) {
      //   fco.focussedFN!.unfocus();
      // }
    } else {
      // GAINED FOCUS
      if (fco.quillTextToolbarCIDVN.value != widget.parentSNode.quillTextToolbarCID) {
        if (fco.quillTextToolbarCIDVN.value != null) {
          fco.dismiss(fco.quillTextToolbarCIDVN.value!);
        }
        fco.quillTextToolbarCIDVN.value = widget.parentSNode.quillTextToolbarCID;
        QuillTextToolbar.show(
          parentSNode: widget.parentSNode,
          focusNode: _focusNode,
          controller: _controller,
        );
      }
      //)
      // if (fco.focussedFN != _focusNode) {
      //   fco.focussedFN?.unfocus();
      //   fco.focussedFN = _focusNode;
      // }
    }
  }

  // void notifyChange() {
  // final newJson = jsonEncode(_controller.document.toDelta().toJson());
  // widget.onChange(newJson);
  // widget.parentSNode.deltaJsonString = newJson;
  // // notify changes
  // if (_rootNode != null) {
  //   SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(
  //     _rootNode!.name,
  //   );
  //   // snippetInfo?.getChangeNotifier().value = _rootNode!.toJson();
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CalloutId?>(
      valueListenable: fco.quillTextToolbarCIDVN,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (_focusNode.hasFocus) _toolbars(_focusNode, _controller),
            Container(
              padding: const EdgeInsets.only(
                top: 4,
                left: 4,
                right: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _focusNode.hasFocus
                      ? Colors.purpleAccent
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: _quillEditor(_focusNode, _scrollController, _controller),
            ),
          ],
        );
      },
    );
  }

  Widget _toolbars(FocusNode focusNode, QuillController controller) =>
      IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: Container(
          color: Colors.purpleAccent,
          child: QuillSimpleToolbar(
            controller: controller,
            config: QuillSimpleToolbarConfig(
              decoration: const BoxDecoration(color: Colors.purpleAccent),
              toolbarIconAlignment: WrapAlignment.start,
              toolbarIconCrossAlignment: WrapCrossAlignment.start,
              showClipboardCopy: true,
              showClipboardPaste: true,
              showSubscript: false,
              showSuperscript: false,
              showStrikeThrough: false,
              showListCheck: false,
              showInlineCode: false,
              showCodeBlock: false,
              showIndent: false,
              showLink: false,
              showSearchButton: false,
              customButtons: [_helpIconBtn(controller)],
              buttonOptions: QuillSimpleToolbarButtonOptions(
                // base: QuillToolbarBaseButtonOptions(
                //   afterButtonPressed: () {
                //     final isDesktop = {
                //       TargetPlatform.linux,
                //       TargetPlatform.windows,
                //       TargetPlatform.macOS,
                //     }.contains(defaultTargetPlatform);
                //     if (isDesktop) {
                //       focusNode.requestFocus();
                //     }
                //   },
                // ),
                linkStyle: QuillToolbarLinkStyleButtonOptions(
                  validateLink: (link) => true,
                ),
                fontFamily: QuillToolbarFontFamilyButtonOptions(
                  items: {
                    'merriweather': GoogleFonts.merriweather().fontFamily!,
                    'hand-writing': GoogleFonts.damion().fontFamily!,
                  },
                ),
              ),
            ),
          ),
        ),
      );

  QuillToolbarCustomButtonOptions _helpIconBtn(QuillController controller) =>
      QuillToolbarCustomButtonOptions(
        icon: SizedBox(
          width: 30,
          child: Stack(
            children: const [
              Icon(Icons.info_outline_rounded, size: 20),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Icon(Icons.add, size: 10, color: Colors.white),
              ),
            ],
          ),
        ),
        tooltip: 'Insert a help Button',
        onPressed: () {
          QuillTargetModel? qt = _createQuillTarget();
          if (qt == null) return;

          final index = controller.selection.baseOffset;
          final length = controller.selection.extentOffset - index;

          controller.replaceText(
            index,
            length,
            BlockEmbed.custom(
              CustomBlockEmbed(
                'quill-help-icon-button',
                jsonEncode(qt.toMap()),
              ),
            ),
            null,
          );

          // widget.parentSNode.deltaJsonString = jsonEncode(
          //   controller.document.toDelta().toJson(),
          // );

          widget.onChange(
            jsonEncode(controller.document.toDelta().toJson()),
            forceRefresh: true,
          );

          //)
          // var snippet = widget.parentSNode.rootNodeOfSnippet();
          // if (snippet != null) {
          //   fco.modelRepo.saveNewVersionOfSnippet(snippet);
          // }
        },
      );

  QuillEditor _quillEditor(
    FocusNode focusNode,
    ScrollController scrollController,
    QuillController controller,
  ) => QuillEditor(
    focusNode: focusNode,
    scrollController: scrollController,
    controller: controller,
    config: QuillEditorConfig(
      placeholder: 'Start writing...',
      padding: const EdgeInsets.all(16),
      embedBuilders: [
        HelpIconEmbedBuilder(parentSNode: widget.parentSNode),
        // TimeStampEmbedBuilder(),
      ],
      // onTapOutsideEnabled: true,
      // onTapOutside: (_, _) {
      //   fco.focussedCId.value = null;
      // },
    ),
  );

  QuillTargetModel? _createQuillTarget() {
    if (!fco.canEditContent()) return null;

    TargetId newTargetId = DateTime.now().millisecondsSinceEpoch;
    return QuillTargetModel(
      uid: newTargetId,
      calloutDurationMs: 2000,
      calloutFillColors: UpTo6Colors(color1: ColorModel.white()),
      targetPointerTypeEnum: TargetPointerTypeEnum.WAVY,
    );
  }
}
