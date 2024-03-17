// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/stepper_with_controller.dart';

part 'step_node.mapper.dart';

@MappableClass()
class StepNode extends CL with StepNodeMappable {
  GenericSingleChildNode title;
  GenericSingleChildNode? subtitle;
  GenericSingleChildNode content;

  StepNode({
    required this.title,
    this.subtitle,
    required this.content,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [];

  Step toStep(BuildContext context, int index, FCStepperState parent) {
     return Step(
       isActive: parent.currentStep >= index,
      title: title.toWidgetProperty(context, this) ?? Useful.coloredText('must have a title', color: Colors.red),
      subtitle: subtitle?.toWidgetProperty(context, this),
      content: content.toWidgetProperty(context, this) ?? Useful.coloredText('must have content', color: Colors.red),
    );
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Step";
}
