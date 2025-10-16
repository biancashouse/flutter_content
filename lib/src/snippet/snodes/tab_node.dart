// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

part 'tab_node.mapper.dart';

// class TextStyleHook extends MappingHook {
//   const TextStyleHook();
//
//   @override
//   Object? beforeDecode(Object? value) {
//     return value ?? {'tsPropGroup': TextStyleProperties().toJson()};
//   }
// }

@MappableClass()
class TabNode extends SC with TabNodeMappable {
  String text;
  Widget? icon;
  EdgeInsetsValue? iconMargin;
  double? height;

  TabNode({
    this.text = '',
    this.icon,
    this.iconMargin,
    this.height,
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    // fco.logger.i('textStyleName is "$textStyleName"');
    return [
      FlutterDocPNode(
        buttonLabel: 'Tab',
        webLink: 'https://api.flutter.dev/flutter/material/Tab-class.html',
        snode: this,
        name: 'fyi',
      ),
      StringPNode(
        snode: this,
        name: 'text',
        nameOnSeparateLine: true,
        expands: true,
        numLines: 3,
        stringValue: text,
        onStringChange: (newValue) {
          refreshWithUpdate(context, () => text = newValue ?? '');
        },
        calloutButtonSize: const Size(280, 70),
        calloutWidth: 300,
      ),
      // DecimalPNode(
      //   snode: this,
      //   name: 'height',
      //   decimalValue: height,
      //   onDoubleChange: (newValue) =>
      //       refreshWithUpdate(context, () => height = newValue),
      //   calloutButtonSize: const Size(80, 20),
      // ),
      // PNode /*Group*/ (
      //   snode: this,
      //   name: "iconMargin",
      //   children: [
      //     EdgeInsetsPNode(
      //         snode: this,
      //         name: 'margin',
      //         eiValue: iconMargin,
      //         onEIChangedF: (newValue) {
      //           refreshWithUpdate(context, () => iconMargin = newValue);
      //         }),
      //   ],
      // ),
    ];
  }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);

    return Tab(
      key: createNodeWidgetGK(),
      text: text,
      icon: icon,
      iconMargin: iconMargin?.toEdgeInsets(),
      height: height,
      child: child?.buildFlutterWidget(context, this),
    );
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''Text(
  //       $text,
  //       style: ${textStyle?.toSource(context, namedTextStyle: namedTextStyle)},
  //       textAlign: ${textAlign?.toSource()},
  //     )''';
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Tab";
}
