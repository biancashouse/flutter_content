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
  List<PTreeNode> properties(BuildContext context) => [];

  Step toStep(BuildContext context, int index, FCStepperState parent) {
    setParent(parent.widget.stepperNode);
    possiblyHighlightSelectedNode();
     return Step(
       isActive: parent.currentStep >= index,
      title: title.toWidgetProperty(context, this) ?? fco.coloredText('must have a title', color: Colors.red),
      subtitle: subtitle?.toWidgetProperty(context, this),
      content: content.toWidgetProperty(context, this) ?? fco.coloredText('must have content', color: Colors.red),
    );
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  List<Widget> menuAnchorWidgets_WrapWith(VoidCallback enterEditModeF, exitEditModeF,NodeAction action, bool? skipHeading) {
    return [
      if (getParent() is! StepperNode) ...super.menuAnchorWidgets_Heading(action),
      if (getParent() is! StepperNode) menuItemButton(enterEditModeF, exitEditModeF,"Stepper", StepperNode, action),
    ];
  }

  @override
  bool canBeDeleted() => true;

  @override
  List<Type> replaceWithOnly() => [StepNode];

  @override
  List<Type> wrapCandidates() => [StepperNode];

  @override
  List<Type> wrapWithOnly() => [StepperNode];

  @override
  List<Type> insertSiblingOnly() => [StepNode];


  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Step";
}
