import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/edge_insets_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'singlechildscrollview_node.mapper.dart';

@MappableClass()
class SingleChildScrollViewNode extends SC
    with SingleChildScrollViewNodeMappable {
  EdgeInsetsValue? padding;

  SingleChildScrollViewNode({
    this.padding,
    super.child,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  // used when a TabBar and TabBarView are used in a snippet's Scaffold
  ScrollControllerName? _scName;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'SingleChildScrollView',
            webLink:
                'https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html',
            snode: this,
            name: 'fyi'),
        StringPNode(
          snode: this,
          name: 'ScrollController name',
          stringValue: _scName,
          skipHelperText: true,
          onStringChange: (newValue) {
            if (newValue != null) {
              _scName = newValue;
            } else {
              if (_scName != null) {
                NamedScrollController.instance(_scName!)?.dispose();
              }
              _scName = null;
            }
            refreshWithUpdate(context, () => _scName!);
          },
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 400,
          numLines: 1,
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
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode,
      ) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      //var targetGK = nodeWidgetGK;

      // // maintain offset between instantiations
      // NamedScrollController? sC;
      // if (EditablePage.of(context) != null) {
      //   String editablePageName = EditablePage.name(context);
      //   sC = NamedScrollController(
      //     editablePageName,
      //     Axis.vertical,
      //     initialScrollOffset:
      //         NamedScrollController.vScrollOffset(editablePageName),
      //   );
      //   // sC.listenToOffset();
      // }

      if (_scName != null) {
        // ensure scroll controller exists
        if (NamedScrollController.exists(_scName!)) {
          NamedScrollController(_scName!, Axis.vertical);
        }
        return SingleChildScrollView(
          key: createNodeWidgetGK(),
          // descendants of this view can access it by:
          // ScrollableState? scrollableState = Scrollable.of(context);
          // ScrollController? scrollController = scrollableState?.position.scrollController;
          controller: NamedScrollController.instance(_scName!),
          // key: targetGK,
          padding: padding?.toEdgeInsets(),
          child: child?.buildFlutterWidget(context, this),
        );
      } else {
        return Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg: 'You must give the ScrollController a name');
      }
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
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
