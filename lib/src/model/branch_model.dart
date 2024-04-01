import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch_model.mapper.dart';

@MappableClass()
class BranchModel with BranchModelMappable {
  BranchName name;
  VersionId? latestVersionId;

  // EncodedSnippetJson? initialVersion;

  List<VersionId> undos; // on app startup, an undo is performed to set the current state
  List<VersionId> redos;
  List<VersionId> discardeds;

  BranchModel({
    required this.name,
    this.latestVersionId,
    // this.initialVersion,
    this.undos = const [],
    this.redos = const [],
    this.discardeds = const [],
  });
}
