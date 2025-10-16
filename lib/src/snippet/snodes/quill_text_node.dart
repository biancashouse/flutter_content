// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/quill_text_pnode.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

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

    final linkStyle = DefaultStyles(
      link: const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.none, // This is the crucial part!
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return QuillEditor.basic(
        key: createNodeWidgetGK(),
        config: QuillEditorConfig(
          customStyles: linkStyle,
          scrollable: false,
          onLaunchUrl: (String url) {
            // quill seems to prepend https:// if not there already
            String newUrl = url.startsWith('https:///')
            ? url.substring(9)
            : url;
            if (newUrl.startsWith('http')) {
              launchUrl(Uri.parse(newUrl));
            } else {
              context.go(newUrl.startsWith('/') ? newUrl : '/$newUrl');
            }
          },
        ),
        controller: roQC,
      );
    });
    // quill editor's parent must provide a maxWidth constraiunt  that is not infinite
    // return parentNode is FlexibleNode || parentNode is ExpandedNode
    //     ? QuillEditor.basic(
    //         key: createNodeWidgetGK(),
    //         config: QuillEditorConfig(
    //           customStyles: linkStyle,
    //           scrollable: false,
    //         ),
    //         controller: roQC,
    //       )
    //     : Error(
    //         key: createNodeWidgetGK(),
    //         FLUTTER_TYPE,
    //         color: Colors.pink,
    //         size: 14,
    //         errorMsg:
    //             "Detected an unconstrained (infinite) cross-axis for this vertically scrolling container.\n\n"
    //             "This scenario is a common source of layout errors, especially when a TextField or Row "
    //             "is placed inside another Row or a ListView.\n\n"
    //             "The cross-axis for a vertically scrolling widget (like an editor) is its width.\n\n"
    //             "*** You need to wrap your QuillEditor inside a Flexible (or Expanded) widget ***",
    //       );
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "QuillText";
}
