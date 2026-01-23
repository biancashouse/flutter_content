// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/quill_text_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_viewer.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'widgets/focus_aware_quill_editor.dart';

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

  // keep transient copy of each Embed's  gk
  // @JsonKey(includeFromJson: false, includeToJson: false)
  // Map<String,GlobalKey> targetGks = {};

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
    // targetGks = {};

    setParent(parentNode);

    var gk = createNodeWidgetGK();

    Widget editor;
    if (fco.canEditContent() && fco.snippetBeingEdited == null) {
      editor = Material(
        child: FocusAwareQuillEditor(
          key: gk,
          parentSNode: this,
          uid: uid,
          originalDeltaJsonString: deltaJsonString,
          onChange: (String newValue, {bool forceRefresh = false}) {
            deltaJsonString = newValue;
            // no need to save - user must explicitly tap the triangle | save pending changes menu
            // final rootNode = rootNodeOfSnippet();
            // if (rootNode != null) {
              //fco.modelRepo.saveNewVersionOfSnippet(rootNode);
              // also broadcast change
              // SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(rootNode.name);
              // snippetInfo?.getChangeNotifier().value = rootNode.toJson();
// ?            }
            // do when adding a new info embed
            // if (forceRefresh) fco.forceRefresh();
          },
          // onEditWithToolbarBtnPressed: () {
          //   final rootNode = rootNodeOfSnippet();
          //   if (rootNode != null) {
          //     showQuillEditorOverlay(
          //       quillTextNode: this,
          //       onChangeF: (String? newValue) {
          //         refreshWithUpdate(
          //           context,
          //           () => deltaJsonString = newValue ?? '',
          //         );
          //         fco.forceRefresh();
          //       },
          //     );
          //   }
          // },
        ),
      );
    } else {
      editor = QuillViewer(key: gk, parentSNode: this);
    }

    // for safety, if parent is a flex, wrap with an Expanded widget
    return parentNode is FlexNode ? Expanded(child: editor) : editor;
  }

  // Assume you have a QuillController instance
  // final QuillController _controller = QuillController.basic();

  static List<QuillTargetModel> getTargetList(String deltaJsonString) {
    List<QuillTargetModel> targets = [];

    final doc = Document.fromJson(jsonDecode(deltaJsonString));

    // Convert the document to a list of JSON operations (Delta format)
    List<Map<String, dynamic>> ops = doc.toDelta().toJson();

    for (var op in ops) {
      // Check if the operation is an insert operation and contains an embed type
      if (op.containsKey('insert') && op['insert'] is Map) {
        Map<String, dynamic> insertData = op['insert'];

        // Look for known embed types like 'image', 'video', or custom types
        insertData.forEach((type, value) {
          if (type == 'custom') {
            final customMap = jsonDecode(value);
            if (customMap.containsKey('quill-help-icon-button')) {
              final embed = jsonDecode(customMap['quill-help-icon-button']);
              final qt = QuillTargetModelMapper.fromMap(embed);
              targets.add(qt);
            }
          }
        });
      }
    }

    return targets;
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "QuillText";
}
