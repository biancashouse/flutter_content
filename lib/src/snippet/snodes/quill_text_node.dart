// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/quill_text_pnode.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quill_text_node.mapper.dart';

const k_sampleDeltaJsonString = '''
    [
      {"insert":"Hello "},
      {"attributes":{"bold":true},"insert":"World"},
      {"insert":"!\\n"}
    ]
    ''';

@MappableClass()
class QuillTextNode extends CL with QuillTextNodeMappable {
  String deltaJsonString;

  QuillTextNode({this.deltaJsonString = k_sampleDeltaJsonString});

  @JsonKey(includeFromJson: false, includeToJson: false)
  final QuillController roQC = QuillController.basic()..readOnly = true;

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

    // Parse the JSON string into a List<Map<String, dynamic>>
    List<dynamic> jsonList = jsonDecode(deltaJsonString);

    // Create a QuillController and load the document from the JSON
    roQC.document = Document.fromJson(jsonList);

    return IgnorePointer(child: QuillEditor.basic(key: createNodeWidgetGK(), controller: roQC));
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "QuillText";
}
