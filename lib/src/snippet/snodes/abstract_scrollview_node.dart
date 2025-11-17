import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/custom_scrollview_node.dart';
import 'package:flutter_content/src/snippet/snodes/pageview_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../pnodes/fyi_pnodes.dart';
import 'abstract_boxscrollview_node.dart';

part 'abstract_scrollview_node.mapper.dart';

@MappableClass(discriminatorKey: 'DK:scrollview', includeSubClasses: [BoxScrollViewNode,CustomScrollViewNode])
abstract class ScrollViewNode extends CL with ScrollViewNodeMappable {
  AxisEnum scrollDirection;
  bool? shrinkWrap;

  ScrollViewNode({
    this.scrollDirection = AxisEnum.vertical,
    this.shrinkWrap,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  ScrollController sc = ScrollController();

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'ScrollView',
      webLink: 'https://api.flutter.dev/flutter/widgets/ScrollView-class.html',
      snode: this,
      name: 'fyi',
    ),
    EnumPNode<AxisEnum?>(
      snode: this,
      name: 'scrolDirection',
      valueIndex: scrollDirection.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => scrollDirection = AxisEnum.of(newValue) ?? AxisEnum.vertical,
      ),
    ),
    BoolPNode(
      snode: this,
      name: 'shrinkWrap',
      boolValue: shrinkWrap,
      onBoolChange: (newValue) =>
          refreshWithUpdate(context, () => shrinkWrap = newValue),
    ),
  ];

  @override
  bool canAppendAChild() => true;

}
