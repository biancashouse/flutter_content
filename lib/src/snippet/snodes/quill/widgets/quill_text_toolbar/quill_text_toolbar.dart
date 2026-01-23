import 'dart:convert';

import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class QuillTextToolbar extends StatefulWidget {
  final CalloutId cid;
  final QuillTextNode parentSNode;
  final FocusNode focusNode;
  final QuillController controller;

  const QuillTextToolbar({
    required this.cid,
    required this.parentSNode,
    required this.focusNode,
    required this.controller,

    super.key,
  });

  static show({
    required CalloutId cid,
    required QuillTextNode parentSNode,
    required FocusNode focusNode,
    required QuillController controller,
  }) {
    fco.showOverlay(
      onReadyF: () {},
      calloutConfig: CalloutConfig(
        cId: cid,

        decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
        initialCalloutW: 1200,
        initialCalloutH: 90,
        decorationShape: DecorationShape.rounded_rectangle(),
        decorationBorderRadius: 16,
        animatePointer: false,
        targetPointerType: TargetPointerType.none(),
        initialCalloutPos: OffsetModel.fromOffset(fco.quillTextToolbarPos()),
        onDragEndedF: (newPos) {
          fco.setQuillTextToolbarPos(newPos);
        },
        dragHandleHeight: 30,
        followScroll: false,
        onDismissedF: () {},
      ),
      calloutContent: QuillTextToolbar(
        cid: cid,
        parentSNode: parentSNode,
        focusNode: focusNode,
        controller: controller,
      ),
    );
  }

  @override
  State<QuillTextToolbar> createState() => QuillTextToolbarState();
}

class QuillTextToolbarState extends State<QuillTextToolbar> {
  // @override
  @override
  Widget build(BuildContext context) {

    // final name = widget.parentSNode.rootNodeOfSnippet()?.name;
    // final snippetInfo = fco.appInfo.cachedSnippetInfo(name!);
    // ValueNotifier<String>? notifier = snippetInfo?.getChangeNotifier();
    // IconData? closeOrSaveIcon(String newDeltaJson) => snippetInfo!.changesPending(newDeltaJson)
    //     ? Icons.save : Icons.close;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        toolbarVFlipIcon(),
        const VerticalDivider(color: Colors.white, width: 2),

        IconTheme(
          data: const IconThemeData(color: Colors.white),
          child: Container(
            color: Colors.purpleAccent,
            child: QuillSimpleToolbar(
              controller: widget.controller,
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
                customButtons: [_helpIconBtn(widget.controller)],
                buttonOptions: QuillSimpleToolbarButtonOptions(
                  base: QuillToolbarBaseButtonOptions(
                    afterButtonPressed: () {
                      final isDesktop = {
                        TargetPlatform.linux,
                        TargetPlatform.windows,
                        TargetPlatform.macOS,
                      }.contains(defaultTargetPlatform);
                      if (isDesktop) {
                        widget.focusNode.requestFocus();
                      }
                    },
                  ),
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
        ),

        const VerticalDivider(color: Colors.white, width: 2),
        IconButton(
          tooltip: 'close this toolbar',
          icon: const Icon(Icons.close, color: Colors.white),
          // icon: ValueListenableBuilder(
          //   valueListenable: notifier!,
          //   builder: (context, value, child) {
          //     return Icon(
          //         closeOrSaveIcon(value),
          //         color: Colors.white);
          //   }
          // ),
          onPressed: () {
            final rootNode = widget.parentSNode.rootNodeOfSnippet();
            if (rootNode != null) {
              // notify possible changes to the quill text (controller)
              final snippetInfo = fco.appInfo.cachedSnippetInfo(rootNode.name);
              ValueNotifier<String>? notifier = snippetInfo?.getChangeNotifier();
              notifier?.value = rootNode.toJson();
            }
            fco.dismiss(widget.cid, skipOnDismiss: true);
            fco.focussedCId.value = null;
          },
        ),
        const VerticalDivider(color: Colors.white, width: 2),
        toolbarVFlipIcon(),
      ],
    );
  }

  Widget toolbarVFlipIcon() => IconButton(
    onPressed: () {
      fco.dismiss(widget.cid, skipOnDismiss: true);
      fco.quillTextToolbarAtTopOfScreen = !fco.quillTextToolbarAtTopOfScreen;
      QuillTextToolbar.show(
        cid: widget.cid,
        parentSNode: widget.parentSNode,
        focusNode: widget.focusNode,
        controller: widget.controller,
      );
    },
    icon: Icon(
      fco.quillTextToolbarAtTopOfScreen
          ? Icons.arrow_downward
          : Icons.arrow_upward,
      color: Colors.white70,
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

          widget.parentSNode.deltaJsonString = jsonEncode(
            controller.document.toDelta().toJson(),
          );

          var snippet = widget.parentSNode.rootNodeOfSnippet();
          if (snippet != null) {
            fco.modelRepo.saveNewVersionOfSnippet(snippet);
          }
        },
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
