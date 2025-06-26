// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/stepper_with_controller.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stepper_type.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

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
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'Stepper',
            webLink:
                'https://api.flutter.dev/flutter/material/Stepper-class.html',
            snode: this,
            name: 'fyi'),
        EnumPNode<StepperTypeEnum?>(
          snode: this,
          name: 'type',
          valueIndex: type.index,
          onIndexChange: (newValue) => refreshWithUpdate(
              context,
              () => type =
                  StepperTypeEnum.of(newValue) ?? StepperTypeEnum.vertical),
        ),
        StringPNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => name = newValue),
          expands: false,
          calloutButtonSize: const Size(280, 20),
          calloutWidth: 280,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      ) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      return possiblyCheckHeightConstraint(
        parentNode,
        FCStepper(
          this,
          key: createNodeWidgetGK(),
        ),
      );
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
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

  // @override
  // List<Type> addChildOnly() => [StepNode];

  @override
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Stepper";
}
