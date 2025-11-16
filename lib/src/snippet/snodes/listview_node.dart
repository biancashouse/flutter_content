// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../pnodes/edge_insets_pnode.dart';

part 'listview_node.mapper.dart';

@MappableClass()
class ListViewNode extends BoxScrollViewNode with ListViewNodeMappable {
  List<SNode> children;

  ListViewNode({super.padding, super.shrinkWrap, required this.children});

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'ListView',
      webLink: 'https://api.flutter.dev/flutter/widgets/ListView-class.html',
      snode: this,
      name: 'fyi',
    ),
    PNode /*Group*/ (
      snode: this,
      name: 'padding',
      children: [
        EdgeInsetsPNode(
          snode: this,
          name: 'padding',
          eiValue: padding,
          onEIChangedF: (newValue) {
            padding = newValue;
          },
        ),
      ],
    ),
    ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
   return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight == double.infinity) {
            return Error(
              key: createNodeWidgetGK(),
              "${toString()} $uid",
              color: Colors.red,
              size: 16,
              errorMsg:
                  "Parent ${toString()} has an infinite 'maxHeight'} Constraints Error!",
            );
          }
          List<Widget> listViewChildren = children
              .map((childNode) => childNode.buildFlutterWidget(context, this))
              .toList();
          return ListView(
            key: createNodeWidgetGK(),
            controller: sc,
            shrinkWrap: shrinkWrap??false,
            padding: padding?.toEdgeInsets(),
            children: listViewChildren,
          );
        },
      );

  }

  @override
  bool canAppendAChild() => true;

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "ListView";
}
