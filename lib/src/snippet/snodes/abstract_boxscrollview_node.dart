import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/edge_insets_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/abstract_scrollview_node.dart';

import '../pnodes/fyi_pnodes.dart';

part 'abstract_boxscrollview_node.mapper.dart';

@MappableClass(discriminatorKey: 'DK:boxscrollview', includeSubClasses: [ListViewNode, GridViewNode])
abstract class BoxScrollViewNode extends ScrollViewNode with BoxScrollViewNodeMappable {
  EdgeInsetsValue? padding;

  BoxScrollViewNode({
    super.scrollDirection,
    super.shrinkWrap,
    this.padding,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'BoxScrollView',
      webLink: 'https://api.flutter.dev/flutter/widgets/BoxScrollView-class.html',
      snode: this,
      name: 'fyi',
    ),
    ...super.propertyNodes(context, parentSNode),

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

}
