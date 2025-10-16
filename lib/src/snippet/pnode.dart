// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class PNode extends Node {
  final PropertyName name;
  final String? tooltip;
  final SNode snode;
  List<PNode>? children;
  bool expanded;

  PNode({
    required this.name,
    this.tooltip,
    required this.snode,
    this.children,
    this.expanded = false,
  }) {
    fco.pNodes[name] = this;
    fco.logger.i('pNode:$name');
  }

  // a group, like TextStyleWithoutColorPNode can override to include current style
  String propertyLabel() => name;

  Widget toPropertyNodeContents(BuildContext context) {
    // not used in a property group node
    throw UnimplementedError();
  }

  void revertToOriginalValue() {}

  // selection always uses this gk
  static GlobalKey get selectedPropertyGK {
    if (_selectedPropertyGK.currentState == null) return _selectedPropertyGK;
    fco.logger.i(
        "_selectedPropertyGK in use: ${_selectedPropertyGK.currentWidget.runtimeType}");
    return GlobalKey(debugLabel: '_selectedPropertyGK was in use');
  }

  // static Callout get selectedPropertyWidget => _selectedPropertyWidget;

  // static set selectedPropertyWidget(Callout newObj) => _selectedPropertyWidget = newObj;

  // static late Callout _selectedPropertyWidget;
  static final GlobalKey _selectedPropertyGK =
      GlobalKey(debugLabel: "PTreeNode.selectionGK");

  static Iterable<PNode> propertyTreeChildrenProvider(PNode node) {
    // // custom logic to hide style props when a named style prop is not null
    // if (node.snode is TextSpanNode) {
    //   TextSpanNode tsNode = node.snode as TextSpanNode;
    //   if (tsNode.textStyleProperties?.namedTextStyle != null)
    //     return [tsNode.textStyleProperties.];
    // }

    if (node.children != null /*Group*/ ) {
      // named text style hides individual text style properties
      // if (node is TextStylePropertyGroup) {
      //   var namedTextStyleNode = node.children.toList().firstWhere((tsgNode){return tsgNode.name == 'namedTextStyle';});
      //   if (namedTextStyleNode is StringPNode && namedTextStyleNode.stringValue != null) {
      //     return [namedTextStyleNode];
      //   }
      // }
      // ditto for button styles
      // if (node is ButtonStylePNode/*Group*/) {
      //   var namedButtonStyleNode = node.children!.toList().firstWhere((tsgNode){return tsgNode.name == 'namedButtonStyle';});
      //   if (namedButtonStyleNode is StringPNode && namedButtonStyleNode.stringValue != null) {
      //     return [namedButtonStyleNode];
      //   }
      // }
      return node.children!;
    }

    return [];
  }

}