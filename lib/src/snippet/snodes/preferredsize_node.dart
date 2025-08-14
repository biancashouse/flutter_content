import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'preferredsize_node.mapper.dart';

@MappableClass()
class PreferredSizeNode extends SC with PreferredSizeNodeMappable {
  double width;
  double height;

  PreferredSizeNode({
    required this.width,
    required this.height,
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'PreferredSize',
        webLink:
        'https://api.flutter.dev/flutter/widgets/PreferredSize-class.html',
        snode: this,
        name: 'fyi'), DecimalPNode(
          snode: this,
          name: 'width',
          decimalValue: width,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => width = newValue ?? double.infinity),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'height',
          decimalValue: height,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => height = newValue ?? double.infinity),
          calloutButtonSize: const Size(80, 20),
        ),
      ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    // var targetGK = nodeWidgetGK;
    return PreferredSize(
      // key: targetGK,
      key: createNodeWidgetGK(),
      preferredSize: Size(width, height),
      child: child?.buildFlutterWidget(context, this) ??
          Error(
              key: createNodeWidgetGK(),
              FLUTTER_TYPE,
              color: Colors.orange,
              size: 16,
              errorMsg: 'preferredSize must have a child widget'),
    );
  }

  @override
  String toSource(BuildContext context) {
    return '''PreferredSize(
        width: $width,
        height: $height,
        child: ${child?.toSource(context)},
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       PreferredSize(height: 10),
  //       Row(
  //         children: [
  //           PreferredSize(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'width',
  //               originalS: width?.toString() ?? '',
  //               onChangedF: (newWidth) {
  //                 width = double.tryParse(newWidth);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           PreferredSize(width: 10),
  //           PreferredSize(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'height',
  //               originalS: height?.toString() ?? '',
  //               onChangedF: (newHeight) {
  //                 height = double.tryParse(newHeight);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "PreferredSize";
}
