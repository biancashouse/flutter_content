// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/flutter_polls/flutter_poll.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/date_range_button.dart';

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

  PollNode({
    this.name = '',
    this.title = '',
    this.startDate,
    this.endDate,
    this.createdBy,
    this.voterPool = const [],
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          expands: false,
          numLines: 1,
          // skipHelperText: true,
          // skipLabelText: true,
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(300, 20),
          calloutSize: const Size(300, 80),
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'title',
          stringValue: title,
          expands: false,
          numLines: 3,
          onStringChange: (newValue) => refreshWithUpdate(() => title = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 140),
        ),
        DateRangePropertyValueNode(
          snode: this,
          name: 'duration',
          fromValue: startDate,
          untilValue: endDate,
          onRangeChange: (DateRange? newValues) => refreshWithUpdate(() {
            if (newValues != null) {
              startDate = newValues.from;
              endDate = newValues.until;
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
    possiblyHighlightSelectedNode(context);

    // find
    return LayoutBuilder(
      builder: (context, constraints) {
        List<Widget> optionWidgets = [];
        for (STreeNode optionNode in children) {
          optionWidgets.add(optionNode.toWidget(context, this));
        }
        return constraints.maxHeight == double.infinity
            ? Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  hspacer(10),
                  const Text('Poll has infinite maxHeight constraint!'),
                ],
              )
            : FlutterPoll(
              key: nodeWidgetGK,
              pollName: name,
              titleWidget: Center(child: Useful.coloredText(title, color: Colors.blue[900], fontSize: 24, fontWeight: FontWeight.bold)),
              startDate: startDate,
              endDate: endDate,
              children: optionWidgets,
            );
      },
    );
  }

  @override
  String toSource(BuildContext context) => '';

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Poll";
}
