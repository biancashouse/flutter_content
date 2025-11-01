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
  String? scrollControllerName; // creates one if not null
  List<SNode> children;

  ListViewNode({super.padding, super.shrinkWrap, required this.children});

  @JsonKey(includeFromJson: false, includeToJson: false)
  // used when a TabBar and TabBarView are used in a snippet's Scaffold
  ScrollController? _sc;

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
    StringPNode(
      snode: this,
      name: 'ScrollController name',
      stringValue: scrollControllerName,
      skipHelperText: true,
      onStringChange: (newValue) {
        scrollControllerName = newValue;
        refreshWithUpdate(context, () => scrollControllerName!);
      },
      calloutButtonSize: const Size(280, 70),
      calloutWidth: 400,
      numLines: 1,
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    var scName = EditablePage.maybeScrollControllerName(context);
    var sc = EditablePage.maybeScrollController(context);

    setParent(parentNode);
    if (true || scrollControllerName != null) {
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
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
            controller: sc, //_sc ??= ScrollController(initialScrollOffset: 0.0),
            padding: padding?.toEdgeInsets(),
            children: listViewChildren,
          );
        },
      );
    } else {
      return Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red,
        size: 16,
        errorMsg: 'You must give the ScrollController a name',
      );
    }
  }

  @override
  bool canAppendAChild() => true;

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "ListView";
}
