// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'stepper_node.mapper.dart';

@MappableClass()
class StepperNode extends MC with StepperNodeMappable {
  String? name; // required iot allocate snippet names to step widgets (title, subtitle and content)

  StepperNode({
    this.name,
    required super.children, // can only be StepNodes
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) =>
      [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          expands: false,
          calloutButtonSize: const Size(280, 20),
          calloutSize: const Size(280, 80),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode(context);
    List<STreeNode> children = super.children;
    List<Step> steps = [];
    for (STreeNode childNode in children) {
      if (childNode is StepNode) {
        steps.add(childNode.toStep(context));
      }
    }
    return possiblyCheckHeightConstraint(
      parentNode,
      Stepper(
        key: nodeWidgetGK,
        steps: [],
      ),
    );
  }


  @override
  String toSource(BuildContext context) {
    return '''Stepper(
        children: ${children.map((node) => node.toSource(context)).toList()},
      )''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Stepper";
}
