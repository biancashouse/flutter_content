// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/stepper_with_controller.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stepper_type.dart';

part 'stepper_node.mapper.dart';

@MappableClass()
class StepperNode extends MC with StepperNodeMappable {
  StepperTypeEnum type;
  String? name; // required iot allocate snippet names to step widgets (title, subtitle and content)

  StepperNode({
    this.type = StepperTypeEnum.vertical,
    this.name,
    required super.children, // can only be StepNodes
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) =>
      [
        EnumPropertyValueNode<StepperTypeEnum?>(
          snode: this,
          name: 'type',
          valueIndex: type.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => type = StepperTypeEnum.of(newValue) ?? StepperTypeEnum.vertical),
        ),
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
    return possiblyCheckHeightConstraint(
      parentNode,
      FCStepper(
        this,
        key: createNodeGK(),
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
