import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snippet_map_model.mapper.dart';

@MappableClass()
class SnippetMapModel with SnippetMapModelMappable {
  SnippetMap snippets;
  SnippetMapModel(
    this.snippets,
  );
}
