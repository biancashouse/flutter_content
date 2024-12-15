// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/flutter_polls/flutter_poll_option.dart';

part 'poll_option_node.mapper.dart';

@MappableClass()
class PollOptionNode extends CL with PollOptionNodeMappable {
  String text;

  PollOptionNode({
    required this.text,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'text',
          stringValue: text,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => text = newValue ?? ''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
      possiblyHighlightSelectedNode();
      if (getParent() is PollNode) {
        PollNode parentPoll = getParent() as PollNode;
        int pos = parentPoll.children.indexOf(this);
        return FlutterPollOption(
          key: createNodeGK(),
          optionId: pos.toString(),
          optionWidget: Text(text),
        );
      } else {
        return Error(
            key: createNodeGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 32,
            errorMsg: "getParent() is not a PollNode!");
      }
    } catch (e) {
      return Error(
          key: createNodeGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 32,
          errorMsg: e.toString());
    }
  }

  // FlutterPollOption toPollOption(BuildContext context, STreeNode? parentNode) {
  //   parent = parentNode;  // propagating parents down from root
  //   possiblyHighlightSelectedNode();
  //   var targetGK = nodeWidgetGK;
  //
  //   return Icon(Icons.warning_amber)
  //   return PollOption(
  //     key: targetGK,
  //     id: text,
  //     title: Text(
  //       text,
  //     ),
  //     votes: votes ?? 0,
  //   );
  // }

  @override
  String toSource(BuildContext context) => '';

  @override
  List<Widget> menuAnchorWidgets_WrapWith(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (getParent() is! PollNode)
        ...super.menuAnchorWidgets_Heading(
          action,
          scName,
        ),
      if (getParent() is! PollNode)
        menuItemButton("Poll", PollNode, action, scName),
    ];
  }

  @override
  List<Type> replaceWithOnly() => [PollOptionNode];

  @override
  List<Type> wrapCandidates() => [PollNode];

  @override
  List<Type> wrapWithOnly() => [PollNode];

  @override
  List<Type> insertSiblingOnly() => [PollOptionNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "PollOption";
}
