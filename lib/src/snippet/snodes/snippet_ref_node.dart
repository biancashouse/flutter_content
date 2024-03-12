import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_ref_node.mapper.dart';

@MappableClass()
class SnippetRefNode extends CL with SnippetRefNodeMappable {
  String snippetName;

  SnippetRefNode({
    required this.snippetName,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'snippetName',
          stringValue: snippetName,
          onStringChange: (newValue) => refreshWithUpdate(() => snippetName = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 140),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "snippet name",
  //           text: snippetName,
  //           calloutButtonSize: const Size(600, 200),
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             snippetName = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    try {
      var rootNode = FC().rootNodeOfNamedSnippet(snippetName);
      if (rootNode == null) return const Icon(Icons.error, color: Colors.red);
      return rootNode.toWidget(context, this);
    } catch (e) {
      debugPrint('cannot render $FLUTTER_TYPE!');
    }
    return const Icon(Icons.error, color: Colors.redAccent);
  }

  @override
  String toSource(BuildContext context) {
    return '''SnippetRef($snippetName)''';
  }

  @override
  String toString() => snippetName;

  @override
  Widget? logoSrc() => Row(children: [
        const Icon(Icons.link),
        hspacer(6),
      ]);

  static const String FLUTTER_TYPE = "Snippet...";
}
