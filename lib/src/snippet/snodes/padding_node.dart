// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'edgeinsets_node_value.dart';

part 'padding_node.mapper.dart';

@MappableClass()
class PaddingNode extends SC with PaddingNodeMappable {
  EdgeInsetsValue? padding;

  PaddingNode({
    this.padding,
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        EdgeInsetsPropertyValueNode(
          snode: this,
          name: 'padding',
          eiValue: padding ?? EdgeInsetsValue(),
          onEIChangedF: (newValue) => refreshWithUpdate(() => padding = newValue),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    return Padding(
      key: createNodeGK(),
      padding: padding?.toEdgeInsets() ?? const EdgeInsets.all(8),
      child: child?.toWidget(context, this),
    );
  }

  // {
  //   EdgeInsets? paddingEI = (padding.top && !padding.left && padding.bottom && !padding.right)
  //       ? EdgeInsets.symmetric(vertical: padding)
  //       : (!padding.top && padding.left && !padding.bottom && padding.right)
  //           ? EdgeInsets.symmetric(horizontal: padding)
  //           : (padding.top && padding.left && padding.bottom && padding.right)
  //               ? EdgeInsets.all(padding)
  //               : EdgeInsets.only(
  //                   top: padding.top ? padding : 0.0,
  //                   left: padding.left ? padding : 0.0,
  //                   bottom: padding.bottom ? padding : 0.0,
  //                   right: padding.right ? padding : 0.0,
  //                 );
  //   highlightSelectedNode(context);
  //   return Padding(
  //     key: CAPIBloC.selectedNode == this ? Node.selectionGK : null,
  //     padding: paddingEI,
  //     child: child?.toWidget(context, this),
  //   );
  // }

  @override
  String toSource(BuildContext context) => '';

  //   String paddingEI = (paddingTop && !padding.left && padding.bottom && !paddingRight)
  //       ? 'EdgeInsets.symmetric(vertical: $padding)'
  //       : (!paddingTop && padding.left && !padding.bottom && paddingRight)
  //           ? 'EdgeInsets.symmetric(horizontal: $padding)'
  //           : (paddingTop && padding.left && padding.bottom && paddingRight)
  //               ? 'EdgeInsets.all($padding)'
  //               : '''EdgeInsets.only(
  //     top: ${paddingTop ? padding : 0.0},
  //     left: ${padding.left ? padding : 0.0},
  //     bottom: ${padding.bottom ? padding : 0.0},
  //     right: ${paddingRight ? padding : 0.0},
  //   )''';
  //   return '''Padding(
  //     padding: ${paddingEI},
  //     child: ${child?.toSource(context)},
  //   )''';
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       // Container(
  //       //   //constraints: BoxConstraints(maxWidth: 180),
  //       //   color: Colors.purple,
  //       //   margin: EdgeInsets.only(top: 8.0),
  //       //   child: EdgeInsetsEditor(
  //       //     originalValue: padding,
  //       //     onChangedF: (
  //       //       newPaddingValue,
  //       //     ) {
  //       //       padding = newPaddingValue;
  //       //       bloc.add(const CAPIEvent.forceRefresh());
  //       //     },
  //       //   ),
  //       // ),
  //       // // NodePropertyButtonString(
  //       // //   label: 'padding',
  //       // //   originalValue: padding?.toString(),
  //       // //   calloutSize: const Size(140, 80),
  //       // //   onChangeF: (newPadding) {
  //       // //     padding = double.tryParse(newPadding);
  //       // //     bloc.add(const CAPIEvent.forceRefresh());
  //       // //   },
  //       // // ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Padding";
}
