import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_content/flutter_content.dart' hide Line;

import 'quill_target_config_toolbar/quill_target_config_toolbar.dart' show QuillTargetConfigToolbar;

class HelpIconEmbedBuilder implements EmbedBuilder {
  final QuillTextNode parentSNode;

  const HelpIconEmbedBuilder({required this.parentSNode});

  @override
  String get key => 'quill-help-icon-button'; // The unique ID for this embed type

  @override
  Widget build(
    BuildContext context,
    EmbedContext embedContext, // All properties are now inside here
  ) {
    print('HelpIconEmbedBuilder');

    // Access data through the embedContext
    final node = embedContext.node;
    final controller = embedContext.controller;
    final readOnly = embedContext.readOnly;

    // data is the QuillTargetModel
    late QuillTargetModel qt;
    try {
      final Map<String, dynamic> data = jsonDecode(node.value.data);
      qt = QuillTargetModelMapper.fromMap(data);
    } catch (e) {
      return const Icon(Icons.error, color: Colors.red);
    }

    final sc = fco.findAncestorScrollConfig(context);

    // var targets = parentSNode.getTargetList();

    return WrappedCallout(
      calloutConfig: qt.createCalloutConfig(),
      calloutBoxContentBuilderF: (context) =>
          qt.possiblyEditableContent(justPlaying: true),
      targetBuilderF: (targetCtx) => Tooltip(
        message: 'tap to learn more',
        child: InkWell(
          onTap: () {
            // prevent configuring targets when overlay is open
            if (fco.anyPresent(['quill-te', QuillTargetConfigToolbar.CID])) return;
            // play target
            // qt.showContentCallout(
            //   parentQuillTextNode: parentSNode,
            //   justPlaying: true,
            //   onTargetConfigChange: (_) {},
            // );
            CalloutConfig? contentCC = fco.findCalloutConfig(qt.contentCId);
            Alignment optimalAl = _getOptimalAlignment(targetCtx, sc);
            contentCC?.targetAlignment = optimalAl;
            contentCC?.calloutAlignment = -optimalAl;
            contentCC?.barrier = CalloutBarrierConfig(
              color: Colors.black,
              opacity: .8,
              excludeTargetFromBarrier: true,
              roundExclusion: true,
              dismissible: false,
            );
            WrappedCallout.unhideParentCallout(
              targetCtx,
              hideAfterMs: qt.calloutDurationMs,
            );
            // fco.unhide(qt.contentCId);
            // fco.afterMsDelayDo(qt.calloutDurationMs, () {
            //   fco.hide(qt.contentCId);
            // });
          },
          onDoubleTap: () {
            // prevent configuring targets when overlay is open
            if (fco.anyPresent(['quill-te', QuillTargetConfigToolbar.CID])) return;
            if (readOnly) return; // Don't allow updates in read-only mode.
            if (!fco.canEditContent()) return;
            // configure target
            CalloutConfig? contentCC = fco.findCalloutConfig(qt.contentCId);
            Alignment optimalAl = _getOptimalAlignment(targetCtx, sc);
            contentCC?.targetAlignment = optimalAl;
            contentCC?.calloutAlignment = -optimalAl;
            contentCC?.barrier = null;
            WrappedCallout.unhideParentCallout(targetCtx);
            qt.showConfigToolbar(
              parentNode: parentSNode,
              scrollConfig: sc,
              onTargetConfigChange: (updatedTargetConfig) {
                _updateParentQuillTextNode(
                  updatedTargetConfig: updatedTargetConfig,
                  parentSNode: parentSNode,
                  targetCtx: targetCtx,
                );
              },
              onTargetConfigRemove: (qt) => _updateParentQuillTextNode(
                updatedTargetConfig: qt,
                parentSNode: parentSNode,
                deleteTarget: true,
              ),
            );
          },
          child: Icon(Icons.info_outline_rounded, size: 18),
        ),
      ),
    );
  }

