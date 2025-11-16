import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/edge_insets_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'singlechildscrollview_node.mapper.dart';

@MappableClass()
class SingleChildScrollViewNode extends SC
    with SingleChildScrollViewNodeMappable {
  AxisEnum? scrollDirection;

  EdgeInsetsValue? padding;

  SingleChildScrollViewNode({
    this.scrollDirection,
    this.padding,
      // if not supplied, creates its own named scroll controller
    super.child,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  ScrollController _sc = ScrollController();

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'SingleChildScrollView',
      webLink:
          'https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html',
      snode: this,
      name: 'fyi',
    ),
    EnumPNode<AxisEnum?>(
      snode: this,
      name: 'scrollDirection',
      valueIndex: (scrollDirection ?? AxisEnum.vertical).index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => scrollDirection = AxisEnum.of(newValue) ?? AxisEnum.vertical,
      ),
    ),

    PNode /*Group*/ (
      snode: this,
      name: 'padding',
      children: [
        EdgeInsetsPNode(
          snode: this,
          name: 'padding',
          eiValue: padding,
          onEIChangedF: (newValue) =>
              refreshWithUpdate(context, () => padding = newValue),
        ),
      ],
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {

    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      //var targetGK = nodeWidgetGK;

      return SingleChildScrollView(
        key: createNodeWidgetGK(),
        controller: _sc,
        scrollDirection: scrollDirection?.flutterValue ?? Axis.vertical,
        // descendants of this view can access it by:
        // ScrollableState? scrollableState = Scrollable.of(context);
        // ScrollController? scrollController = scrollableState?.position.scrollController;
        // controller: sc,
        // key: targetGK,
        padding: padding?.toEdgeInsets(),
        child: child?.buildFlutterWidget(context, this),
      );
    } catch (e) {
      return Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
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
