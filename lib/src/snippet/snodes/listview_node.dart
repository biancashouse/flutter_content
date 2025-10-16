// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'listview_node.mapper.dart';

@MappableClass()
class ListViewNode extends MC with ListViewNodeMappable {
  bool? shrinkWrap;
  ListViewNode({
    this.shrinkWrap = false,
    required super.children,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'ListView',
        webLink: 'https://api.flutter.dev/flutter/widgets/listview-class.html',
        snode: this,
        name: 'fyi'),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      return LayoutBuilder(
        builder: (context, constraints) {
          bool constraintError = constraints.maxHeight == double.infinity;
          return constraintError
              ? Error(
            key: createNodeWidgetGK(),
            "${toString()} ${uid}",
            color: Colors.red,
            size: 16,
            errorMsg:
            "Parent ${toString()} has an infinite 'maxHeight'} Constraints Error!",
          )
              : ListView(
            key: createNodeWidgetGK(),
            children: children
                .map(
                  (childNode) =>
                  childNode.buildFlutterWidget(context, this),
            )
                .toList(),
          );
        },
      );
    } catch (e) {
      return Error(
        key: createNodeWidgetGK(),
        toString(),
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "ListView";
}
