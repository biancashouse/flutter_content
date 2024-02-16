// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/stepper_with_controller.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

part 'step_node.mapper.dart';

@MappableClass()
class StepNode extends CL with StepNodeMappable {
  GenericSingleChildNode title;
  GenericSingleChildNode subtitle;
  GenericSingleChildNode content;

  StepNode({
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [];

  Step toStep(BuildContext context, int index, FCStepperState parent) {
     return Step(
      // key: nodeGK,
       isActive: parent.currentStep >= index,
      title: title.toWidgetProperty(context, this),
      subtitle: subtitle.toWidgetProperty(context, this),
      content: content.toWidgetProperty(context, this),
       label: Text('monkey'),
    );
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Step";
}