  Rect? _getTargetRect(BuildContext targetCtx) {
    RenderObject? renderObject;
    Rect? paintBounds;
    try {
      renderObject = targetCtx.findRenderObject();

      if (renderObject == null) {
        fco.logger.i('GlobalKeyExtension: findRenderObject returned null.');
        return null;
      }
      paintBounds = renderObject.paintBounds;

      final translation = renderObject.getTransformTo(null).getTranslation();

      final offset = Offset(translation.x, translation.y);
      return paintBounds.shift(offset);
    } catch (e) {
      fco.logger.i('paintBounds = renderObject?.paintBounds - ${e.toString()}');
      return null;
    }
  }

  Alignment _getOptimalAlignment(BuildContext targetCtx, ScrollConfig? sc) {
    var screenCenterPos = fco.translateOffsetForScroll(
      sc,
      Offset(
        MediaQuery.of(targetCtx).size.width / 2,
        MediaQuery.of(targetCtx).size.height / 2,
      ),
    );
    var targetRect = _getTargetRect(targetCtx);
    if (targetRect == null) return Alignment.center;
    double alX = (targetRect.left < screenCenterPos.dx) ? 1 : -1;
    double alY = (targetRect.top < screenCenterPos.dy) ? 1 : -1;
    return Alignment(alX,alY);
  }

  void _updateParentQuillTextNode({
    required QuillTargetModel updatedTargetConfig,
    required QuillTextNode parentSNode,
    BuildContext? targetCtx, // only set when not deleting
    bool deleteTarget = false,
  }) {
    //create a temparary controller to parse the text field
    final doc = Document.fromJson(jsonDecode(parentSNode.deltaJsonString));
    final qC = QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
    );

    // --- STRATEGY: FIND, THEN MODIFY ---

    // PHASE 1: FIND THE OFFSET
    int? targetOffset; // Variable to store the offset

    // We need a way to break out of the outer loop, a label is good for this.
    searchLoop:
    for (final node in qC.document.root.children) {
      if (node is Line) {
        for (final leaf in node.children) {
          // Check if the leaf is our specific embed type
          if (leaf is Embed) {
            var embed = jsonDecode(leaf.value.data);
            if (embed != null) {
              try {
                final oldQTJson = jsonDecode(embed['quill-help-icon-button']);
                final oldQT = QuillTargetModelMapper.fromMap(oldQTJson);
                // Compare UIDs to find the exact embed we want to update
                if (oldQT.uid == updatedTargetConfig.uid) {
                  // We found it! Store the offset and exit the loops.
                  targetOffset = leaf.documentOffset;
                  break searchLoop; // Exit both the inner and outer loops
                }
              } catch (e) {
                // Ignore embeds with invalid data
                continue;
              }
            }
          }
        }
      }
    }

    // PHASE 2: MODIFY (only if we found the offset)
    if (targetOffset != null) {
      qC.replaceText(
        targetOffset,
        1, // An embed has a length of 1
        deleteTarget
            ? ''
            : BlockEmbed.custom(
                CustomBlockEmbed(
                  'quill-help-icon-button',
                  updatedTargetConfig
                      .toJson(), // Use the generated toJson() for cleaner code
                ),
              ),
        null, // No text selection change needed
      );
    }

    // c. Save the entire updated document back to the parent node.
    parentSNode.deltaJsonString = jsonEncode(
      qC.document.toDelta().toJson(),
    );

    qC.dispose();

    // d. Trigger a save to your backend/database.
    var snippet = parentSNode.rootNodeOfSnippet();
    if (snippet != null) {
      fco.modelRepo.saveNewVersionOfSnippet(snippet);
    }

    if (!deleteTarget) {
      WrappedCallout.unhideParentCallout(targetCtx!);
    }
  }

  @override
  WidgetSpan buildWidgetSpan(Widget widget) {
    return WidgetSpan(
      child: widget,
      // baseline and alignment ensure the icon doesn't "float" above the text
      alignment: PlaceholderAlignment.middle,
    );
  }

  @override
  bool get expanded => false; //inline

  @override
  String toPlainText(Embed node) {
    // TODO: implement toPlainText
    throw UnimplementedError();
  }
}
