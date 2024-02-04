import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

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
    left:left??0, top:top??0, bottom:bottom??0, right:right??0
  );
}
