import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singlechildscrollview_node.mapper.dart';

@MappableClass()
class SingleChildScrollViewNode extends SC
    with SingleChildScrollViewNodeMappable {
  EdgeInsetsValue? padding;

  @JsonKey(includeFromJson: false, includeToJson: false)
  double? scrollOffset;

  SingleChildScrollViewNode({
    this.padding,
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        PropertyGroup(
          snode: this,
          name: 'padding',
          children: [
            EdgeInsetsPropertyValueNode(
              snode: this,
              name: 'padding',
              eiValue: padding,
              onEIChangedF: (newValue) =>
                  refreshWithUpdate(() => padding = newValue),
            ),
          ],
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    //var targetGK = nodeWidgetGK;

    // maintain offset between instantiations
    final sC = ScrollController(
      initialScrollOffset: scrollOffset ?? 0.0,
    );
    sC.addListener(() {
      scrollOffset = sC.offset;
    });

    return SingleChildScrollView(
      key: createNodeGK(),
      // descendants of this view can access it by:
      // ScrollableState? scrollableState = Scrollable.of(context);
      // ScrollController? scrollController = scrollableState?.position.scrollController;
      controller: sC,
      // key: targetGK,
      padding: padding?.toEdgeInsets(),
      child: child?.toWidget(context, this),
    );
  }

  // @override
  // String toSource(BuildContext context) {
  //   // return '''SingleChildScrollView(
  //   //       padding: padding?.toEdgeInsets(),
  //   //     child: ${child?.toSource(context)},
  //   //   )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SingleChildScrollView";
}
