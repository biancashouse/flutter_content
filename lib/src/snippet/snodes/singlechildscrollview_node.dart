import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'singlechildscrollview_node.mapper.dart';

@MappableClass()
class SingleChildScrollViewNode extends SC
    with SingleChildScrollViewNodeMappable {
  EdgeInsetsValue? padding;

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
    try {
      setParent(parentNode);
      possiblyHighlightSelectedNode();
      //var targetGK = nodeWidgetGK;

      // maintain offset between instantiations
      NamedScrollController? sC;
      if (EditablePage.of(context) != null) {
            String editablePageName = EditablePage.name(context);
            sC = NamedScrollController(
              editablePageName,
              Axis.vertical,
              initialScrollOffset:
                  NamedScrollController.vScrollOffset(editablePageName),
            );
            // sC.listenToOffset();
          }

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
    } catch (e) {
     return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
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
