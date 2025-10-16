import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'named_single_child_node.mapper.dart';

@MappableClass()
class NamedSC extends SC with NamedSCMappable {
  String propertyName;

  // Widget property name, such as title, body, leading,bottom etc
  NamedSC({required this.propertyName, super.child});

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      var childWidget = child?.buildFlutterWidget(context, this);
      return childWidget ?? const Offstage();
    } catch (e) {
      fco.logger.i('snippetRoot.toWidget() failed!');
      return Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
    }
  }

  @override
  String toString() => propertyName;

  static const String FLUTTER_TYPE =
      "PropertyWidget"; //should be visible in the tree, but not rendered as a widget in the generated ui
}
