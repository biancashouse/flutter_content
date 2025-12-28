// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_quill_text.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/quill_text_pnode.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import 'focus_aware_quill_editor.dart';

part 'quill_text_node.mapper.dart';

const k_sampleDeltaJsonString = '''
    [
      {"insert":"Hello "},
      {"attributes":{"bold":true},"insert":"World"},
      {"insert":"!\n"}
    ]
    ''';

@MappableClass()
class QuillTextNode extends CL with QuillTextNodeMappable {
  String deltaJsonString;

  QuillTextNode({this.deltaJsonString = k_sampleDeltaJsonString});

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    return [
      FlutterDocPNode(
        buttonLabel: 'Quill',
        webLink: 'https://pub.dev/packages/flutter_quill',
        snode: this,
        name: 'fyi',
      ),
      QuillTextPNode(
        snode: this,
        name: 'data',
        deltaValue: deltaJsonString,
        onDeltaChange: (String? newValue) {
          refreshWithUpdate(context, () => deltaJsonString = newValue ?? '');
        },
        calloutButtonSize: const Size(280, 3000),
        calloutWidth: fco.scrW * .8,
        calloutHeight: fco.scrH * .8,
      ),
    ];
  }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);

    Widget editor;
    if (fco.canEditContent() && fco.snippetBeingEdited == null) {
      editor = FocusAwareQuillEditor(
        initialDeltaJson: deltaJsonString,
        onChange: (String newValue) {
          // save
          final rootNode = rootNodeOfSnippet();
          if (rootNode != null) {
            deltaJsonString = newValue;
            final newVersionId = SnippetInfoModel.createNewVersion(rootNode);
            fco.modelRepo.saveSnippetVersion(
              snippetName: rootNode.name,
              newVersionId: newVersionId,
              newVersion: rootNode,
            );
          }
        },
        onEditWithToolbarBtnPressed: () {
          final rootNode = rootNodeOfSnippet();
          if (rootNode != null) {
            PropertyButtonQuillText.showQuillEditor(deltaJsonString, (
              String? newValue,
            ) {
              refreshWithUpdate(
                context,
                () => deltaJsonString = newValue ?? '',
              );
              fco.forceRefresh();
            });
          }
        },
      );
    } else {
      editor = QuillViewer(deltaJsonString: deltaJsonString);
    }

    // for safety, if parent is a flex, wrap with an Expanded widget
    return parentNode is FlexNode ? Expanded(child: editor) : editor;
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "QuillText";
}
