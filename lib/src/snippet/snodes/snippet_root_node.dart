import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_root_node.mapper.dart';

@MappableClass(discriminatorKey: 'sr', includeSubClasses: [TitleSnippetRootNode, SubtitleSnippetRootNode, ContentSnippetRootNode])
class SnippetRootNode extends SingleChildNode with SnippetRootNodeMappable {
  SnippetName name;
  bool isEmbedded;
  String tags;

  SnippetRootNode({
    required this.name,
    this.isEmbedded = false,
    this.tags = '',
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 140),
        ),
        BoolPropertyValueNode(
          snode: this,
          name: 'isEmbedded',
          boolValue: isEmbedded,
          onBoolChange: (newValue) => refreshWithUpdate(() => isEmbedded = newValue ?? false),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'tags',
          stringValue: tags.toString(),
          onStringChange: (newValue) {
            refreshWithUpdate(() => tags = newValue);
          },
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 140),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) =>
      // root snippet - always has a gk so callout can point to it
      child?.toWidget(context, this) ?? const Icon(Icons.warning, color: Colors.red, size: 24);

  @override
  String toSource(BuildContext context) {
    return child?.toSource(context) ?? 'Icon(Icons.warning, color: Colors.red, size: 24,)';
  }

  SnippetRootNode cloneSnippet() {
    String jsonS = this.toJson();
    return STreeNodeMapper.fromJson(jsonS) as SnippetRootNode;
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => null;

  static const String FLUTTER_TYPE = "Snippet";
}
