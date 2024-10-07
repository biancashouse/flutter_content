// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/flutter_polls/flutter_poll.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/date_range_button.dart';
import 'package:gap/gap.dart';

part 'poll_node.mapper.dart';

// poll must always have first child richtext as the title
@MappableClass()
class PollNode extends MC with PollNodeMappable {
  String name;
  String title;
  int? startDate;
  int? endDate;
  EmailAddress? createdBy;
  List<EmailAddress> voterPool;
  bool locked;

  PollNode({
    this.name = '',
    this.title = '',
    this.startDate,
    this.endDate,
    this.createdBy,
    this.voterPool = const [],
    this.locked = false,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          expands: false,
          numLines: 1,
          // skipHelperText: true,
          // skipLabelText: true,
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue??''),
          calloutButtonSize: const Size(300, 20),
          calloutWidth: 300,
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'title',
          stringValue: title,
          expands: false,
          numLines: 3,
          onStringChange: (newValue) => refreshWithUpdate(() => title = newValue??''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 300,
        ),
        DateRangePropertyValueNode(
          snode: this,
          name: 'duration',
          fromValue: startDate,
          untilValue: endDate,
          onRangeChange: (DateRange? newValues) => refreshWithUpdate(() {
            if (newValues != null) {
              DateTime startDT = DateTime.fromMillisecondsSinceEpoch(newValues.from!);
              DateTime startDTMorning = DateTime(
                startDT.year,
                startDT.month,
                startDT.day,
              );
              startDate = startDTMorning.millisecondsSinceEpoch;
              DateTime endDT = DateTime.fromMillisecondsSinceEpoch(newValues.until!);
              DateTime untilDTMidnight = DateTime(
                endDT.year,
                endDT.month,
                endDT.day,
                23,59,59
              );
              endDate = untilDTMidnight.millisecondsSinceEpoch;
            } else {
              startDate = null;
              endDate = null;
            }
          }),
        ),
        // StringPropertyValueNode(
        //   snode: this,
        //   name: 'voter pool',
        //   nameOnSeparateLine: true,
        //   stringValue: voterPool.toString(),
        //   onStringChange: (newValue) => refreshWithUpdate(() => voterPoolCSV),
        //   calloutButtonSize: const Size(280, 70),
        //   calloutSize: const Size(280, 140),
        // ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();

    // find
    return LayoutBuilder(
      builder: (context, constraints) {
        List<Widget> optionWidgets = [];
        for (int i=0; i<children.length; i++) {
          PollOptionNode optionNode = children[i] as PollOptionNode;
          optionWidgets.add(optionNode.toWidget(context, this));
        }
        return constraints.maxHeight == double.infinity
            ? const Row(
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  Gap(10),
                  Text('Poll has infinite maxHeight constraint!'),
                ],
              )
            : Container(width: 300, height:100.0 + 60.0*(children.length),
              child: FlutterPoll(
                key: createNodeGK(),
                poll: this,
                titleWidget: Center(child: fco.coloredText(title, color: Colors.blue[900], fontSize: 24, fontWeight: FontWeight.bold)),
                startDate: startDate,
                endDate: endDate,
                children: optionWidgets,
              ),
            );
      },
    );
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  @override
  List<Widget> menuAnchorWidgets_Append(NodeAction action, bool? skipHeading) {
    return [
      ...super.menuAnchorWidgets_Heading(action),
      menuItemButton("PollOption", PollOptionNode, action),
    ];
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Poll";
}
