// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/flutter_polls/flutter_poll_option.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

part 'poll_option_node.mapper.dart';

@MappableClass()
class PollOptionNode extends CL with PollOptionNodeMappable {
  String text;

  PollOptionNode({
    required this.text,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'PollOption',
        webLink:
        'https://pub.dev/documentation/flutter_polls/latest/flutter_polls/PollOption-class.html',
        snode: this,
        name: 'fyi'),
    StringPNode(
          snode: this,
          name: 'text',
          stringValue: text,
          onStringChange: (newValue) =>
              refreshWithUpdate(context,() => text = newValue ?? ''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    try {
      setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
      if (getParent() is PollNode) {
        PollNode parentPoll = getParent() as PollNode;
        int pos = parentPoll.children.indexOf(this);
        return FlutterPollOption(
          key: createNodeWidgetGK(),
          optionId: pos.toString(),
          optionWidget: Text(text),
          scName: scName,
        );
      } else {
        return Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg: "getParent() is not a PollNode!");
      }
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
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
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "PollOption";
}
