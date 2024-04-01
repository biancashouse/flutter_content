import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_model.mapper.dart';

@MappableClass()
class AppModel with AppModelMappable {
  BranchName currentBranchName;
  Map<BranchName, BranchModel> branches;
  EncodedJson? clipboard;
  AppModel({
    this.currentBranchName = 'staging',
    this.branches = const {},
    this.clipboard,
  });
}
