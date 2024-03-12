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

  EdgeInsets toEdgeInsets() => EdgeInsets.only(
    left:left, top:top, bottom:bottom, right:right
  );
}
