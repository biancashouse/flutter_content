// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'aspect_ratio_node.mapper.dart';

@MappableClass()
class AspectRatioNode extends SC with AspectRatioNodeMappable {
  double aspectRatio;

  AspectRatioNode({
    this.aspectRatio = 1.0,
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'AssetImage',
        webLink: 'https://api.flutter.dev/flutter/painting/AssetImage-class.html',
        snode: this,
        name: 'fyi'),
    DecimalPNode(
          snode: this,
          name: 'aspectRatio',
          decimalValue: aspectRatio,
          onDoubleChange: (newValue) => refreshWithUpdate(context,() => aspectRatio = newValue ?? 1.0),
          calloutButtonSize: const Size(140, 30),
        ),
      ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);

      return AspectRatio(
        key: createNodeWidgetGK(),
        aspectRatio: aspectRatio,
        child: child?.buildFlutterWidget(context, this),
      );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  @override
  String toSource(BuildContext context) {
    return '''AspectRatio(
        width: $aspectRatio,
        child: ${child?.toSource(context)},
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       // SizedBox(height: 10),
  //       // NodePropertyButtonText(
  //       //     label: "aspectRatio",
  //       //     text: aspectRatio.toString(),
  //       //     calloutSize: const Size(600, 200),
  //       //     onChangeF: (s) {
  //       //       if (s.contains('/') && s.split('/').length == 2) {
  //       //         var split = s.split('/');
  //       //         double? w = double.tryParse(split[0]) ?? 1.0;
  //       //         double? h = double.tryParse(split[1]) ?? 1.0;
  //       //         aspectRatio = w / h;
  //       //       } else
  //       //         aspectRatio = double.tryParse(s) ?? 1.0;
  //       //       bloc.add(const CAPIEvent.forceRefresh());
  //       //     }),
  //       // // SizedBox(width: 90, height: 40,
  //       // //   child: DecimalEditor(
  //       // //     label: 'aspectRatio',
  //       // //     originalS: aspectRatio.toString() ?? '',
  //       // //     onChangedF: (newAR) {
  //       // //       aspectRatio = double.tryParse(newAR) ?? 1.0;
  //       // //       bloc.add(const CAPIEvent.forceRefresh());
  //       // //     },
  //       // //   ),
  //       // // ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "AspectRatio";
}
