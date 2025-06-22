// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
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
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'MultiSplitView',
        webLink:
        'https://pub.dev/packages/multi_split_view',
        snode: this,
        name: 'fyi'),
    EnumPNode<AxisEnum?>(
          snode: this,
          name: 'axis',
          valueIndex: axis.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,
              () => axis = AxisEnum.of(newValue) ?? AxisEnum.horizontal),
        ),
        BoolPNode(
          snode: this,
          name: 'resizeable',
          boolValue: resizeable,
          onBoolChange: (newValue) =>
              refreshWithUpdate(context,() => resizeable = newValue ?? true),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       Container(
  //         color: Colors.purple,
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           children: [
  //             FCO.coloredText('axis:', color: Colors.white),
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
  Widget toWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    Axis svAxis = axis.flutterValue;
    try {
      return LayoutBuilder(builder: (context, constraints) {
        if ((svAxis == Axis.vertical &&
                constraints.maxHeight == double.infinity) ||
            (svAxis == Axis.horizontal &&
                constraints.maxWidth == double.infinity)) {
          return Error(key: createNodeWidgetGK(), FLUTTER_TYPE,
              color: Colors.red,
              size: 16,
              errorMsg: 'MultiSplitView has infinite constraint!');
        } else {
          List<Area> areas = super
              .children
              .map(
                (child) => Area(builder: (ctx, area) {
                  return child.toWidget(context, this);
                }),
              )
              .toList();
          return MultiSplitViewTheme(
            data: MultiSplitViewThemeData(
                dividerPainter: DividerPainters.grooved1(
                    color: Colors.indigo[100]!,
                    highlightedColor: Colors.indigo[900]!)),
            child: MultiSplitView(
              key: createNodeWidgetGK(),
              axis: svAxis,
              initialAreas: areas,
            ),
          );
        }
      });
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  @override
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SplitView";
}
