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
  String?
      name; // required iot allocate snippet names to step widgets (title, subtitle and content)

  StepperNode({
    this.type = StepperTypeEnum.vertical,
    this.name,
    required super.children, // can only be StepNodes
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        EnumPropertyValueNode<StepperTypeEnum?>(
          snode: this,
          name: 'type',
          valueIndex: type.index,
          onIndexChange: (newValue) => refreshWithUpdate(() =>
              type = StepperTypeEnum.of(newValue) ?? StepperTypeEnum.vertical),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => name = newValue),
          expands: false,
          calloutButtonSize: const Size(280, 20),
          calloutWidth: 280,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      return possiblyCheckHeightConstraint(
        parentNode,
        FCStepper(
          this,
          key: createNodeGK(),
        ),
      );
    } catch (e) {
      return Error(
          key: createNodeGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 32,
          errorMsg: e.toString());
    }
  }

  @override
  String toSource(BuildContext context) {
    return '''Stepper(
        children: ${children.map((node) => node.toSource(context)).toList()},
      )''';
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  @override
  List<Widget> menuAnchorWidgets_Append(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(action, scName),
      menuItemButton("Step", StepNode, action, scName),
    ];
  }

  @override
  List<Type> addChildOnly() => [StepNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Stepper";
}
