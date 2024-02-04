import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'content_snippet_root_node.mapper.dart';

@MappableClass()
class ContentSnippetRootNode extends SnippetRootNode with ContentSnippetRootNodeMappable {

  ContentSnippetRootNode({
    required super.name,
    super.isEmbedded,
    super.tags,
    super.child,
  });

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => null;

  static const String FLUTTER_TYPE = "Content";
}
