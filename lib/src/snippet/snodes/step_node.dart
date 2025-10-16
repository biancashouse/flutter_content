// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/stepper/stepper_with_controller.dart';

part 'step_node.mapper.dart';

@MappableClass()
class StepNode extends CL with StepNodeMappable {
  NamedSC title;
  NamedSC? subtitle;
  NamedSC content;

  StepNode({
    required this.title,
    this.subtitle,
    required this.content,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [];

  Step toStep(BuildContext context, int index, FCStepperState parent) {
    setParent(parent.widget.stepperNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    return Step(
      isActive: parent.currentStep >= index,
      title: title.buildFlutterWidget(context, this) ??
          fco.coloredText('must have a title', color: Colors.red),
      subtitle: subtitle?.buildFlutterWidget(context, this),
      content: content.buildFlutterWidget(context, this) ??
          fco.coloredText('must have content', color: Colors.red),
    );
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  List<Widget> menuAnchorWidgets_WrapWith(BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (getParent() is! StepperNode)
        ...super.menuAnchorWidgets_Heading(context, action, scName),
      if (getParent() is! StepperNode)
        menuItemButton(context, "Stepper", StepperNode, action, scName),
    ];
  }

  @override
  List<Type> replaceWithOnly() => [StepNode];

  @override
  List<Type> wrapCandidates() => [StepperNode];

  @override
  List<Type> wrapWithOnly() => [StepperNode];

  @override
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Step";
}
