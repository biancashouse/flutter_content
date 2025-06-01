import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'edgeinsets_node_value.mapper.dart';

@MappableClass()
class EdgeInsetsValue with EdgeInsetsValueMappable {
  double top;
  double left;
  double bottom;
  double right;

  EdgeInsetsValue({
    this.top = 0.0,

    this.left = 0.0,
    this.bottom = 0.0,
    this.right = 0.0,
  });

  @override
  operator ==(o) =>
      o is EdgeInsetsValue &&
      top == o.top &&
      left == o.left &&
      bottom == o.bottom &&
      right == o.right;

  @override
  int get hashCode => Object.hash(top, left, bottom, right);

  EdgeInsets toEdgeInsets() =>
      EdgeInsets.only(left: left, top: top, bottom: bottom, right: right);
}
