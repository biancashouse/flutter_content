// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_axis.dart';
import 'package:multi_split_view/multi_split_view.dart';

part 'split_view_node.mapper.dart';

@MappableClass()
class SplitViewNode extends MC with SplitViewNodeMappable {
  AxisEnum axis;
  bool resizeable;

  SplitViewNode({
    this.axis = AxisEnum.horizontal,
    this.resizeable = true,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        EnumPropertyValueNode<AxisEnum?>(
          snode: this,
          name: 'axis',
          valueIndex: axis.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => axis = AxisEnum.of(newValue) ?? AxisEnum.horizontal),
        ),
        BoolPropertyValueNode(
          snode: this,
          name: 'resizeable',
          boolValue: resizeable,
          onBoolChange: (newValue) => refreshWithUpdate(() => resizeable = newValue ?? true),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       Container(
  //         color: Colors.purple,
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           children: [
  //             Useful.coloredText('axis:', color: Colors.white),
  //             const SizedBox(width: 10),
  //             AxisEditor(
  //               originalValue: axis,
  //               onChangedF: (newValue) {
  //                 axis = newValue ?? AxisEnum.horizontal;
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ],
  //         ),
  //       )
  //     ];

  @override
  String toSource(BuildContext context) => '''MultiSplitView(
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
  ''';

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    Axis svAxis = axis.flutterValue;
    try {
      return LayoutBuilder(builder: (context, constraints) {
        return (svAxis == Axis.vertical && constraints.maxHeight == double.infinity) || (svAxis == Axis.horizontal && constraints.maxWidth == double.infinity)
            ? Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  hspacer(10),
                  Useful.coloredText('MultiSplitView has infinite constraint!', color: Colors.red),
                ],
              )
            : MultiSplitViewTheme(
                data: MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved1(color: Colors.indigo[100]!, highlightedColor: Colors.indigo[900]!)),
                child: MultiSplitView(
                  key: createNodeGK(),
                  axis: svAxis,
                  initialAreas: super
                      .children
                      .map(
                        (child) => Area(
                          builder: (ctx, area) {
                            return child.toWidget(context, this);
                          }
                        ),
                      )
                      .toList(),
                ),
              );
      });
    } catch (e) {
      debugPrint('cannot render $FLUTTER_TYPE!');
    }
    return const Icon(Icons.error, color: Colors.redAccent);
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SplitView";
}
