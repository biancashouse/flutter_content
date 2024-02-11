// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

part 'step_node.mapper.dart';

@MappableClass()
class StepNode extends CL with StepNodeMappable {
  String titleSnippetName;
  String subtitleSnippetName;
  String contentSnippetName;

  StepNode({
    required this.titleSnippetName,
    required this.subtitleSnippetName,
    required this.contentSnippetName,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [];

  Step toStep(BuildContext context) {
    // highlightSelectedNode(context);

    STreeNode? titleSnippet = FC().rootNodeOfNamedSnippet(titleSnippetName);
    STreeNode? subtitleSnippet = FC().rootNodeOfNamedSnippet(subtitleSnippetName);
    STreeNode? contentSnippet = FC().rootNodeOfNamedSnippet(contentSnippetName);

    return Step(
      // key: nodeGK,
      title: titleSnippet?.toWidget(context, this) ?? Icon(Icons.warning_amber),
      subtitle: subtitleSnippet?.toWidget(context, this) ?? Icon(Icons.warning_amber),
      content: contentSnippet?.toWidget(context, this) ?? Icon(Icons.warning_amber),
    );
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Step";
}
