import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'sizedbox_node.mapper.dart';

@MappableClass()
class SizedBoxNode extends SC with SizedBoxNodeMappable {
  double? width;
  double? height;

  SizedBoxNode({
    this.width,
    this.height,
    super.child,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'SizedBox',
        webLink:
        'https://api.flutter.dev/flutter/widgets/SizedBox-class.html',
        snode: this,
        name: 'fyi'), DecimalPNode(
          snode: this,
          name: 'width',
          decimalValue: width,
          onDoubleChange: (newValue) => refreshWithUpdate(context,() => width = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPNode(
          snode: this,
          name: 'height',
          decimalValue: height,
          onDoubleChange: (newValue) => refreshWithUpdate(context,() => height = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    // var targetGK = nodeWidgetGK;
    return SizedBox(
      // key: targetGK,
      key: createNodeWidgetGK(),
      width: width,
      height: height,
      child: child?.toWidget(context, this),
    );
  }

  @override
  String toSource(BuildContext context) {
    return '''SizedBox(
        width: $width,
        height: $height,
        child: ${child?.toSource(context)},
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       SizedBox(height: 10),
  //       Row(
  //         children: [
  //           SizedBox(
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
  //           SizedBox(width: 10),
  //           SizedBox(
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

  static const String FLUTTER_TYPE = "SizedBox";
}
