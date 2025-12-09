import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'size_model.mapper.dart';

@MappableClass()
class SizeModel extends Size with SizeModelMappable {
  const SizeModel(super.width, super.height);
}
