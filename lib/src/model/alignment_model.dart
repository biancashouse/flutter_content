import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'alignment_model.mapper.dart';

@MappableClass()
class AlignmentModel extends Alignment with AlignmentModelMappable {
  const AlignmentModel(super.x, super.y);
  String toStringAsFixed(int i) => '(${x.toStringAsFixed(i)},${y.toStringAsFixed(i)})';
}
